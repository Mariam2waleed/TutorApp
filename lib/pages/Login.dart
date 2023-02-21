import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tutor/components/NavBar.dart';
import 'package:tutor/components/comp.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tutor/pages/ForgotPassword.dart';
import 'package:tutor/pages/Home.dart';
import 'package:tutor/pages/SignUp.dart';

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
  int login_type = 0;
  TextEditingController ctrl_username = TextEditingController();
  TextEditingController ctrl_passcode = TextEditingController();
  //============================================================================
  Widget login_type_selector() {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: CupertinoSegmentedControl(
            // height: 70,
            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
            selectedColor: basecolor,
            borderColor: basecolor,
            pressedColor: basecolor,
            unselectedColor: white,
            groupValue: login_type,
            onValueChanged: (int new_index) {
              setState(() {
                login_type = new_index;
              });
            },
            children: ["Student", "Teacher"].asMap().map((index, value) {
              return MapEntry(
                  index,
                  Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(value,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                            SizedBox(width: 5.0),
                            Icon(Icons.person),
                          ])));
            })));
  }

  //============================================================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:// ListView(
        // children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset("assets/images/log.svg",
                    width: MediaQuery.of(context).size.width * 0.5,
                    color: basecolor),
                SizedBox(height: 20.0),
                Text("TUTOR",
                    style: TextStyle(
                        color: basecolor,
                        fontSize: 34,
                        fontWeight: FontWeight.bold)),
                // Text("Community", style: styler(basecolor, 20, wnoral)),
                SizedBox(height: 15.0),
                // Student or Teacher
                login_type_selector(),
                SizedBox(height: 15.0),
                // Enter ID
                InputField(ctrl_username,
                    (login_type == 0) ? "Registration ID" : "Employee ID",
                    numbers: true),
                SizedBox(height: 15.0),
                // Enter Password
                PasswordField(ctrl_passcode, "Password", numbers: true),
                // Forgot password
                ButtonBar(alignment: MainAxisAlignment.start, children: [
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ForgotPassword()));
                      },
                      child: const Text('Forgot Password?',
                          style:
                              TextStyle(decoration: TextDecoration.underline)))
                ]),
                SizedBox(height: 25.0),
                // Sign In
                LoadButton(
                    idle_txt: "Sign In",
                    load_txt: "Signing In",
                    action: () async {
                      debugPrint("Loding");
                      await Future.delayed(const Duration(seconds: 1));
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const NavBar()));
                    }),
                // don't have account.
                ButtonBar(alignment: MainAxisAlignment.start, children: [
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpPage()));
                      },
                      child: Text('Dont have account? Sign up',
                          style:
                              TextStyle(decoration: TextDecoration.underline)))
                ]),
              ],
            ),
          ),
      //   ],
      // ),
    );
  }
}
