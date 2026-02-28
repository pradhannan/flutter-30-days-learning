import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController{
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _localNotificationsPlugin = FlutterLocalNotificationsPlugin();

  @override 
  void onInit(){
    super.onInit();
    _initializeNotification();
    _requestPermission();
    _setUpMessageHandler();
    getFcmToken(); 
  }

  void _initializeNotification() async {
    const andriodSetting = AndroidInitializationSettings("@mipmap/ic_launcher");
    await _localNotificationsPlugin.initialize(
      settings: InitializationSettings(android: andriodSetting),
      onDidReceiveNotificationResponse: (details) => print("Notification tapped"),
    );

    // const AndroidNotificationChannel channel = AndroidNotificationChannel(
    //   'high_importance_channel',
    //   'High Importance Channel',
    //   importance: Importance.max,
    // );

  }
  void getFcmToken() async {
  String? token = await messaging.getToken();
  print('🔥 FCM TOKEN: $token');
}


  void _requestPermission() async{
    await messaging.requestPermission(
      alert: true, badge: true, sound: true
    );
  }

  void _setUpMessageHandler(){
    FirebaseMessaging.onMessage.listen((RemoteMessage message){
      _showLocalNotification(message);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message){
      print('📲 Notification opened from background');
    print('Title: ${message.notification?.title}');
    print('Body: ${message.notification?.body}');
    print('Data: ${message.data}');
    });
  }

  void _showLocalNotification(RemoteMessage message)async{
    const androidDetails = AndroidNotificationDetails("high_importance_channel", "High Importance Channel",
    importance: Importance.max,
    priority: Priority.max);

    const notificationDetails = NotificationDetails(
      android: androidDetails,
    );

    await _localNotificationsPlugin.show(id: message.hashCode,
    title: message.notification?.title,
    body: message.notification?.body,
    notificationDetails: notificationDetails,
    payload: message.data.toString());

  }
  
}