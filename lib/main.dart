import 'package:flutter/material.dart';
import 'package:tutor/components/NavBar.dart';
import 'package:tutor/components/comp.dart';
import 'package:tutor/pages/Broadcast.dart';
import 'package:tutor/pages/Classwork.dart';
import 'package:tutor/pages/ForgotPassword.dart';
import 'package:tutor/pages/Login.dart';
import 'package:tutor/pages/Messages.dart';
import 'package:tutor/pages/Course.dart';
import 'package:tutor/pages/NewPassword.dart';
import 'package:tutor/pages/Home.dart';
import 'package:tutor/pages/Notification.dart';
import 'package:tutor/pages/OTP.dart';
import 'package:tutor/pages/Profile.dart';
import 'package:tutor/pages/Schedule.dart';
import 'package:tutor/pages/Splash.dart';
import 'package:tutor/service/store.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const SplashScreen(),
    );
  }
}