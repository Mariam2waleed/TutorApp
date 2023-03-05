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
  //============================================================================
 
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
              ],
            ),
          ),
      //   ],
      // ),
    );
  }
}
