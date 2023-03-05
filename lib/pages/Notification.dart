import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tutor/components/comp.dart';
import 'package:tutor/components/PostsList.dart';
import 'package:tutor/pages/Profile.dart';
import 'package:tutor/service/store.dart';

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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      
      );
  }
}
//============================================================================

//===========================================================================
