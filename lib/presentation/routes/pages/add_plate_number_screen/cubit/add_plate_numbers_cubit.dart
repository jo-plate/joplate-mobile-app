// lib/presentation/routes/pages/add_plate_number_screen/cubit/add_plate_numbers_cubit.dart

import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'plate_form_state.dart';
import 'package:joplate/domain/dto/add_number_input.dart'; // Suppose you have an AddPlateNumberInput
import 'package:joplate/domain/dto/add_listing_dto.dart';
import 'package:joplate/data/constants.dart';

class AddPlateNumbersCubit extends Cubit<AddPlateNumbersState> {
  AddPlateNumbersCubit() : super(const AddPlateNumbersState(forms: []));

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
    _updateForm(index, state.forms[index].copyWith(number: newNumber, errorMessage: null));
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
    _updateForm(
      index,
      state.forms[index].copyWith(discountPrice: discount, errorMessage: null),
    );
  }

  /// Submit all forms in sequence
  Future<void> submitAllForms() async {
    final forms = [...state.forms];

    for (int i = 0; i < forms.length; i++) {
      final form = forms[i];

      // Basic validation
      if (form.code.isEmpty || form.number.isEmpty || form.price.isEmpty) {
        forms[i] = form.copyWith(errorMessage: 'Please fill all required fields');
        emit(state.copyWith(forms: forms));
        continue;
      }

      // Mark form as submitting
      forms[i] = form.copyWith(isSubmitting: true, errorMessage: null);
      emit(state.copyWith(forms: forms));

      final input = AddPlateNumberInput(
        code: form.code,
        number: form.number,
        price: double.parse(form.price),
        discountPrice: form.withDiscount ? double.tryParse(form.discountPrice ?? '') : null,
        isFeatured: form.isFeatured,
      );

      final addListingDto = AddListingDto(
        price: input.price.toDouble(),
        discountPrice: input.discountPrice?.toDouble() ?? 0,
        listingType: ListingType.ad,
        itemType: ItemType.plateNumber,
        isFeatured: input.isFeatured,
        item: {
          "code": input.code,
          "number": input.number,
        },
      );

      try {
        final callable = FirebaseFunctions.instance.httpsCallable(createListingCF);
        final response = await callable.call(addListingDto.toJson());

        if (response.data != null && response.data['success'] == true) {
          // Success -> remove that form from the list
          forms.removeAt(i);
          i--;
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

  void _updateForm(int index, PlateFormState newForm) {
    final updated = [...state.forms];
    if (index < 0 || index >= updated.length) return;
    updated[index] = newForm;
    emit(state.copyWith(forms: updated));
  }
}
