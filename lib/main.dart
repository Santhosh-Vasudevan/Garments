import 'dart:async';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'db_helper/Login service/Login split.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: dotenv.env['API_KEY']!,
      appId: dotenv.env['APP_ID']!,
      messagingSenderId: dotenv.env['MESSAGING_SENDER_ID']!,
      projectId: dotenv.env['PROJECT_ID']!,
    ),
  );
  await AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(
        channelGroupKey: "go_taxi_channel",
        channelKey: "go_taxi",
        channelName: "GO Taxi",
        channelDescription: "Your Ride Has Been Booked Sucessfully",
      ),
    ],
    channelGroups: [
      NotificationChannelGroup(
        channelGroupKey: "go_taxi_channel",
        channelGroupName: "Basic Group",
      ),
    ],
  );
  bool isAllowedToSendNotification =
      await AwesomeNotifications().isNotificationAllowed();
  if (!isAllowedToSendNotification) {
    AwesomeNotifications().requestPermissionToSendNotifications();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      home: Splashscreen(),
      // Paymentscreen(),
    );
  }
}

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  Future<void> splashfun() async {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Loginsplit()),
      );
    });
  }

  @override
  void initState() {
    splashfun();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Image.asset("assets/icon1.png")));
  }
}
