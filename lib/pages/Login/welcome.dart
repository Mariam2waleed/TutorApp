import 'package:flutter/material.dart';

import 'package:tutor/components/comp.dart';
import 'package:tutor/pages/Login/login.dart';

class RoleScreen extends StatefulWidget {
  static const routeName = '/roles';
  const RoleScreen({super.key});

  @override
  State<RoleScreen> createState() => _RoleScreenState();
}

class _RoleScreenState extends State<RoleScreen> {
  int _selectedindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 45),
            Text(" Welcome ! ",
                style: TextStyle(
                    color: basecolor,
                    fontWeight: FontWeight.bold,
                    fontSize: 35)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: Column(
                children: [
                  const SizedBox(height: 25),
                  //////////////////////////////// Teacher , Student //////////////////
                  Stack(children: [
                    Column(children: [
                      Image.asset('Assets/images/teacher.png',
                          height: 150, width: 255),
                      Text('Teacher',
                          style: TextStyle(fontSize: 25, color: basecolor))
                    ]),
                    Positioned(
                      right: 0,
                      child: Transform.scale(
                          scale: 1.75,
                          child: Radio(
                              activeColor: basecolor,
                              value: 1,
                              groupValue: _selectedindex,
                              onChanged: (value) {
                                setState(() {
                                  _selectedindex = value!;
                                });
                              })),
                    ),
                  ]),
                  const SizedBox(height: 25),
                  Stack(
                    children: [
                      Column(children: [
                        Image.asset('Assets/images/student.png',
                            height: 150, width: 255),
                        Text('Student',
                            style: TextStyle(fontSize: 25, color: basecolor))
                      ]),
                      Positioned(
                        right: 0,
                        child: Transform.scale(
                          scale: 1.75,
                          child: Radio(
                              activeColor: basecolor,
                              value: 2,
                              groupValue: _selectedindex,
                              onChanged: (value) {
                                setState(() {
                                  _selectedindex = value!;
                                });
                              }),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  //////////////////////////////// Btn Go //////////////////////
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
                                  child: Text('GO',
                                      style: TextStyle(
                                          color: white,
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center)))),
                      onPressed: () async {
                        // debugPrint("Loding");
                        // await Future.delayed(const Duration(seconds: 2));
                        if (_selectedindex == 1) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginPage()));
                          // Navigator.push(
                          //     context,
                          //     generateRoute(RouteSettings(
                          //         name: LogInScreen.routeName,
                          //         arguments: {'role': 'tutor'})));
                        } else if (_selectedindex == 2) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginPage()));
                          // Navigator.push(
                          //     context,
                          //     generateRoute(RouteSettings(
                          //         name: LogInScreen.routeName,
                          //         arguments: {'role': 'student'})));
                        } else {
                          const snackBar = SnackBar(
                              content: Text('You have to choose a Role !'));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
