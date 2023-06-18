// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tutor/components/comp.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tutor/pages/Login/ForgotPassword.dart';
import 'package:tutor/pages/Login/new_password.dart';

class OTP extends StatefulWidget {
  // const OTP({super.key});
  final String PhoneNumber;
//  OTP({super.key, required this.PhoneNumber});
  const OTP({Key? key, required this.PhoneNumber}) : super(key: key);

  @override
  State<StatefulWidget> createState() => OTPState(PhoneNumber);
}

class OTPState extends State<OTP> {
  OTPState( this.PhoneNumber, {Key? key});
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
  TextEditingController otp = TextEditingController();
    final String PhoneNumber;

  //============================================================================

  //============================================================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset(
                "Assets/images/log.svg",
                width: MediaQuery.of(context).size.width * 0.5,
                color: basecolor,
              ),
              const SizedBox(height: 70.0),
              // title
              const Text(
                'OTP VERIFICATION',
                style: TextStyle(
                    fontFamily: 'sen',
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15.0),
              // Hint
              //////////+ PhoneNumber.toString()
              Text('Enter the OTP sent to$PhoneNumber',
                  style: const TextStyle(color: Colors.black54, fontSize: 15)),
              //Text(PhoneNumber),
              const SizedBox(height: 25.0),
              // Enter code
              InputField(otp, "Enter the code", numbers: true),
              const SizedBox(height: 25.0),
              // Re-send
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't receive code?"),
                  ButtonBar(alignment: MainAxisAlignment.start, children: [
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ForgotPassword()));
                        },
                        child: const Text('Re-send',
                            style: TextStyle(
                                decoration: TextDecoration.underline)))
                  ]),
                ],
              ),
              const SizedBox(height: 25.0),
              // Submit
              LoadButton(
                  idle_txt: "Submit",
                  // load_txt: "Continue..",
                  action: () async {
                    // debugPrint("Loding");
                    // await Future.delayed(Duration(seconds: 2));
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const NewPassword()),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}