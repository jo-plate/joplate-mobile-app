import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joplate/domain/dto/add_listing_dto.dart';
import 'package:joplate/domain/dto/update_listing_dto.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/domain/entities/plate_listing.dart';
import 'package:joplate/presentation/routes/pages/edit_plate_listing_screen/cubit/edit_plate_listing_state.dart';

class EditPlateListingCubit extends Cubit<EditPlateListingState> {
  EditPlateListingCubit()
      : super(const EditPlateListingState(
          listingId: '',
          code: '',
          plateNumber: '',
          price: '',
          discountPrice: null,
          description: null,
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
    String? description,
    bool isFeatured = false,
    bool isDisabled = false,
    bool isSold = false,
  }) {
    if (plateNumber.startsWith('0')) {
      emit(state.copyWith(
        listingId: listingId,
        code: code,
        plateNumber: plateNumber,
        price: price.toString(),
        discountPrice: discountPrice?.toString(),
        description: description,
        isFeatured: isFeatured,
        isDisabled: isDisabled,
        isSold: isSold,
        isSubmitting: false,
        errorMessage: 'Number cannot start with 0',
      ));
      return;
    }

    emit(state.copyWith(
      listingId: listingId,
      code: code,
      plateNumber: plateNumber,
      price: price.toString(),
      discountPrice: discountPrice?.toString(),
      description: description,
      isFeatured: isFeatured,
      isDisabled: isDisabled,
      isSold: isSold,
      isSubmitting: false,
      errorMessage: null,
    ));
  }

  void updatePrice(String value) => emit(state.copyWith(price: value, errorMessage: null));

  void updateDiscountPrice(String value) => emit(state.copyWith(discountPrice: value, errorMessage: null));

  void updateDescription(String description) => emit(state.copyWith(description: description, errorMessage: null));

  void loadListing(PlateListing listing) {
    emit(EditPlateListingState(
      listingId: listing.id,
      code: listing.item.code,
      plateNumber: listing.item.number,
      price: listing.price.toString(),
      discountPrice: listing.discountPrice.toString(),
      description: listing.description,
      isFeatured: listing.isFeatured,
      isDisabled: listing.isDisabled,
      isSold: listing.isSold,
      priceHidden: listing.priceHidden,
      isSubmitting: false,
      errorMessage: null,
    ));
  }

  void updatePriceHidden(bool hidden) {
    emit(state.copyWith(priceHidden: hidden, errorMessage: null));
  }

  Future<void> submitEdit() async {
    if (state.listingId.isEmpty || (!state.priceHidden && state.price.isEmpty)) {
      emit(state.copyWith(errorMessage: 'Please fill all required fields.'));
      return;
    }

    emit(state.copyWith(isSubmitting: true, errorMessage: null));

    final dto = UpdateListingDtoV2(
      listingId: state.listingId,
      itemType: ItemType.plateNumber,
      price: state.priceHidden ? 0 : int.tryParse(state.price),
      discountPrice: state.discountPrice?.isNotEmpty == true ? int.tryParse(state.discountPrice!) : null,
      description: state.description,
      priceHidden: state.priceHidden,
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
