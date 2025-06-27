import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FcmService {
  final FirebaseMessaging _fcm;
  FcmService(this._fcm);
  set onBackgroundMessage(BackgroundMessageHandler handler) {
    FirebaseMessaging.onBackgroundMessage(handler);
  }

  Future<NotificationSettings> getNotificationSettings() {
    try {
      return _fcm.getNotificationSettings();
    } catch (e) {
      rethrow;
    }
  }

  Future<NotificationSettings> requestPermission() {
    try {
      return _fcm.requestPermission();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> subscribeToTopic(String topic) {
    try {
      return _fcm.subscribeToTopic(topic);
    } catch (e) {
      log(e.toString(), name: 'FcmService.subscribeToTopic()');
      rethrow;
    }
  }

  Future<void> unsubscribeFromTopic(String topic) {
    try {
      return _fcm.unsubscribeFromTopic(topic);
    } catch (e) {
      rethrow;
    }
  }

  Stream<String> get onTokenRefresh {
    try {
      return _fcm.onTokenRefresh;
    } catch (e) {
      rethrow;
    }
  }

  Stream<RemoteMessage> get onMessage {
    try {
      return FirebaseMessaging.onMessage;
    } catch (e) {
      rethrow;
    }
  }

  Stream<RemoteMessage> get onMessageOpenedApp {
    try {
      return FirebaseMessaging.onMessageOpenedApp;
    } catch (e) {
      rethrow;
    }
  }

  Future<String?> getToken() {
    try {
      return _fcm.getToken();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteToken() {
    try {
      return _fcm.deleteToken();
    } catch (e) {
      rethrow;
    }
  }
}
