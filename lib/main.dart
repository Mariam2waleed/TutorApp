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

import 'N/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // final double statusBarHeight = MediaQuery.of(context).padding.top;
    // final double bottomBarHeight = MediaQuery.of(context).padding.bottom;
    // final double screenHeight =
    //     MediaQuery.of(context).size.height - statusBarHeight - bottomBarHeight;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.transparent,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: Stack(children: [
        AnimatedSplashScreen(
            splash: Container(),
            duration: 1000,
            splashTransition: SplashTransition.fadeTransition,
            // backgroundColor: Colors.blueGrey,
            nextScreen: const LoginPage()),
        Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('Assets/images/SplashSC.png'))))
      ]),

      //     AnimatedSplashScreen(
      //         splash:
      //     ///////Linear Gradient
      //     // Container(
      //     //   decoration: const BoxDecoration(
      //     //       gradient: LinearGradient(
      //     //           begin: Alignment.topLeft,
      //     //           end: Alignment.bottomLeft,
      //     //           colors: [Color.fromARGB(255, 169, 77, 255), Colors.purple])),
      //     // child: Image.asset('Assets/images/SplashSC.png', fit: BoxFit.fill),
      //     // ),
      //     Container(
      //   decoration: BoxDecoration(
      //       color: Color.fromARGB(50, 255, 193, 7),
      //       image: DecorationImage(
      //         image: AssetImage('Assets/images/SplashSC.png'),
      //         fit: BoxFit.contain,
      //       )),
      // ),
      //     nextScreen: const LoginPage(),
      //     splashTransition: SplashTransition.fadeTransition,
      //     // backgroundColor: const Color.fromARGB(255, 114, 43, 172),
      //     duration: 10000),
    );
  }
}
