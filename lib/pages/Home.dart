// import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tutor/components/comp.dart';
// import 'package:tutor/pages/Classwork.dart';
import 'package:tutor/pages/Course.dart';
import 'package:tutor/pages/Profile.dart';
// import 'package:tutor/pages/Schedule.dart';
import 'package:tutor/service/store.dart';
// import 'package:tutor/pages/Notification.dart';
// import 'package:google_fonts/google_fonts.dart';
import '../components/AppDrawer.dart';
// import '../components/NavBar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  HomePageState({Key? key});
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
  //===========================================================================

  //============================================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            toolbarHeight: 110.0,
            elevation: 0,
            backgroundColor: white,
            // automaticallyImplyLeading: false,
            // leading: IconButton(
            //   icon: Icon(Icons.menu, color: black),
            //   onPressed: () {
            //     Scaffold.of(context).openDrawer();
            //   },
            //   tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            // ),
            iconTheme: IconThemeData(color: black),
            title: Center(
                child: Text(
              "Home",
              style: TextStyle(color: black, fontWeight: FontWeight.bold),
            )),
            actions: [
              IconButton(
                  highlightColor: Colors.deepPurple[300],
                  iconSize: 48.0,
                  icon:
                      // ImageIcon(Image.asset('Assets/images/Me.jpeq').image)
                      CircleAvatar(
                          radius: 50,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.asset(currUser!.profileImage,
                                  fit: BoxFit.cover))),
                  onPressed: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ProfilePage()))
                      })
            ]),
        drawer: const AppDrawer(),

        /////////////////////////////////////////////////
        body: ListView(children: [
          /// Subject
          Row(
            children: [
              Text("Subject Categories",
                  style:
                      // GoogleFonts.pacifico(),
                      TextStyle(
                          color: black,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold)),
              Icon(Icons.arrow_forward, color: black)
            ],
          ),
          // Body of home page
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Course Horizontal List
                    SizedBox(
                      height: 100.0,
                      child: ListView.builder(
                          // This next line does the trick.
                          scrollDirection: Axis.horizontal,
                          itemCount: group.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(50)),
                                        color: group[index].course_color),
                                    width: 100.0,
                                    child: GestureDetector(
                                        onTap: () {
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      CoursePage(
                                                          group[index].id)));
                                          // print(index);
                                        },
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(65),
                                                  child: Image.asset(
                                                    group[index].course_img,
                                                    fit: BoxFit.cover,
                                                    width: 80,
                                                    height: 80,
                                                  )),
                                              // Image.asset(
                                              //     group[index].course_img,
                                              //     width: 40,
                                              //     height: 40,
                                              //     fit: BoxFit.cover),
                                              Text(group[index].course_name,
                                                  style: TextStyle(
                                                      color: black,
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w900))
                                            ]))));
                          }),
                    ),
                    const SizedBox(height: 25),
                    // Home  Featured lists
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Featured lists',
                            style: TextStyle(
                                color: basecolor,
                                fontSize: 25,
                                fontWeight: FontWeight.bold)),
                        const SizedBox(height: 2.5),
                        // Text('You can see all the new posts here',
                        //     style:
                        //         TextStyle(color: Colors.black54, fontSize: 15)),
                      ],
                    ),
                    const SizedBox(height: 15),
                    // Horizontal Featured lists
                    SizedBox(
                      height: 150.0,
                      child: ListView.builder(
                          // This next line does the trick.
                          scrollDirection: Axis.horizontal,
                          itemCount: group.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(50)),
                                        color: group[index].course_color),
                                    width: 145.0,
                                    child: GestureDetector(
                                        onTap: () {
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      CoursePage(
                                                          group[index].id)));
                                          print(index);
                                        },
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                  child: Image.asset(
                                                      'Assets/images/student.png',
                                                      fit: BoxFit.cover,
                                                      width: 130,
                                                      height: 130)),
                                              Text(group[index].course_name,
                                                  style: TextStyle(
                                                      color: black,
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w900))
                                            ]))));
                          }),
                    ),

                    const SizedBox(height: 15),
                    const Divider(color: Colors.grey, thickness: 2),
                    const SizedBox(height: 15),
                    /////////////////////////////////// Post ////////////////////////////////////////
                    Container(
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            color: Color.fromARGB(240, 236, 239, 236)),
                        child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(children: [
                              Row(children: [
                                CircleAvatar(
                                    radius: 20,
                                    backgroundColor: Colors.transparent,
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: Image.asset(
                                            currUser!.profileImage,
                                            fit: BoxFit.fill))),
                                Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              currUser!.fname + currUser!.lname,
                                              style: TextStyle(
                                                  color: black,
                                                  fontSize: 15.0)),
                                          Row(children: [
                                            Text('2 hr ',
                                                style: TextStyle(
                                                    color: black,
                                                    fontSize: 15.0)),
                                            Icon(Icons.people, color: basecolor)
                                          ])
                                        ]))
                              ]),
                              const SizedBox(height: 15),
                              Text(
                                  'Dear Students,                                                                                                            Thursday lectures are cancelled due to public holiday. All assignments will be due Sunday 17th',
                                  style: TextStyle(color: black, fontSize: 10)),
                              const SizedBox(height: 15),
                              const CupertinoTextField(
                                  padding: EdgeInsets.all(15),
                                  placeholder: 'Type a comment here..')
                            ])))
                  ]))
        ])
        //bottom navigation bar on scaffold
        //  bottomNavigationBar: const NavBar(),
        );
    // return scaffold;
  }
}

//============================================================================

//===========================================================================

//  alert
// Container(
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.all(Radius.circular(15)),
//       color: basecolor3,
//     ),
//     child: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Column(children: [
//           Row(children: [
//             CircleAvatar(
//               radius: 20,
//               child:
//                   SvgPicture.asset('Assets/images/log.svg'),
//             ),
//             Padding(
//                 padding: EdgeInsets.only(left: 10),
//                 child: Column(
//                     crossAxisAlignment:
//                         CrossAxisAlignment.start,
//                     children: [
//                       Text(currUser!.fname,
//                           style: TextStyle(
//                               color: white,
//                               fontSize: 15.0)),
//                       Text('2 hr ',
//                           style: TextStyle(
//                               color: white,
//                               fontSize: 15.0)),
//                     ])),
//             Spacer(),
//             Icon(
//               Icons.volume_up_rounded,
//               color: white,
//             )
//           ]),
//           SizedBox(height: 15),
//           Text(
//             'Dear Students,                                                                                                            Thursday lectures are cancelled due to public holiday. All assignments will be due Sunday 17th',
//             style: TextStyle(color: white, fontSize: 10),
//           )
//         ]))),
