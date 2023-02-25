import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tutor/components/comp.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tutor/pages/ForgotPassword.dart';
import 'package:tutor/pages/Home.dart';
import 'package:tutor/pages/Login.dart';
import 'package:tutor/pages/Profile.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});
  @override
  State<StatefulWidget> createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
  SignUpPageState({Key? key});
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
  TextEditingController ctrl_repasscode = TextEditingController();
  //============================================================================

  //============================================================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: basecolor,
        title: Text.rich(TextSpan(
            text: 'Register',
            style: TextStyle(
                fontFamily: 'sen',
                fontWeight: FontWeight.bold,
                color: black,
                fontSize: 28))),
      ),
      body: ListView(
        padding: EdgeInsetsDirectional.only(top: 15),
        children: [
          Container(
            color: Colors.amberAccent,
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            width: MediaQuery.of(context).size.width,
            child: ListView(
              children: <Widget>[
                
                // Enter ID
                Text('Student Name', style: TextStyle(color: Colors.black45)),
                TextField(),
                InputField(ctrl_username,
                    (login_type == 0) ? "Registration ID" : "Employee ID",
                    numbers: true),
                SizedBox(height: 15.0),
                // Enter Password
                PasswordField(ctrl_passcode, "Password", numbers: true),
                // confirm Password
                PasswordField(ctrl_repasscode, "Password", numbers: true),

                SizedBox(height: 25.0),
                // Register
                LoadButton(
                    idle_txt: "REGISTER",
                    load_txt: "Registering...",
                    action: () async {
                      debugPrint("Loding");
                      await Future.delayed(const Duration(milliseconds: 330));
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()));
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
