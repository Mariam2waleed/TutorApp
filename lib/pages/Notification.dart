import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tutor/components/comp.dart';
import 'package:tutor/components/PostsList.dart';
import 'package:tutor/pages/Profile.dart';
import 'package:tutor/service/store.dart';

import '../components/AppDrawer.dart';
import '../components/NavBar.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});
  @override
  State<StatefulWidget> createState() => NotificationPageState();
}

class NotificationPageState extends State<NotificationPage> {
  NotificationPageState({Key? key});
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

  //============================================================================
  //============================================================================

  //============================================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.person),
      //   backgroundColor: basecolor,
      //   onPressed: () {
      //     Navigator.pushReplacement(context,
      //         MaterialPageRoute(builder: (context) => const ProfilePage()));
      //   },
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
          toolbarHeight: 110.0,
          elevation: 0,
          backgroundColor: white,
          // automaticallyImplyLeading: false,
          title: Center(
              child: Text(
            "Notifications",
            style: TextStyle(color: black, fontWeight: FontWeight.bold),
          )),
          actions: [
            IconButton(
                highlightColor: Colors.deepPurple[300],
                iconSize: 48.0,
                icon:
                    // ImageIcon(Image.asset('assets/images/Me.jpeq').image)
                    CircleAvatar(
                  radius: 50,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(currUser!.profileImage,
                          fit: BoxFit.cover)),
                ),
                onPressed: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProfilePage()))
                    })
          ]),
      drawer: AppDrawer(),
    );
  }
}
//============================================================================

//===========================================================================
