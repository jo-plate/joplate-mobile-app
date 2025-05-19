// lib/presentation/routes/pages/add_plate_number_screen/cubit/add_plate_numbers_cubit.dart

import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joplate/injection/injector.dart';
import 'plate_form_state.dart';
import 'package:joplate/domain/dto/add_number_input.dart'; // Suppose you have an AddPlateNumberInput
import 'package:joplate/domain/dto/add_listing_dto.dart';
import 'package:joplate/data/constants.dart';

class AddPlateNumbersCubit extends Cubit<AddPlateNumbersState> {
  AddPlateNumbersCubit() : super(const AddPlateNumbersState(forms: []));
  final FirebaseAnalytics _analytics = injector();

  /// Add a blank plate form
  void addNewForm() {
    const newForm = PlateFormState(
      code: '',
      number: '',
      price: '',
      withDiscount: false,
      discountPrice: null,
      isSubmitting: false,
      errorMessage: null,
      isFeatured: false,
      callForPrice: false,
    );
    emit(state.copyWith(forms: [...state.forms, newForm]));
  }

  /// Remove the form at [index].
  void removeForm(int index) {
    final updated = [...state.forms];
    if (index >= 0 && index < updated.length) {
      updated.removeAt(index);
      emit(state.copyWith(forms: updated));
    }
  }

  // Update fields
  void updateCode(int index, String newCode) {
    _updateForm(index, state.forms[index].copyWith(code: newCode, errorMessage: null));
  }

  void updateNumber(int index, String newNumber) {
    String? errorMessage;
    if (newNumber.isEmpty) {
      errorMessage = 'Number is required';
    } else if (newNumber.startsWith('0')) {
      errorMessage = 'Number cannot start with 0';
    }
    _updateForm(index, state.forms[index].copyWith(number: newNumber, errorMessage: errorMessage));
  }

  void updatePrice(int index, String newPrice) {
    _updateForm(index, state.forms[index].copyWith(price: newPrice, errorMessage: null));
  }

  void toggleFeatured(int index, bool enable) {
    _updateForm(index, state.forms[index].copyWith(isFeatured: enable, errorMessage: null));
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

  void updateDiscountPrice(int index, String discount) {
    _updateForm(index, state.forms[index].copyWith(discountPrice: discount, errorMessage: null));
  }

  void toggleCallForPrice(int index, bool enable) {
    _updateForm(index, state.forms[index].copyWith(callForPrice: enable, errorMessage: null));
  }

  /// Submit all forms in sequence, with callbacks
  Future<void> submitAllForms({
    required void Function(String listingId) onSuccess,
    required void Function(String errorMessage) onError,
  }) async {
    final forms = [...state.forms];

    for (int i = 0; i < forms.length; i++) {
      final form = forms[i];

      // Basic validation
      if (form.code.isEmpty || form.number.isEmpty || (!form.callForPrice && form.price.isEmpty)) {
        forms[i] = form.copyWith(errorMessage: 'Please fill all required fields');
        emit(state.copyWith(forms: forms));
        continue;
      }

      // Validate number format
      if (form.number.startsWith('0')) {
        forms[i] = form.copyWith(errorMessage: 'Number cannot start with 0');
        emit(state.copyWith(forms: forms));
        continue;
      }

      // Mark form as submitting
      forms[i] = form.copyWith(isSubmitting: true, errorMessage: null);
      emit(state.copyWith(forms: forms));

      // Use actual price if provided, or 0 if call for price is enabled
      final priceValue = form.callForPrice ? 0 : int.tryParse(form.price) ?? 0;
      if (priceValue == 0 && !form.callForPrice) {
        forms[i] = form.copyWith(isSubmitting: false, errorMessage: 'Price cannot be 0');
        emit(state.copyWith(forms: forms));
        onError('Price cannot be 0');
        continue;
      }

      final input = AddPlateNumberInput(
        code: form.code,
        number: form.number,
        price: priceValue,
        discountPrice: form.withDiscount && !form.callForPrice ? int.tryParse(form.discountPrice ?? '') : null,
        isFeatured: form.isFeatured,
      );

      final addListingDto = AddListingDto(
        price: input.price,
        discountPrice: input.discountPrice ?? 0,
        listingType: ListingType.ad,
        itemType: ItemType.plateNumber,
        isFeatured: input.isFeatured,
        item: {
          'code': input.code,
          'number': input.number,
        },
      );

      try {
        final callable = FirebaseFunctions.instance.httpsCallable(createListingCF);
        final response = await callable.call(addListingDto.toJson());

        if (response.data != null && response.data['success'] == true) {
          final id = response.data['listingId'] as String;
          onSuccess(id);
          _analytics.logEvent(
            name: 'add_plate_number_ad',
            parameters: {
              'listing_id': id,
              'code': input.code,
              'number': input.number,
              'price': input.price,
              'discount_price': input.discountPrice ?? 0,
              'is_featured': input.isFeatured.toString(),
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

  void _updateForm(int index, PlateFormState newForm) {
    final updated = [...state.forms];
    if (index < 0 || index >= updated.length) return;
    updated[index] = newForm;
    emit(state.copyWith(forms: updated));
  }
}
