// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tutor/components/comp.dart';
// import 'package:flutter_svg/svg.dart';
import 'package:tutor/components/courseList.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 110.0,
        elevation: 0,
        backgroundColor: white,
        iconTheme: IconThemeData(color: black),
        title: Center(
            child: Text(
          "Profile",
          style: TextStyle(color: black, fontWeight: FontWeight.bold),
        )),
        actions: [
          IconButton(
              padding: const EdgeInsets.only(right: 40),
              icon: Icon(
                Icons.edit,
                color: basecolor,
              ),
              onPressed: () {
                // Navigator.pushReplacement(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) => const NotificationPage()),
                // );
              }),
        ],
      ),
      //============================================================================
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: ListView(
          children: [
//===================   Profile Info  =========================================================
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // profile image
                    CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 50,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset(currUser!.profileImage,
                                fit: BoxFit.cover))),
                    // profile labels
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Container(
                        height: 150,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: const Column(
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
                      padding: const EdgeInsets.only(left: 8),
                      child: Container(
                        height: 150,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(currUser!.fname + currUser!.lname,
                                style: const TextStyle(
                                    fontSize: 13, color: Colors.black38)),
                            Text(currUser!.fname,
                                style: const TextStyle(
                                    fontSize: 13, color: Colors.black38)),
                            Text(currUser!.fname.toString(),
                                style: const TextStyle(
                                    fontSize: 13, color: Colors.black38)),
                            Text(currUser!.fname.toString(),
                                style: const TextStyle(
                                    fontSize: 13, color: Colors.black38)),
                            Text(currUser!.fname,
                                style: const TextStyle(
                                    fontSize: 13, color: Colors.black38)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

//===================   subtitle   =========================================================
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                child: const Column(
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
              physics: const ScrollPhysics(),
              itemCount: group.length,
              itemBuilder: (context, index) => CourseList(
                group: group[index],
                onPress: () {},
              ),
            ),
          ],
        ),
      ),
      // drawer: SideMenu(),
      //============================================================================
    );
  }
}

//===========================================================================


//============================================================================

//============================================================================

//===========================================================================