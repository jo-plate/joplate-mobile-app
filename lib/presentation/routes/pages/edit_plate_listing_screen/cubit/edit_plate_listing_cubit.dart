import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joplate/domain/dto/add_listing_dto.dart';
import 'package:joplate/domain/dto/update_listing_dto.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/presentation/routes/pages/edit_plate_listing_screen/cubit/edit_plate_listing_state.dart';

class EditPlateListingCubit extends Cubit<EditPlateListingState> {
  EditPlateListingCubit()
      : super(const EditPlateListingState(
          listingId: '',
          code: '',
          plateNumber: '',
          price: '',
          discountPrice: null,
          isFeatured: false,
          isDisabled: false,
          isSold: false,
          isSubmitting: false,
          errorMessage: null,
        ));

  void loadListingData({
    required String listingId,
    required String code,
    required String plateNumber,
    required int price,
    int? discountPrice,
    bool isFeatured = false,
    bool isDisabled = false,
    bool isSold = false,
  }) {
    emit(state.copyWith(
      listingId: listingId,
      code: code,
      plateNumber: plateNumber,
      price: price.toString(),
      discountPrice: discountPrice?.toString(),
      isFeatured: isFeatured,
      isDisabled: isDisabled,
      isSold: isSold,
      isSubmitting: false,
      errorMessage: null,
    ));
  }

  void updatePrice(String value) => emit(state.copyWith(price: value, errorMessage: null));

  void updateDiscountPrice(String value) => emit(state.copyWith(discountPrice: value, errorMessage: null));

  Future<void> submitEdit() async {
    if (state.listingId.isEmpty || state.code.isEmpty || state.plateNumber.isEmpty || state.price.isEmpty) {
      emit(state.copyWith(errorMessage: 'All fields are required'));
      return;
    }

    emit(state.copyWith(isSubmitting: true, errorMessage: null));

    final dto = UpdateListingDtoV2(
      listingId: state.listingId,
      itemType: ItemType.plateNumber,
      price: int.tryParse(state.price),
      discountPrice: state.discountPrice?.isNotEmpty == true ? int.tryParse(state.discountPrice!) : null,
    );

    try {
      final callable = FirebaseFunctions.instance.httpsCallable(updateListingCF);
      final response = await callable.call(dto.toJson());

      if (response.data != null && response.data['success'] == true) {
        emit(state.copyWith(isSubmitting: false));
      } else {
        emit(state.copyWith(
          isSubmitting: false,
          errorMessage: 'Failed to update listing',
        ));
      }
    } on FirebaseFunctionsException catch (e) {
      emit(state.copyWith(isSubmitting: false, errorMessage: 'Error: ${e.message}'));
    } catch (e) {
      emit(state.copyWith(isSubmitting: false, errorMessage: e.toString()));
    }
  }
}
