import 'package:flutter/material.dart';
import 'package:tutor/components/NavBar.dart';
import 'package:tutor/components/comp.dart';
import 'package:tutor/pages/Broadcast.dart';
import 'package:tutor/pages/Classwork.dart';
import 'package:tutor/pages/ForgotPassword.dart';
import 'package:tutor/pages/Login.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tutor/pages/Inbox.dart';
import 'package:tutor/pages/Course.dart';
import 'package:tutor/pages/NewPassword.dart';
import 'package:tutor/pages/Home.dart';
import 'package:tutor/pages/Notification.dart';
import 'package:tutor/pages/OTP.dart';
import 'package:tutor/pages/Profile.dart';
import 'package:tutor/pages/Schedule.dart';
import 'package:tutor/service/store.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

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
      home: AnimatedSplashScreen(
        splash:
        ///////Linear Gradient
            // Container(
            //   decoration: const BoxDecoration(
            //       gradient: LinearGradient(
            //           begin: Alignment.topLeft,
            //           end: Alignment.bottomLeft,
            //           colors: [Color.fromARGB(255, 169, 77, 255), Colors.purple])),
            // child:
            SvgPicture.asset('assets/images/log.svg', color: white),
        // ),
        nextScreen: const LoginPage(),
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: Color.fromARGB(255, 114, 43, 172),
        duration: 3000,
      ),
    );
  }
}
