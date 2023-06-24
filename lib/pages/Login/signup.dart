// import 'package:flutter/cupertino.dart';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tutor/components/comp.dart';
import 'package:tutor/pages/Login/login.dart';

import 'package:image_picker/image_picker.dart';

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
  bool isPicked = false;
  bool obscure = false;
  //============================================================================
  File? pickedProfilePic;
  TextEditingController nameController = TextEditingController();

  TextEditingController numberController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController levelController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  //============================================================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: basecolor3,
            title: Text.rich(TextSpan(
                text: 'Register',
                style: TextStyle(
                    fontFamily: 'sen',
                    fontWeight: FontWeight.bold,
                    color: white,
                    fontSize: 28)))),
        body:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          CircleAvatar(
            radius: 50.0,
          ),
          TextButton.icon(
              onPressed: () async {
                final ImageSource? imageSource = await showDialog<ImageSource>(
                    context: context,
                    builder: (context) =>
                        ImagePickerWidget(text: "Choose Image source" + ":"));
                if (imageSource == null) {
                  return;
                }
                final _pickedFile =
                    await ImagePicker().pickImage(source: imageSource);
                if (_pickedFile != null) {
                  pickedProfilePic = File(_pickedFile.path);
                  isPicked = true;
                  setState(() {});
                }
              },
              icon: const Icon(Icons.image),
              label: Text("pick a profile picture")),
          CustomTextFiled(
              textController: emailController,
              type: TextInputType.emailAddress,
              labelText: "Email",
              vMargin: 0),
          CustomTextFiled(
              textController: nameController,
              labelText: "username",
              vMargin: 0),
          CustomTextFiled(
              textController: ageController,
              labelText: "age",
              type: TextInputType.number,
              vMargin: 0),
          CustomTextFiled(
              textController: numberController,
              labelText: "phone number",
              type: TextInputType.number,
              vMargin: 0),
          CustomTextFiled(
              textController: levelController,
              labelText: "level",
              type: TextInputType.number,
              vMargin: 0),
          CustomTextFiled(
              textController: codeController,
              labelText: "Code",
              type: TextInputType.number,
              vMargin: 0),
          CustomTextFiled(
              textController: passwordController,
              labelText: "Password",
              vMargin: 5,
              isPrivate: obscure,
              action: TextInputAction.done,
              suffix: IconButton(
                  onPressed: () {
                    setState(() {});
                    obscure = !obscure;
                  },
                  icon:
                      Icon(obscure ? Icons.visibility : Icons.visibility_off))),
          CustomTextFiled(
              textController: locationController,
              labelText: "Location",
              vMargin: 0),
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
                      borderRadius: BorderRadius.all(Radius.circular(70.0))),
                  child: Container(
                      constraints: const BoxConstraints(
                          maxWidth: 150,
                          // minWidth: 30.0,
                          minHeight: 44.0), // min sizes for Material buttons
                      alignment: Alignment.center,
                      child: const Text('Done',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                          textAlign: TextAlign.center))),
              onPressed: () async {
                debugPrint("Loding");
                await Future.delayed(const Duration(seconds: 2));
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const LoginPage()));
              }),
        ]));
  }
}
