import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:motive_complete/Initial%20Screen/splash.dart';
import 'Login/register.dart';
import 'Login/sociallogin.dart';
import 'Goal/py1.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => LoginPage(),
      //   '/registerpage': (context) => RegisterPage(),
      //   '/register2page': (context) => Register2Page()
      // },
      title: 'logindemo',
      home: LandingPage(),
    );
  }
}
