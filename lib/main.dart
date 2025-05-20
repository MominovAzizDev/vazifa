import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:ilovam/firebase_options.dart';
import 'package:ilovam/services/notification_service.dart';
import 'package:ilovam/view/accaunts.dart';
import 'package:ilovam/view/onboarding.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ilovam/view/rotish.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await setupFCM();
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => MessagesProvider())],
      child: MainApp(),
    ),
  );
}

NotificationService notificationService = NotificationService();

Future<void> setupFCM() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    badge: true,
    sound: true,
  );

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    String? token = await messaging.getToken();
    print("FCM token: $token");
  }
  await notificationService.initNotifications();

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    notificationService.showNotification(message);
  });
}

Future<void> requestMicrophonePermission() async {
  var status = await Permission.microphone.status;
  if (!status.isGranted) {
    var result = await Permission.microphone.request();
    if (result.isGranted) {
      print("Ruxsat berildi");
    } else {
      print("Ruxsat berilmadi");
    }
  }
}

void requestMultiplePermissions() async {
  Map<Permission, PermissionStatus> statuses =
      await [
        Permission.location,
        Permission.camera,
        Permission.microphone,
      ].request();

  if (statuses[Permission.location]!.isGranted &&
      statuses[Permission.camera]!.isGranted &&
      statuses[Permission.microphone]!.isGranted) {
    print("Hamma ruxsatlar berildi");
  } else {
    print("Hamma ruxsatlar rad etildi");
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          }
          if (snapshot.hasData) {
            return Onboarding();
          } else {
            return Rotish();
          }
        },
      ),
      routes: {
        "onboarding": (context) => Onboarding(),
        "ro'yxatdan o'tish": (context) => Rotish(),
      },
    );
  }
}
