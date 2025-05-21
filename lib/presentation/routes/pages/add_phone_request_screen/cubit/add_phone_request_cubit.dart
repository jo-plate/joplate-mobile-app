import 'package:bloc/bloc.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'phone_request_state.dart';
import 'package:joplate/domain/dto/add_listing_dto.dart';
import 'package:joplate/data/constants.dart';

class AddPhoneRequestCubit extends Cubit<PhoneRequestState> {
  AddPhoneRequestCubit() : super(const PhoneRequestState());
  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;
  // Update phone number text (required field)
  void updatePhoneNumber(String phoneNumber) {
    emit(state.copyWith(
      phoneNumber: phoneNumber,
      errorMessage: null,
    ));
  }

  // Update price (optional field)
  void updatePrice(String? price) {
    emit(state.copyWith(
      price: price,
      errorMessage: null,
    ));
  }

  // Update description (optional field)
  void updateDescription(String description) {
    emit(state.copyWith(
      description: description,
      errorMessage: null,
    ));
  }

  // Submit the request
  Future<void> submitRequest() async {
    // Basic validation: phoneNumber must not be empty
    if (state.phoneNumber.isEmpty) {
      emit(state.copyWith(errorMessage: 'Phone number is required'));
      return;
    }

    emit(state.copyWith(isSubmitting: true, errorMessage: null));

    try {
      final addListingDto = AddListingDto(
        price: int.tryParse(state.price ?? '') ?? 0,
        discountPrice: 0,
        listingType: ListingType.request,
        itemType: ItemType.phoneNumber,
        isFeatured: false,
        item: {
          "number": state.phoneNumber,
          "description": state.description,
        },
      );

      final callable = FirebaseFunctions.instance.httpsCallable(postRequestCF);
      final response = await callable.call(addListingDto.toJson());

      if (response.data != null && response.data['success'] == true) {
        emit(const PhoneRequestState());
        _analytics.logEvent(
          name: 'added_phone_request',
          parameters: {
            'phoneNumber': state.phoneNumber,
            'price': int.tryParse(state.price ?? '') ?? 0,
          },
        );
      } else {
        emit(state.copyWith(
          isSubmitting: false,
          errorMessage: 'Failed to create phone request',
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
