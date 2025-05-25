import 'dart:io';
import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:joplate/presentation/cubits/attp/attp_state.dart';

@lazySingleton
class ATPPCubit extends Cubit<ATPPState> {
  final FirebaseAnalytics _analytics;

  ATPPCubit(this._analytics) : super(const ATPPState.initial());

  Future<void> requestTrackingPermission() async {
    if (!Platform.isIOS) {
      emit(const ATPPState.authorized());
      return;
    }

    try {
      final status = await AppTrackingTransparency.requestTrackingAuthorization();

      switch (status) {
        case TrackingStatus.authorized:
          await _analytics.setConsent(
            adStorageConsentGranted: true,
            analyticsStorageConsentGranted: true,
            adPersonalizationSignalsConsentGranted: true,
            adUserDataConsentGranted: true,
          );
          emit(const ATPPState.authorized());
          break;
        case TrackingStatus.denied:
          emit(const ATPPState.denied());
          break;
        case TrackingStatus.notDetermined:
          emit(const ATPPState.notDetermined());
          break;
        case TrackingStatus.restricted:
          emit(const ATPPState.restricted());
          break;
        default:
          emit(const ATPPState.notDetermined());
          break;
      }
    } catch (e) {
      debugPrint('Error requesting tracking permission: $e');
      emit(ATPPState.error(e.toString()));
    }
  }
}
