// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tutor/components/comp.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:tutor/pages/ForgotPassword.dart';
import 'package:tutor/pages/Login/login.dart';

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
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset("Assets/images/tutoricon.png",
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.3),
              const SizedBox(height: 100.0),
              const Text(' Change your password',
                  style: TextStyle(
                      fontFamily: 'sen',
                      fontSize: 25,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 60.0),

              // New password
              PasswordField(ctrl_passcode, "Enter new password", numbers: true),
              const SizedBox(height: 25.0),
              // Re-password
              PasswordField(ctrl_re_passcode, "Re-enter new password",
                  numbers: true),
              const SizedBox(height: 65.0),
              // Save
              LoadButton(
                  idle_txt: "Save",
                  action: () async {
                    debugPrint("Loding");
                    await Future.delayed(const Duration(seconds: 1));
                    if (ctrl_passcode == ctrl_re_passcode) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    } else {
                      ctrl_re_passcode.clear();
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
