import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:joplate/data/services/fcm_service.dart';
import 'package:joplate/presentation/cubits/fcm/fcm_state.dart';

@lazySingleton
class FCMCubit extends Cubit<FCMState> {
  final FCMService _fcmService;

  FCMCubit(this._fcmService) : super(const FCMState.initial());

  Future<void> initialize() async {
    try {
      await _fcmService.initialize();
      emit(const FCMState.initialized());
    } catch (e) {
      debugPrint('FCM initialization error: $e');
      emit(FCMState.error(e.toString()));
    }
  }

  // Delegate all other methods to the FCM service
  Future<void> subscribeToTopic(String topic) => _fcmService.subscribeToTopic(topic);
  Future<void> unsubscribeFromTopic(String topic) => _fcmService.unsubscribeFromTopic(topic);
  Future<void> markAllNotificationsAsRead() => _fcmService.markAllNotificationsAsRead();
}
