import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Login.dart';
import 'SignUp.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override


  Widget build(BuildContext context) {
    var StrokeAlign;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
             height: 700.0,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage('Assets/images/background.png'),
                fit: BoxFit.fill)
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children:<Widget> [
                  /*  Align(
                    alignment: Alignment.bottomCenter,
                  ),*/
                  Container(
                      width: 260,
                      height: 250,
                      child: Image.asset('Assets/images/logo.png')),
                  Padding(
                    padding: const EdgeInsets.only(left: 60),
                    child: Text('your life savior for your governmental needs'  ,style: TextStyle(fontSize: 28,fontWeight: FontWeight.normal)),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Container(
                      width: 190,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(  color: Color(0xFF00CDD0),width:2 ),
                      ),
                      child: TextButton(onPressed:(){
                        setState(() {
                          Navigator.push(context,MaterialPageRoute(builder:(context)=>LoginScreen()));
                        });
                      },
                          child: Text('Login',style:TextStyle(fontSize:30,color: Colors.black) ,))),
                  SizedBox(height: 40),
                  Container(
                      clipBehavior: Clip.hardEdge,
                      width: 190,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(  color: Color(0xFF00CDD0),width: 2),
                      ),
                      child: TextButton(onPressed:(){
                        setState(() {
                          Navigator.push(context,MaterialPageRoute(builder:(context)=>SignUpScreen()));
                        });
                      },
                          child: Text('Sign Up',style:TextStyle(fontSize:30,color: Colors.black) ,)))

                ],

              ),
            ),

          ],
        ),
      ),


    );
  }
}
