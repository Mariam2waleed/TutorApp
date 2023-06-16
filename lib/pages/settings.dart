import 'package:flutter/material.dart';
import 'package:tutor/api/api.dart';
import 'package:tutor/components/NavBar.dart';

import '../components/themeswitcher.dart';

import '../components/comp.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

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
                        child: Text(" Settings ",
                            style:
                                // GoogleFonts.pacifico(),
                                TextStyle(
                                    color: black,
                                    fontSize: 35.0,
                                    fontWeight: FontWeight.bold))),
                    ///////////////// Name  //////////////////////////////////
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(' Theme Switcher ',
                            style: TextStyle(fontSize: 25, color: white)),
                        Expanded(child: SizedBox()),
                        ThemeSwitcher(),
                      ],
                    ),

                    const SizedBox(height: 15),
                    ///////////////// Email  //////////////////////////////////
                    const SizedBox(height: 15),
                    ///////////////// Sign In button  //////////////////////////////////
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
// class SettingsPage extends StatelessWidget {
//   const SettingsPage({Key? key}) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('Home Page'),
// //       ),
// //       body: Center(
// //         child: ElevatedButton(
// //           onPressed: () {
// //             Navigator.push(
// //               context,
// //               MaterialPageRoute(builder: (context) => ThemePage()),
// //             );
// //           },
// //           child: const Text('Go to Theme Page'),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class ThemePage extends StatelessWidget {
// //   const ThemePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Theme Page'),
//         actions: const [
//           ThemeSwitcher(),
//         ], 
//       ),
//       body: const Center(
//         child: Text('Toggle the switch to change the theme'),
//       ),
//     );
//   }
