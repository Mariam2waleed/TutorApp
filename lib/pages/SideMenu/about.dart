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
                        ' Our application is designed to provide users with a seamless and user-friendly experience. We believe that technology should be empowering and accessible to everyone, and we strive to create products that reflect these values. ',
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
