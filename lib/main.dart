import 'package:flutter/material.dart';
import 'package:pushapp/pages/home_page.dart';
import 'package:pushapp/pages/mensaje_page.dart';
import 'package:pushapp/providers/push_notifications_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PushNotificationsProvider.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //context! escuchando un stream
    PushNotificationsProvider.messagesStream.listen((message) {
      print('MyApp ============= : ${message}');
      Navigator.pushNamed(context, 'mensaje');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Push App',
      initialRoute: 'home',
      routes: {
        'home': (BuildContext context) => HomePage(),
        'mensaje': (BuildContext context) => MensajePage(),
      },
    );
  }
}
