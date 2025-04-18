// lib/presentation/routes/pages/add_phone_number_screen/cubit/add_phone_numbers_cubit.dart

import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'phone_form_state.dart'; // import the freezed classes
import 'package:joplate/domain/dto/add_number_input.dart';
import 'package:joplate/domain/dto/add_listing_dto.dart';
import 'package:joplate/data/constants.dart';

class AddPhoneNumbersCubit extends Cubit<AddPhoneNumbersState> {
  AddPhoneNumbersCubit() : super(const AddPhoneNumbersState(forms: []));

  /// Add a blank phone form
  void addNewForm() {
    const newForm = PhoneFormState(
      number: '',
      price: '',
      withDiscount: false,
      discountPrice: null,
      isSubmitting: false,
      isFeatured: false,
      errorMessage: null,
    );
    emit(state.copyWith(forms: [...state.forms, newForm]));
  }

  /// Remove a single form from the list
  void removeForm(int index) {
    final updated = [...state.forms];
    if (index >= 0 && index < updated.length) {
      updated.removeAt(index);
      emit(state.copyWith(forms: updated));
    }
  }

  // Update fields
  void updateNumber(int index, String newNumber) {
    _updateForm(
      index,
      state.forms[index].copyWith(
        number: newNumber,
        errorMessage: null, // clear old error
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
        // If discount was turned off, reset the discountPrice
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

  /// Submit all forms in sequence
  Future<void> submitAllForms() async {
    final forms = [...state.forms];

    for (int i = 0; i < forms.length; i++) {
      final form = forms[i];

      // Basic validation
      if (form.number.isEmpty || form.price.isEmpty) {
        forms[i] = form.copyWith(errorMessage: 'Please fill all required fields');
        emit(state.copyWith(forms: forms));
        continue;
      }

      // Mark this form as submitting
      forms[i] = form.copyWith(isSubmitting: true, errorMessage: null);
      emit(state.copyWith(forms: forms));

      final input = AddPhoneNumberInput(
        number: form.number,
        price: double.parse(form.price),
        discountPrice: form.withDiscount ? double.tryParse(form.discountPrice ?? '') : null,
      );

      final addListingDto = AddListingDto(
        price: input.price.toDouble(),
        discountPrice: input.discountPrice?.toDouble() ?? 0,
        listingType: ListingType.ad,
        itemType: ItemType.phoneNumber,
        isFeatured: false,
        item: {"number": input.number},
      );
      print('Adding phone number: ${addListingDto.toJson()}');

      try {
        final callable = FirebaseFunctions.instance.httpsCallable(createListingCF);
        final response = await callable.call(addListingDto.toJson());

        if (response.data != null && response.data['success'] == true) {
          // Success -> remove this form
          forms.removeAt(i);
          i--; // Adjust loop index
        } else {
          // Failure
          forms[i] = form.copyWith(
            isSubmitting: false,
            errorMessage: 'Failed to add listing',
          );
        }
      } on FirebaseFunctionsException catch (e) {
        forms[i] = form.copyWith(
          isSubmitting: false,
          errorMessage: 'Error: ${e.message}',
        );
      } catch (e) {
        forms[i] = form.copyWith(
          isSubmitting: false,
          errorMessage: e.toString(),
        );
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
