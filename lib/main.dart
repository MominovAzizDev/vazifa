import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ilovam/firebase_options.dart';
import 'package:ilovam/view/onboarding.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ilovam/view/rotish.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainApp());
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
