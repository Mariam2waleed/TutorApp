// import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tutor/components/NavBar.dart';
import 'package:tutor/components/comp.dart';
import 'package:tutor/pages/ForgotPassword.dart';
// import 'package:tutor/components/comp.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:tutor/pages/ForgotPassword.dart';
// import 'package:tutor/pages/Home.dart';
// import 'package:tutor/pages/SignUp.dart';
// import 'package:http/http.dart' as http;

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
        ///////////////// Icon //////////////////////////////////
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 3,
          decoration: const BoxDecoration(
              color: Colors.transparent,
              image: DecorationImage(
                  fit: BoxFit.fitHeight,
                  image: AssetImage('Assets/images/tutoricon.png'))),
        ),
        const SizedBox(height: 15),
        ///////////////// login  //////////////////////////////////
        Expanded(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: basecolor3,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///////////////// Email  //////////////////////////////////
                    Text('Email',
                        style: TextStyle(
                            color: black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: white),
                        child: TextField(
                            style: TextStyle(color: black),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Icon(Icons.email, color: black),
                                hintText: 'Email',
                                hintStyle: TextStyle(color: black)))),
                    const SizedBox(height: 15),
                    ///////////////// Password  //////////////////////////////////
                    const Text('Password',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 15),
                    Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: white,
                        ),
                        child: TextField(
                            style: TextStyle(color: black),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Icon(Icons.lock, color: black),
                                hintText: 'Password',
                                hintStyle: TextStyle(color: black)))),
                    const SizedBox(height: 35),
                    ///////////////// Sign In button  //////////////////////////////////
                    MaterialButton(
                        minWidth: 20,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(70.0)),
                        padding: const EdgeInsets.all(0.0),
                        child: Center(
                          child: Ink(
                              decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.deepPurple,
                                        Color.fromARGB(255, 188, 112, 207)
                                      ]),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(70.0))),
                              child: Container(
                                  constraints: const BoxConstraints(
                                      maxWidth: 150,
                                      // minWidth: 30.0,
                                      minHeight:
                                          44.0), // min sizes for Material buttons
                                  alignment: Alignment.center,
                                  child: Text(
                                    'LOGIN',
                                    style: TextStyle(
                                        color: white,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ))),
                        ),
                        onPressed: () async {
                          debugPrint("Loding");
                          await Future.delayed(const Duration(seconds: 2));
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const NavBar()));
                        }),
                    const SizedBox(height: 35),
                    ///////////////// Don't have account  //////////////////////////////////
                    RichText(
                      text: TextSpan(
                          text: "Don't have an account? ",
                          style: const TextStyle(
                              // color: black,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Register here',
                                style: const TextStyle(
                                  decoration: TextDecoration.underline,
                                  decorationColor: Colors.blue,
                                  decorationThickness: 1.5,
                                  color: Colors.blue,
                                  fontSize: 18.0,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const ForgotPassword())))
                          ]),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ]),
    ));
  }
}
