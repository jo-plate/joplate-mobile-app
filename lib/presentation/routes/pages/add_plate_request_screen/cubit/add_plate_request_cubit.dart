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
    String? errorMessage;
    if (number.isEmpty) {
      errorMessage = 'Number is required';
    } else if (number.startsWith('0')) {
      errorMessage = 'Number cannot start with 0';
    }
    emit(state.copyWith(number: number, errorMessage: errorMessage));
  }

  void updatePrice(int? price) {
    emit(state.copyWith(price: price, errorMessage: null));
  }

  Future<void> submitRequest() async {
    if (state.code.isEmpty || state.number.isEmpty) {
      emit(state.copyWith(errorMessage: 'Code and Number are required'));
      return;
    }

    if (state.number.startsWith('0')) {
      emit(state.copyWith(errorMessage: 'Number cannot start with 0'));
      return;
    }

    emit(state.copyWith(isSubmitting: true, errorMessage: null));

    try {
      final dto = AddListingDto(
        price: state.price ?? 0,
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
            'request_id': response.data['requestId'],
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
