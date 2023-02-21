import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tutor/components/comp.dart';
import 'package:tutor/pages/Classwork.dart';
import 'package:tutor/pages/Course.dart';
import 'package:tutor/pages/Profile.dart';
import 'package:tutor/pages/Schedule.dart';
import 'package:tutor/service/store.dart';
import 'package:tutor/pages/Notification.dart';

import '../components/NavBar.dart';

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
    var scaffold = Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.person),
        backgroundColor: basecolor,
        onPressed: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const ProfilePage()));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        toolbarHeight: 110.0,
        elevation: 0,
        backgroundColor: white,
        title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Hello ${currUser!.fname}',
                  style: const TextStyle(color: Colors.black45, fontSize: 14.0)),
              SizedBox(height: 5),
              Row(
                children: [
                  Text(
                    "Subject Categories",
                    style: TextStyle(
                        color: black,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Icon(Icons.arrow_forward, color: black),
                ],
              ),
              SizedBox(height: 2),
              const Text(
                "Choose your subject to find your tutor",
                style: TextStyle(color: Colors.black54, fontSize: 14.0),
              ),
            ]),
        actions: [
          IconButton(
              padding: EdgeInsets.only(right: 40),
              icon: Icon(
                Icons.notifications,
                color: basecolor,
                size: 35,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NotificationPage()),
                );
              })
        ],
      ),
      body: ListView(children: [
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Course Horizontal List
                  Container(
                    height: 150.0,
                    child: ListView.builder(
                      // This next line does the trick.
                      scrollDirection: Axis.horizontal,
                      itemCount: group.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              color: group[index].course_color,
                            ),
                            width: 145.0,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            CoursePage(group[index].id)));
                                print(index);
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset('assets/images/student.jpg',
                                      width: 130, height: 100),
                                  Text(
                                    group[index].course_name,
                                    style: TextStyle(
                                        color: white,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w900),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 25),
                  // Home
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Featured lists',
                          style: TextStyle(
                              color: basecolor,
                              fontSize: 25,
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: 2.5),
                      Text('You can see all the new posts here',
                          style:
                              TextStyle(color: Colors.black54, fontSize: 15)),
                    ],
                  ),
                  SizedBox(height: 15),
                  //  alert
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: basecolor3,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 20,
                                child:
                                    SvgPicture.asset('assets/images/aast.svg'),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(currUser!.fname,
                                        style: TextStyle(
                                            color: white, fontSize: 15.0)),
                                    Text('2 hr ',
                                        style: TextStyle(
                                            color: white, fontSize: 15.0)),
                                  ],
                                ),
                              ),
                              Spacer(),
                              Icon(
                                Icons.volume_up_rounded,
                                color: white,
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          Text(
                            'Dear Students,                                                                                                            Thursday lectures are cancelled due to public holiday. All assignments will be due Sunday 17th',
                            style: TextStyle(color: white, fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Divider(color: Colors.grey, thickness: 2),
                  SizedBox(height: 15),
                  // post
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          color: Color.fromARGB(240, 236, 239, 236)),
                      child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(children: [
                            Row(children: [
                              CircleAvatar(
                                radius: 20,
                                child:
                                    SvgPicture.asset('assets/images/aast.svg'),
                              ),
                              Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(currUser!.fname + currUser!.lname,
                                            style: TextStyle(
                                                color: black, fontSize: 15.0)),
                                        Row(children: [
                                          Text('2 hr ',
                                              style: TextStyle(
                                                  color: black,
                                                  fontSize: 15.0)),
                                          Icon(Icons.people, color: basecolor)
                                        ])
                                      ]))
                            ]),
                            SizedBox(height: 15),
                            Text(
                              'Dear Students,                                                                                                            Thursday lectures are cancelled due to public holiday. All assignments will be due Sunday 17th',
                              style: TextStyle(color: black, fontSize: 10),
                            ),
                            SizedBox(height: 15),
                            CupertinoTextField(
                              padding: EdgeInsets.all(15),
                              placeholder: 'Type a comment here..',
                            )
                          ])))
                ]))
      ]),
      //bottom navigation bar on scaffold
    //  bottomNavigationBar: const NavBar(),
    );
    return scaffold;
  }
}
//============================================================================

//===========================================================================
