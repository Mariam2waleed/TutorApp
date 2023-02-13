import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tutor/components/comp.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tutor/pages/ForgotPassword.dart';
import 'package:tutor/pages/Login.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});
  @override
  State<StatefulWidget> createState() => NewPasswordState();
}

class NewPasswordState extends State<NewPassword> {
  NewPasswordState({Key? key});
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
  TextEditingController ctrl_passcode = TextEditingController();
  TextEditingController ctrl_re_passcode = TextEditingController();
  //============================================================================

  //============================================================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: padding(30, 10),
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset("assets/images/aast.svg",
                  width: MediaQuery.of(context).size.width * 0.5,
                  color: basecolor),
              SizedBox(height: 100.0),
              // New password
              PasswordField(ctrl_passcode, "Enter new password", numbers: true),
              SizedBox(height: 25.0),
              // Re-password
              PasswordField(ctrl_re_passcode, "Re-enter new password",
                  numbers: true),
              SizedBox(height: 65.0),
              // Save
              LoadButton(
                  idle_txt: "Save",
                  action: () async {
                    debugPrint("Loding");
                    await Future.delayed(Duration(seconds: 1));
                    if (ctrl_passcode == ctrl_re_passcode) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()));
                    } else
                      ctrl_re_passcode.clear();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
