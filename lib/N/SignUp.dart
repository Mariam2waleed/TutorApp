import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Constants/Dimensions.dart';
import 'Login.dart';
import 'SetUpProfile3.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}
class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                        height: MyDim.myHeight(context)*0.25,
                        child: Image.asset(
                          'Assets/images/triangle.png', )),
                    Padding(
                      padding: EdgeInsets.only(top: MyDim.paddingUnit*11,left: MyDim.paddingUnit*2),
                      child: Text('Sign Up',
                        style: TextStyle(fontSize: MyDim.fontSizebetween, fontWeight: FontWeight.w700),),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(bottom: MyDim.paddingUnit*1, right: MyDim.paddingUnit*2),
                      child: Container(
                        width: MyDim.myWidth(context)*0.25,
                        height: MyDim.myHeight(context)*0.10,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('Assets/images/logo.png')),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0,),
                Text('Fill out this form',style: TextStyle(fontSize:MyDim.fontSizeMedium,color:Colors.grey[600]),),
                Divider(
                  thickness: 1,
                  color: Colors.black,
                  endIndent: MyDim.paddingUnit*3,
                  indent: MyDim.paddingUnit*3,
                ),
                SizedBox(
                  height: 30.0,
                ),

                //first name
                SizedBox(
                  width: 370.0,
                  child: TextFormField(
                    style: TextStyle(
                        fontSize: 20.0
                    ),
                    decoration: InputDecoration(
                      labelText: 'First Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 30.0,
                ),

                //Last name
                SizedBox(
                  width: 370.0,
                  child: TextFormField(
                    style: TextStyle(
                        fontSize: 20.0
                    ),
                    decoration: InputDecoration(
                      labelText: 'Last Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 30.0,
                ),

                //Username
                SizedBox(
                  width: 370.0,
                  child: TextFormField(
                    style: TextStyle(
                        fontSize: 20.0
                    ),
                    decoration: InputDecoration(
                      labelText: 'Username',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),

                //Email
                SizedBox(
                  width: 370.0,
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(
                        fontSize: 20.0
                    ),
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.alternate_email_rounded,color: Colors.black,),
                      labelText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 30.0,
                ),

                //National ID
                SizedBox(
                  width: 370.0,
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    style: TextStyle(
                        fontSize: 20.0
                    ),
                    decoration: InputDecoration(
                      labelText: 'National ID',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 30.0,
                ),

                //Passwrord
                SizedBox(
                  width: 370.0,
                  child: TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    style: TextStyle(
                        fontSize: 20.0
                    ),
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.remove_red_eye,color: Colors.black,),
                      labelText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 30.0,
                ),

                //Confirm Password
                SizedBox(
                  width: 370.0,
                  child: TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    style: TextStyle(
                        fontSize: 20.0
                    ),
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.remove_red_eye,color: Colors.black,),
                      labelText: 'Confirm Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                  ),
                ),


                SizedBox(
                  height: 30.0,
                ),
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                      color: Color(0xFF00CDD0),
                    ),
                    width: MyDim.myWidth(context)*0.4,
                    child: TextButton(onPressed: (){
                      setState(() {
                        Navigator.push(context,MaterialPageRoute(builder:(context)=>SetupProfile3()));
                      });
                    },
                        child:Text('Sign up',style: TextStyle(color: Colors.white,fontSize: MyDim.fontSizeButtons),))),
                SizedBox(height:MyDim.SizedBoxtiny*1 ,),
                Row(
                  mainAxisAlignment:MainAxisAlignment.center,
                  children: [
                    Text('Already have an account?'),
                    GestureDetector(child: Text('Login  '  ,style: TextStyle(decoration:TextDecoration.underline,),
                    ),
                      onTap: (){
                        setState(() {
                          Navigator.push(context,MaterialPageRoute(builder:(context)=>LoginScreen()));
                        });
                      },
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),


    );
  }
}
