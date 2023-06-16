// import 'package:flutter/cupertino.dart';
// import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tutor/api/api.dart';
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
  // static const routeName = '/login';
  // final Role role;
  const LoginPage({
    super.key,
    //  required this.role
  });
  @override
  State<StatefulWidget> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool obscure = false;

  LoginPageState({Key? key});

  //============================================================================
  // @override
  // void initState() {
  //   super.initState();
  // }

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  // }
  //============================================================================

  //============================================================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(children: [
        ///////////////// Logo //////////////////////////////////
        Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 3,
            decoration: const BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(
                    fit: BoxFit.fitHeight,
                    image: AssetImage('Assets/images/tutoricon.png')))),
        const SizedBox(height: 15),
        ///////////////// login Section //////////////////////////////////
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
                            controller: emailController,
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
                            color: white),
                        child: TextField(
                            controller: passwordController,
                            style: TextStyle(color: black),
                            obscureText: obscure,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Icon(Icons.lock, color: black),
                                suffix: IconButton(
                                    onPressed: () {
                                      setState(() {});
                                      obscure = !obscure;
                                    },
                                    icon: Icon(obscure
                                        ? Icons.visibility_off
                                        : Icons.remove_red_eye),
                                    iconSize: 20),
                                hintText: 'Password',
                                hintStyle: TextStyle(color: black),
                                contentPadding:
                                    const EdgeInsets.symmetric(vertical: 3)))),
                    const SizedBox(height: 10),
                    ///////////////// Forget password  //////////////////////////////////
                    RichText(
                        text: TextSpan(
                            text: " ",
                            style: const TextStyle(
                                // color: black,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold),
                            children: <TextSpan>[
                          TextSpan(
                              text: 'Forget your password?',
                              style: const TextStyle(
                                  // decoration: TextDecoration.underline,
                                  decorationColor: Colors.blue,
                                  // decorationThickness: 1.5,
                                  color: Colors.blue,
                                  // color: black,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ForgotPassword())))
                        ])),
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
                          final email = emailController.text;
                          final password = passwordController.text;
                          final response = await login(email, password);
                          if (response['success']) {
                            // Login successful
                            final accessToken = response['accessToken'];
                            debugPrint(accessToken);
                            // Save token to local storage or global state
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const NavBar()));
                          } else {
                            // Login failed
                            final message = response['message'];
                            debugPrint(message);
                            ScaffoldMessenger.of(context)
                                .showSnackBar(SnackBar(content: Text(message)));
                          }
                          debugPrint("Loding");
                          await Future.delayed(const Duration(seconds: 2));
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const NavBar()));
                        }),
                    const SizedBox(height: 55),
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
