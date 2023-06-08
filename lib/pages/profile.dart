import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tutor/components/comp.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:tutor/components/NavBar.dart';
// import 'package:tutor/components/courseList.dart';
// import 'package:tutor/pages/Notification.dart';
// import 'package:tutor/service/store.dart';

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
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.person),
      //   backgroundColor: basecolor3,
      //   onPressed: () {},
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        toolbarHeight: 110.0,
        elevation: 0,
        backgroundColor: white,
        // automaticallyImplyLeading: false,
        // leading: IconButton(
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        //   icon: Icon(
        //     Icons.arrow_back_ios,
        //     color: black,
        //   ),
        // ),
        iconTheme: IconThemeData(color: black),
        title: Center(
            child: Text(
          "Profile",
          style: TextStyle(color: black, fontWeight: FontWeight.bold),
        )),
        actions: [
          IconButton(
              padding: EdgeInsets.only(right: 40),
              icon: Icon(
                Icons.edit,
                color: basecolor,
                // size: 35,
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
      // drawer: SideMenu(),
      //============================================================================
      // body:

      //  bottomNavigationBar: const NavBar(),
    );
  }
}
//============================================================================

//===========================================================================