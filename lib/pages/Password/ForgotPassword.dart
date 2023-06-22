import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
import 'package:tutor/components/comp.dart';
// import 'package:flutter_svg/svg.dart';
import 'package:tutor/pages/Password/OTP.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});
  @override
  State<StatefulWidget> createState() => ForgotPasswordState();
}

class ForgotPasswordState extends State<ForgotPassword> {
  ForgotPasswordState({Key? key});
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
  TextEditingController ctrl_PhoneNumber = TextEditingController();
  //============================================================================

  //============================================================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset("Assets/images/tutoricon.png",
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.height * 0.3),
                  const SizedBox(height: 60.0),
                  const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title
                        Text('Forgot Password?',
                            style: TextStyle(
                                fontFamily: 'sen',
                                fontSize: 25,
                                fontWeight: FontWeight.bold)),
                        SizedBox(height: 15.0),
                        // Hint
                        Text(
                            'Don’t worry ! It happens. Please enter the phone number we will send the OTP in this phone number.',
                            style:
                                TextStyle(color: Colors.black54, fontSize: 15))
                      ]),
                  const SizedBox(height: 15.0),
                  // Enter Phone Nuber
                  InputField(ctrl_PhoneNumber, "Enter the phone Number",
                      numbers: true),
                  const SizedBox(height: 25.0),
                  // Continue
                  LoadButton(
                      idle_txt: "Continue",
                      load_txt: "Continue..",
                      action: () async {
                        // debugPrint("Loding");
                        // await Future.delayed(Duration(seconds: 2));
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                OTP(PhoneNumber: ctrl_PhoneNumber.toString()),
                          ),
                        );
                      }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
