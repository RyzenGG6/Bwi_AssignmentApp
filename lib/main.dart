import 'package:bwi_intern/screens/Category.dart';
import 'package:bwi_intern/screens/home.dart';
import 'package:bwi_intern/screens/login.dart';
import 'package:bwi_intern/screens/main_screen.dart';
import 'package:bwi_intern/screens/otp.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseAppCheck.instance.activate();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        'home': (context) => const home(),
        'category': (context) => const category_page(),
        'main': (context) => const main_screen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        // '/second': (context) => const SecondScreen(),
      },
      // theme: ThemeData(
      //   // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   primaryColor: Colors.white,
      //   useMaterial3: true,
      // ),
      home: login(),
    );
  }
}




