// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tutor/components/comp.dart';
import 'package:tutor/pages/Login.dart';


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
                    color: white,
                    fontSize: 28)))),
        body: ListView(padding: const EdgeInsetsDirectional.only(top: 15), children: [
        //// Done button
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
                    borderRadius: BorderRadius.all(Radius.circular(70.0)),
                  ),
                  child: Container(
                      constraints: const BoxConstraints(
                          maxWidth: 150,
                          // minWidth: 30.0,
                          minHeight: 44.0), // min sizes for Material buttons
                      alignment: Alignment.center,
                      child: const Text(
                        'Done',
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
                    MaterialPageRoute(builder: (context) => const LoginPage()));
              }),
          // Container(
          //     color: Colors.amberAccent,
          //     padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          //     width: MediaQuery.of(context).size.width,
          //     child: ListView(children: <Widget>[
          //       // Enter ID
          //       Text('Student Name', style: TextStyle(color: Colors.black45)),
          //       TextField(),
          //       InputField(ctrl_username,
          //           (login_type == 0) ? "Registration ID" : "Employee ID",
          //           numbers: true),
          //       SizedBox(height: 15.0),
          //       // Enter Password
          //       PasswordField(ctrl_passcode, "Password", numbers: true),
          //       // confirm Password
          //       PasswordField(ctrl_repasscode, "Password", numbers: true),

          //       SizedBox(height: 25.0),
          //       // Register
          //       LoadButton(
          //           idle_txt: "REGISTER",
          //           load_txt: "Registering...",
          //           action: () async {
          //             debugPrint("Loding");
          //             await Future.delayed(const Duration(milliseconds: 330));
          //             Navigator.pushReplacement(
          //                 context,
          //                 MaterialPageRoute(
          //                     builder: (context) => const LoginPage()));
          //           })
          //     ]))
        ]));
  }
}
