import 'dart:developer';
import 'package:ansaap_app/core/di/injection.dart' as di;
import 'package:ansaap_app/core/network/network_info.dart';
import 'package:ansaap_app/data/services/fcm_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class NotificationsRepository {
  final FcmService _fcmService;

  final NetworkInfo _networkInfo;

  NotificationsRepository(this._fcmService, [NetworkInfo? networkInfo])
      : _networkInfo = networkInfo ?? di.getIt<NetworkInfo>() {
    onBackgroundMessage = _firebaseMessagingBackgroundHandler;
  }

  Future<bool> get _hasConnection async => await _networkInfo.isConnected;

  set onBackgroundMessage(BackgroundMessageHandler handler) {
    _fcmService.onBackgroundMessage = handler;
  }

  Future<void> deleteToken() {
    try {
      return _fcmService.deleteToken();
    } catch (e) {
      rethrow;
    }
  }

  Future<NotificationSettings> getNotificationSettings() {
    try {
      return _fcmService.getNotificationSettings();
    } catch (e) {
      rethrow;
    }
  }

  Future<String?> getToken() {
    try {
      return _fcmService.getToken();
    } catch (e) {
      rethrow;
    }
  }

  Stream<RemoteMessage> get onMessage {
    try {
      return _fcmService.onMessage;
    } catch (e) {
      rethrow;
    }
  }

  Stream<RemoteMessage> get onMessageOpenedApp {
    try {
      return _fcmService.onMessageOpenedApp;
    } catch (e) {
      rethrow;
    }
  }

  Stream<String> get onTokenRefresh {
    try {
      return _fcmService.onTokenRefresh;
    } catch (e) {
      rethrow;
    }
  }

  Future<NotificationSettings> requestPermission() {
    try {
      return _fcmService.requestPermission();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> subscribeToTopic(String topic) {
    try {
      return _fcmService.subscribeToTopic(topic);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> unsubscribeFromTopic(String topic) {
    try {
      return _fcmService.unsubscribeFromTopic(topic);
    } catch (e) {
      rethrow;
    }
  }
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
  log('Handling a background message ${message.messageId}');
}
