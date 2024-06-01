import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:push_notification/notification/message_screen.dart';
import 'package:push_notification/notification/notification_services.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Home> {
  NotificationServices notificationServices = NotificationServices();

  @override
  void initState() {
    super.initState();
    notificationServices.requestNotificationPermission();
    notificationServices.forgroundMessage();
    notificationServices.firebaseInit(context);
    notificationServices.setupInteractMessage(context);
    notificationServices.isTokenRefresh();

    notificationServices.getDeviceToken().then((value) {
      if (kDebugMode) {
        print('device token');
        print(value);
      }
    });

    // Register callback for handling messages when the app is open
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // Handle the message when the app is in the foreground or open
      handleMessage(message);
    });
  }

  void handleMessage(RemoteMessage message) {
    // Access the message data
    String id = message.data['id'];

    // Navigate to the appropriate screen based on the message
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MessageScreen(id: id),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Notifications'),
        backgroundColor: Colors.red[500],
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Send notification from one device to another
            notificationServices.getDeviceToken().then((value) async {
              var data = {
                'to': value.toString(),
                'notification': {
                  'title': 'Push Notification',
                  'body': 'It\'s an awesome feature',
                  'sound': 'jetsons_doorbell.mp3'
                },
                'android': {
                  'notification': {
                    'notification_count': 23,
                  },
                },
                'data': {'type': 'msj', 'id': 'Flutter Push Notification'}
              };

              await http.post(
                Uri.parse('https://fcm.googleapis.com/fcm/send'),
                body: jsonEncode(data),
                headers: {
                  'Content-Type': 'application/json; charset=UTF-8',
                  'Authorization':
                      'key=AAAAp9pXDFM:APA91bGhBeMCUABE2PXjl9UqodAZ2WdV_UI6PoiwdCzYaT8KeZmBKZszc01CD1GgN0OAJ1w3sNw9IVISyKhrrxQLASHizenGJUr2hjzoPjbjFu0HAx1CTk0l8Ut95ZENAQyRKm6hrltV'
                },
              ).then((value) {
                if (kDebugMode) {
                  print(value.body.toString());
                }
              }).onError((error, stackTrace) {
                if (kDebugMode) {
                  print(error);
                }
              });
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red[500],
            padding: EdgeInsets.only(left: 40, right: 40, top: 15, bottom: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
          ),
          child: Text(
            'Send Notifications',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
