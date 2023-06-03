import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Constants/Dimensions.dart';
import 'SignUp.dart';
import 'home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                  height: MyDim.myHeight(context) * 0.26,
                  child: Image.asset(
                    'Assets/images/triangle.png',
                  )),
              Padding(
                padding: const EdgeInsets.only(
                    bottom: MyDim.paddingUnit * 1,
                    right: MyDim.paddingUnit * 2),
                child: Container(
                  width: MyDim.myWidth(context) * 0.25,
                  height: MyDim.myHeight(context) * 0.10,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('Assets/images/logo.png')),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 3),
            child: Text(
              'Login ',
              style: TextStyle(
                  fontSize: MyDim.fontSizeLarge, fontWeight: FontWeight.bold),
            ),
          ),
          Divider(
            indent: MyDim.myWidth(context) * 0.25,
            endIndent: 100,
            thickness: 3,
            color: Color(0xFF00CDD0),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            height: 350,
            width: 300,
            decoration: BoxDecoration(
              color: Color(0xFF00CDD0).withOpacity(0.1),
              borderRadius: BorderRadius.all(Radius.circular(40)),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF00CDD0).withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 20,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            child: Stack(
              children: [
                //Username
                Padding(
                  padding:
                      const EdgeInsets.only(top: 25.0, right: 10.0, left: 10.0),
                  child: SizedBox(
                    height: 200.0,
                    width: 300.0,
                    child: TextFormField(
                      style: TextStyle(fontSize: 20.0),
                      decoration: InputDecoration(
                        labelText: 'Username',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(
                      top: 120.0, right: 10.0, left: 10.0),
                  child: SizedBox(
                    width: 300.0,
                    child: TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      style: TextStyle(fontSize: 20.0),
                      decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.remove_red_eye,
                          color: Colors.black,
                        ),
                        labelText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 200, left: 30),
                  child: GestureDetector(
                    child: Text(
                      'Forget password ?',
                      style: TextStyle(
                          fontSize: 14,
                          decoration: TextDecoration.underline,
                          color: Colors.black),
                    ),
                  ),
                ),

                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 195),
                  child: Center(
                    child: Container(
                        width: MyDim.myWidth(context) * 0.4,
                        decoration: BoxDecoration(
                            color: Color(0xFF00CDD0),
                            borderRadius: BorderRadius.circular(30)),
                        child: TextButton(
                            onPressed: () {
                              setState(() {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MainScreen()));
                              });
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(
                                  fontSize: MyDim.fontSizeMedium,
                                  color: Colors.white),
                            ))),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 315),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Have no account ?/'),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUpScreen()));
                            });
                          },
                          child: Text('Sign up',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                              )))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
