import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tutor/N/home.dart';
import 'package:tutor/components/NavBar.dart';
import 'package:tutor/components/comp.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tutor/pages/ForgotPassword.dart';
import 'package:tutor/pages/Home.dart';
import 'package:tutor/pages/SignUp.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<StatefulWidget> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  LoginPageState({Key? key});
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  //============================================================================
  //============================================================================

  //============================================================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(children: [
              // Btn down
              Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            width: MediaQuery.of(context).size.width,
            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
                Widget>[
              // Sign In button
              MaterialButton(
                  // minWidth: 20,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(70.0)),
                  padding: const EdgeInsets.all(0.0),
                  child: Ink(
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.deepPurple,
                                Color.fromARGB(255, 188, 112, 207)
                              ]),
                          borderRadius: BorderRadius.all(Radius.circular(70.0))),
                      child: Container(
                          constraints: const BoxConstraints(
                              maxWidth: 150,
                              // minWidth: 30.0,
                              minHeight: 44.0), // min sizes for Material buttons
                          alignment: Alignment.center,
                          child: const Text(
                            'LOGIN',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25),
                            textAlign: TextAlign.center,
                          ))),
                  onPressed: () async {
                    debugPrint("Loding");
                    await Future.delayed(const Duration(seconds: 2));
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => const NavBar()));
                  }),
              const SizedBox(height: 10),
              // Don't have account
              RichText(
                  text: TextSpan(
                      text: "Don't have an account?",
                      style: const TextStyle(
                        // color: black,
                        fontSize: 18.0,
                      ),
                      children: <TextSpan>[
                    TextSpan(
                        text: 'Register here',
                        style: const TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 18.0,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const MainScreen()))
                              })
                  ]))
            ]))
            ]),
        ));
  }
}
