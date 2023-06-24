import 'package:flutter/material.dart';
// import 'package:tutor/api/api.dart';
// import 'package:tutor/components/NavBar.dart';

// import '../components/themeswitcher.dart';

import '../../components/comp.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(children: [
        ///////////////// Logo //////////////////////////////////
        Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 3,
            decoration: const BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(
                    fit: BoxFit.fitHeight,
                    image: AssetImage('Assets/images/tutoricon.png')))),
        const SizedBox(height: 15),
        ///////////////// login Section //////////////////////////////////
        Expanded(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: basecolor3,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ////////////////// Contact Us ////////////////////
                    Center(
                        child: Text(" About  ",
                            style:
                                // GoogleFonts.pacifico(),
                                TextStyle(
                                    color: black,
                                    fontSize: 35.0,
                                    fontWeight: FontWeight.bold))),
                    ///////////////// Name  //////////////////////////////////

                    // mainAxisAlignment: MainAxisAlignment.center,
                    // children: [
                    Text(
                        ' Welcome to our tutor application! We are committed to providing high-quality, personalized tutoring services to students of all ages and levels. ',
                        style: TextStyle(fontSize: 20, color: black)),
                    Text(
                        ' Our team of experienced tutors is dedicated to helping students achieve their academic goals and succeed in the classroom. Whether you need help with math, science, English, or any other subject, we have a tutor who can help. ',
                        style: TextStyle(fontSize: 20, color: black)),
                    // const Expanded(child: SizedBox()),
                    Text(
                        ' Our tutors are not only experts in their fields, but they are also skilled at working with students of all learning styles and abilities. They are patient, encouraging, and committed to helping each student reach their full potential. ',
                        style: TextStyle(fontSize: 20, color: black)),
                    // const Expanded(child: SizedBox()),
                    Text(
                        ' Our application offers a convenient and easy-to-use platform for scheduling tutoring sessions and communicating with your tutor. You can access our platform from anywhere, at any time, making it easy to fit tutoring into your busy schedule. ',
                        style: TextStyle(fontSize: 20, color: black)),
                    // const Expanded(child: SizedBox()),
                    Text(
                        ' We believe that education is the key to success, and we are passionate about helping students achieve their academic goals. Whether you need help preparing for an exam, catching up on missed assignments, or mastering a challenging subject, we are here to help. ',
                        style: TextStyle(fontSize: 20, color: black)),
                    // const Expanded(child: SizedBox()),
                    Text(
                        ' Thank you for choosing our tutor application. We look forward to helping you achieve your academic goals and succeed in the classroom. ',
                        style: TextStyle(fontSize: 20, color: black)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ]),
    ));
  }
}
