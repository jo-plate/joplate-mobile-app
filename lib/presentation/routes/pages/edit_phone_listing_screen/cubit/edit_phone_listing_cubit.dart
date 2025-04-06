import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joplate/domain/dto/add_listing_dto.dart';
import 'package:joplate/domain/dto/edit_listing_dto.dart';
import 'package:joplate/domain/entities/phone_number.dart';
import 'package:joplate/data/constants.dart';

part 'edit_phone_listing_state.dart';

class EditPhoneListingCubit extends Cubit<EditPhoneListingState> {
  EditPhoneListingCubit()
      : super(const EditPhoneListingState(
          listingId: '',
          number: '',
          price: '',
          discountPrice: null,
          withDiscount: false,
          isFeatured: false,
          isSubmitting: false,
          errorMessage: null,
        ));

  void loadListingData({
    required String listingId,
    required String number,
    required double price,
    double? discountPrice,
    bool? withDiscount,
    bool? isFeatured,
  }) {
    emit(state.copyWith(
      listingId: listingId,
      number: number,
      price: price.toString(),
      discountPrice: discountPrice?.toString(),
      withDiscount: withDiscount ?? false,
      isFeatured: isFeatured ?? false,
      isSubmitting: false,
      errorMessage: null,
    ));
  }

  void updateNumber(String newNumber) {
    emit(state.copyWith(number: newNumber, errorMessage: null));
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
    // Basic validation
    if (state.listingId.isEmpty || state.number.isEmpty || state.price.isEmpty) {
      emit(state.copyWith(errorMessage: 'Please fill required fields'));
      return;
    }

    emit(state.copyWith(isSubmitting: true, errorMessage: null));

    final dto = EditListingDto(
      listingId: state.listingId,
      price: double.parse(state.price),
      discountPrice: state.withDiscount ? double.tryParse(state.discountPrice ?? '') : null,
      isFeatured: state.isFeatured,
      itemData: PhoneNumber(number: state.number).toJson(),
      itemType: ItemType.phoneNumber,
    );

    try {
      final callable = FirebaseFunctions.instance.httpsCallable(updateListingCF);
      final response = await callable.call(dto.toJson());

      if (response.data != null && response.data['success'] == true) {
        // success
        emit(state.copyWith(isSubmitting: false));
      } else {
        emit(state.copyWith(
          isSubmitting: false,
          errorMessage: 'Failed to edit phone listing',
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
