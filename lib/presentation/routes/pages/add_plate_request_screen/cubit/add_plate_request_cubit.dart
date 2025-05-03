import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'add_plate_request_state.dart';
import 'package:joplate/domain/dto/add_listing_dto.dart';
import 'package:joplate/data/constants.dart';

class AddPlateRequestCubit extends Cubit<PlateRequestState> {
  AddPlateRequestCubit() : super(const PlateRequestState());
  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  void updateCode(String code) {
    emit(state.copyWith(code: code, errorMessage: null));
  }

  void updateNumber(String number) {
    emit(state.copyWith(number: number, errorMessage: null));
  }

  void updatePrice(String? price) {
    emit(state.copyWith(price: price, errorMessage: null));
  }

  Future<void> submitRequest() async {
    if (state.code.isEmpty || state.number.isEmpty) {
      emit(state.copyWith(errorMessage: 'Code and Number are required'));
      return;
    }

    emit(state.copyWith(isSubmitting: true, errorMessage: null));

    try {
      final priceVal = (state.price?.isNotEmpty == true)
          ? double.tryParse(state.price!)
          : 0.0;

      final dto = AddListingDto(
        price: priceVal ?? 0.0,
        discountPrice: 0,
        listingType: ListingType.request,
        itemType: ItemType.plateNumber,
        isFeatured: false,
        item: {
          "code": state.code,
          "number": state.number,
        },
      );

      final callable = FirebaseFunctions.instance.httpsCallable(postRequestCF);
      final response = await callable.call(dto.toJson());

      if (response.data != null && response.data['success'] == true) {
        emit(const PlateRequestState());
        _analytics.logEvent(
          name: 'added_plate_request',
          parameters: {
            'plate': '${state.code}-${state.number}',
            'listing_id': response.data['listingId'],
          },
        );
      } else {
        emit(state.copyWith(
          isSubmitting: false,
          errorMessage: 'Failed to create plate request',
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
