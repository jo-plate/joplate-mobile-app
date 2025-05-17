import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joplate/injection/injector.dart';
import 'phone_form_state.dart';
import 'package:joplate/domain/dto/add_number_input.dart';
import 'package:joplate/domain/dto/add_listing_dto.dart';
import 'package:joplate/data/constants.dart';

class AddPhoneNumbersCubit extends Cubit<AddPhoneNumbersState> {
  AddPhoneNumbersCubit() : super(const AddPhoneNumbersState(forms: []));
  FirebaseAnalytics get analytics => injector<FirebaseAnalytics>();
  void addNewForm() {
    const newForm = PhoneFormState(
      number: '',
      price: '',
      withDiscount: false,
      discountPrice: null,
      isSubmitting: false,
      isFeatured: false,
      callForPrice: false,
      errorMessage: null,
    );
    emit(state.copyWith(forms: [...state.forms, newForm]));
  }

  void removeForm(int index) {
    final updated = [...state.forms];
    if (index >= 0 && index < updated.length) {
      updated.removeAt(index);
      emit(state.copyWith(forms: updated));
    }
  }

  void updateNumber(int index, String newNumber) {
    _updateForm(
      index,
      state.forms[index].copyWith(
        number: newNumber,
        errorMessage: null,
      ),
    );
  }

  void updatePrice(int index, String newPrice) {
    _updateForm(
      index,
      state.forms[index].copyWith(
        price: newPrice,
        errorMessage: null,
      ),
    );
  }

  void toggleDiscount(int index, bool enable) {
    final oldForm = state.forms[index];
    _updateForm(
      index,
      oldForm.copyWith(
        withDiscount: enable,
        discountPrice: enable ? oldForm.discountPrice : null,
        errorMessage: null,
      ),
    );
  }

  void toggleFeatured(int index, bool enable) {
    _updateForm(
      index,
      state.forms[index].copyWith(
        isFeatured: enable,
        errorMessage: null,
      ),
    );
  }

  void updateDiscountPrice(int index, String discount) {
    _updateForm(
      index,
      state.forms[index].copyWith(
        discountPrice: discount,
        errorMessage: null,
      ),
    );
  }

  void toggleCallForPrice(int index, bool enable) {
    _updateForm(
      index,
      state.forms[index].copyWith(
        callForPrice: enable,
        errorMessage: null,
      ),
    );
  }

  Future<void> submitAllForms({
    required void Function(String listingId) onSuccess,
    required void Function(String errorMessage) onError,
  }) async {
    final forms = [...state.forms];

    for (int i = 0; i < forms.length; i++) {
      final form = forms[i];

      if (form.number.isEmpty || (!form.callForPrice && form.price.isEmpty)) {
        forms[i] = form.copyWith(errorMessage: 'Please fill all required fields');
        emit(state.copyWith(forms: forms));
        continue;
      }

      forms[i] = form.copyWith(isSubmitting: true, errorMessage: null);
      emit(state.copyWith(forms: forms));

      final priceValue = form.callForPrice ? 0 : int.tryParse(form.price) ?? 0;
      if (priceValue == 0 && !form.callForPrice) {
        forms[i] = form.copyWith(isSubmitting: false, errorMessage: 'Price cannot be 0');
        emit(state.copyWith(forms: forms));
        onError('Price cannot be 0');
        continue;
      }

      final input = AddPhoneNumberInput(
        number: form.number,
        price: priceValue,
        discountPrice: form.withDiscount && !form.callForPrice ? int.tryParse(form.discountPrice ?? '') : null,
      );

      final addListingDto = AddListingDto(
        price: input.price,
        discountPrice: input.discountPrice ?? 0,
        listingType: ListingType.ad,
        itemType: ItemType.phoneNumber,
        isFeatured: form.isFeatured,
        item: {"number": input.number},
      );

      try {
        final callable = FirebaseFunctions.instance.httpsCallable(createListingCF);
        final response = await callable.call(addListingDto.toJson());

        if (response.data != null && response.data['success'] == true) {
          final id = response.data['listingId'] as String;
          onSuccess(id);
          analytics.logEvent(
            name: 'added_phone_number_ad',
            parameters: {
              'listingId': id,
              'number': input.number,
              'price': input.price,
              'discountPrice': input.discountPrice ?? 0,
              'isFeatured': form.isFeatured.toString(),
            },
          );

          forms.removeAt(i);
          i--;
        } else {
          const msg = 'Failed to add listing';
          onError(msg);
          forms[i] = form.copyWith(isSubmitting: false, errorMessage: msg);
        }
      } on FirebaseFunctionsException catch (e) {
        final msg = 'Error: ${e.message}';
        onError(msg);
        forms[i] = form.copyWith(isSubmitting: false, errorMessage: msg);
      } catch (e) {
        final msg = e.toString();
        onError(msg);
        forms[i] = form.copyWith(isSubmitting: false, errorMessage: msg);
      }

      emit(state.copyWith(forms: forms));
    }
  }

  void _updateForm(int index, PhoneFormState newForm) {
    final updated = [...state.forms];
    if (index < 0 || index >= updated.length) return;
    updated[index] = newForm;
    emit(state.copyWith(forms: updated));
  }
}
