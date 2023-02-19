import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tutor/components/comp.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tutor/components/NavBar.dart';
import 'package:tutor/components/courseList.dart';
import 'package:tutor/pages/Classwork.dart';
import 'package:tutor/pages/Messages.dart';
import 'package:tutor/pages/Home.dart';
import 'package:tutor/pages/Notification.dart';
import 'package:tutor/pages/Schedule.dart';
import 'package:tutor/service/store.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  @override
  State<StatefulWidget> createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  ProfilePageState({Key? key});
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
  //============================================================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.person),
        backgroundColor: basecolor3,
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        toolbarHeight: 110.0,
        elevation: 0,
        backgroundColor: white,
        title: Text.rich(TextSpan(
            text: 'My Profile',
            style: TextStyle(
                fontFamily: 'sen',
                fontWeight: FontWeight.bold,
                color: black,
                fontSize: 25))),
        actions: [
          IconButton(
              padding: EdgeInsets.only(right: 40),
              icon: Icon(
                Icons.notifications,
                color: basecolor,
                size: 35,
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NotificationPage()),
                );
              }),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: ListView(
          children: [
            //  Profile Info
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // profile image
                    CircleAvatar(
                      radius: 50,
                      child: SvgPicture.asset('assets/images/aast.svg'),
                    ),
                    // profile labels
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Container(
                        height: 150,
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("Name:",
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.bold)),
                            Text("Depatment:",
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.bold)),
                            Text("GPA:",
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.bold)),
                            Text("Term:",
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.bold)),
                            Text("Branch:",
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.bold))
                          ],
                        ),
                      ),
                    ),
                    // My profile info
                    Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Container(
                        height: 150,
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(currUser!.fname + currUser!.lname,
                                style: TextStyle(
                                    fontSize: 13, color: Colors.black38)),
                            Text(currUser!.dep,
                                style: TextStyle(
                                    fontSize: 13, color: Colors.black38)),
                            Text(currUser!.gpa.toString(),
                                style: TextStyle(
                                    fontSize: 13, color: Colors.black38)),
                            Text(currUser!.sem.toString(),
                                style: TextStyle(
                                    fontSize: 13, color: Colors.black38)),
                            Text(currUser!.branch,
                                style: TextStyle(
                                    fontSize: 13, color: Colors.black38)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // subtitle courses
            Padding(
              padding: EdgeInsets.only(left: 5),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Courses',
                      style: TextStyle(
                          fontFamily: 'sen',
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 2.5,
                    ),
                    Text('Enrolled subjects for this term',
                        style: TextStyle(fontSize: 15, color: Colors.black38)),
                  ],
                ),
              ),
            ),
            // course list
            ListView.builder(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemCount: group.length,
              itemBuilder: (context, index) => CourseList(
                group: group[index],
                onPress: () {},
              ),
            ),
          ],
        ),
      ),
      //bottom navigation bar on scaffold
      // bottomNavigationBar: NavBar(),
    );
  }
}
//============================================================================

//===========================================================================