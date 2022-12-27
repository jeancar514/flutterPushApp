import 'dart:async';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';

import '../main.dart';

class PushNotificationsProvider {
  // instancia
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;
  static StreamController<dynamic> _messageStream =
      new StreamController.broadcast();
  static Stream<dynamic> get messagesStream => _messageStream.stream;

  static Future _backgroundHandler(RemoteMessage message) async {
    print("BackgroundHandler Message: ${message.messageId}");
    print("BackgroundHandler Message Data : ${message.data}");
    if (Platform.isAndroid) {
      final argument = message.data['story_id'];
      _messageStream.add(argument);
    } else {
      print('no es android');
    }
  }

  static Future _onMessageHandler(RemoteMessage message) async {
    print("onMessage Handler Message: ${message.messageId}");
    print("onMessage Handler Message Data : ${message.data}");
    if (Platform.isAndroid) {
      final argument = message.data['story_id'];
      _messageStream.add(argument);
    } else {
      print('no es android');
    }
  }

  static Future _onMenssageOpenApp(RemoteMessage message) async {
    print("onMenssage OpenApp Message: ${message.messageId}");
    print("onMenssage OpenApp Message Data : ${message.data}");
    if (Platform.isAndroid) {
      final argument = message.data['story_id'];
      _messageStream.add(argument);
    } else {
      print('no es android');
    }
  }

  static Future initializeApp() async {
    await Firebase.initializeApp();
    token = await FirebaseMessaging.instance.getToken();
    print("==== Token ====");
    print(token);

    //handler
    FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
    FirebaseMessaging.onMessage
        .listen(_onMessageHandler); // cuando la aplicacion esta abierta
    FirebaseMessaging.onMessageOpenedApp
        .listen(_onMenssageOpenApp); // cuando la aplicacion esta abierta
  }
  // en segundo plano
  // Future<void> _firebaseMessagingBackgroundHandler(
  //     RemoteMessage message) async {
  //   await Firebase.initializeApp();

  //   print("Handling a background message: ${message.messageId}");
  // }

  // void main() {
  //   FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  //   runApp(MyApp());
  // }

  static closeStreams() {
    _messageStream.close();
  }
}
