import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joplate/domain/dto/add_listing_dto.dart';
import 'package:joplate/domain/dto/edit_listing_dto.dart';
import 'package:joplate/domain/entities/plate_number.dart';
import 'package:joplate/data/constants.dart';

part 'edit_plate_listing_state.dart';

/// Cubit for editing an existing plate listing
class EditPlateListingCubit extends Cubit<EditPlateListingState> {
  EditPlateListingCubit()
      : super(const EditPlateListingState(
          listingId: '',
          code: '',
          plateNumber: '',
          price: '',
          discountPrice: null,
          withDiscount: false,
          isFeatured: false,
          isSubmitting: false,
          errorMessage: null,
        ));

  void loadListingData({
    required String listingId,
    required String code,
    required String plateNumber,
    required double price,
    double? discountPrice,
    bool? withDiscount,
    bool? isFeatured,
  }) {
    emit(state.copyWith(
      listingId: listingId,
      code: code,
      plateNumber: plateNumber,
      price: price.toString(),
      discountPrice: discountPrice?.toString(),
      withDiscount: withDiscount ?? false,
      isFeatured: isFeatured ?? false,
      isSubmitting: false,
      errorMessage: null,
    ));
  }

  void updateCode(String newCode) {
    emit(state.copyWith(code: newCode, errorMessage: null));
  }

  void updatePlateNumber(String newPlate) {
    emit(state.copyWith(plateNumber: newPlate, errorMessage: null));
  }

  void updatePrice(String newPrice) {
    emit(state.copyWith(price: newPrice, errorMessage: null));
  }

  void updateDiscountPrice(String newDiscount) {
    emit(state.copyWith(discountPrice: newDiscount, errorMessage: null));
  }

  void toggleDiscount(bool enable) {
    emit(state.copyWith(
      withDiscount: enable,
      discountPrice: enable ? state.discountPrice : null,
      errorMessage: null,
    ));
  }

  void toggleFeatured(bool enable) {
    emit(state.copyWith(isFeatured: enable, errorMessage: null));
  }

  Future<void> submitEdit() async {
    if (state.listingId.isEmpty || state.code.isEmpty || state.plateNumber.isEmpty || state.price.isEmpty) {
      emit(state.copyWith(errorMessage: 'Please fill required fields'));
      return;
    }

    emit(state.copyWith(isSubmitting: true, errorMessage: null));

    final dto = EditListingDto(
      listingId: state.listingId,
      price: double.parse(state.price),
      discountPrice: state.withDiscount ? double.tryParse(state.discountPrice ?? '') : null,
      isFeatured: state.isFeatured,
      itemData: PlateNumber(code: state.code, number: state.plateNumber).toJson(),
      itemType: ItemType.plateNumber,
    );

    try {
      final callable = FirebaseFunctions.instance.httpsCallable(updateListingCF);
      final response = await callable.call(dto.toJson());

      if (response.data != null && response.data['success'] == true) {
        emit(state.copyWith(isSubmitting: false));
      } else {
        emit(state.copyWith(
          isSubmitting: false,
          errorMessage: 'Failed to edit plate listing',
        ));
      }
    } on FirebaseFunctionsException catch (e) {
      emit(state.copyWith(
        isSubmitting: false,
        errorMessage: 'Error: ${e.message}',
      ));
    } catch (e) {
      emit(state.copyWith(
        isSubmitting: false,
        errorMessage: e.toString(),
      ));
    }
  }
}
