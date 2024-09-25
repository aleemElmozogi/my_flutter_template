// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:injectable/injectable.dart';
//
// abstract class NotificationDataSource {
//   Future<void> setUpRemoteNotification();
//   Future<void> subscribeToTopic(String topic);
//   Future<void> unSubscribeToTopic(String topic);
// }
//
// @Singleton(as: NotificationDataSource)
// class NotificationDataSourceImpl implements NotificationDataSource {
//   final FirebaseMessaging _fcm = FirebaseMessaging.instance;
//   final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();
//
//   NotificationDataSourceImpl() {
//     _setUpMessageHandlers();
//   }
//
//   void _setUpMessageHandlers() {
//     FirebaseMessaging.onBackgroundMessage(_onBackground);
//     FirebaseMessaging.onMessage.listen(_onForeground);
//   }
//
//   @override
//   Future<void> setUpRemoteNotification() async {
//     await _fcm.requestPermission();
//     await _initializeNotifications();
//     String? token = await _fcm.getToken();
//     if (kDebugMode) {
//       print('FCM Token: $token');
//     }
//   }
//
//   @override
//   Future<void> subscribeToTopic(String topic) async {
//     await _fcm.subscribeToTopic(topic);
//   }
//
//   @override
//   Future<void> unSubscribeToTopic(String topic) async {
//     await _fcm.unsubscribeFromTopic(topic);
//   }
//
//   Future<void> _onForeground(RemoteMessage message) async {
//     await _showNotification(message);
//   }
//
//   @pragma('vm:entry-point')
//   Future<void> _onBackground(RemoteMessage message) async {
//     await _showNotification(message);
//   }
//
//   Future<void> _initializeNotifications() async {
//     const InitializationSettings initializationSettings =
//         InitializationSettings(
//       android: AndroidInitializationSettings('@drawable/ic_notification'),
//       iOS: DarwinInitializationSettings(), // TODO: Add iOS configuration
//       macOS: null,
//     );
//     await _flutterLocalNotificationsPlugin.initialize(initializationSettings);
//   }
//
//   Future<void> _showNotification(RemoteMessage message) async {
//     RemoteNotification? notification = message.notification;
//     AndroidNotification? android = message.notification?.android;
//     if (notification != null ) {
//       if(android !=null){
//       try {
//         return _flutterLocalNotificationsPlugin.show(
//           notification.hashCode,
//           notification.title,
//           notification.body,
//           NotificationDetails(
//             android: AndroidNotificationDetails(
//               'dinaro_notifications',
//               'Dinaro notifications',
//               icon: android.smallIcon,
//               importance: Importance.max,
//               priority: Priority.high,
//             ),
//             iOS: const DarwinNotificationDetails()
//           ),
//         );
//       } catch (e) {
//         if (kDebugMode) {
//           print('Error displaying notification: $e');
//         }
//       }}
//       else {
//         try {
//           return _flutterLocalNotificationsPlugin.show(
//             notification.hashCode,
//             notification.title,
//             notification.body,
//             const NotificationDetails(
//                 iOS: DarwinNotificationDetails()
//             ),
//           );
//         } catch (e) {
//           if (kDebugMode) {
//             print('Error displaying notification: $e');
//           }
//         }
//       }
//     }
//   }
// }
