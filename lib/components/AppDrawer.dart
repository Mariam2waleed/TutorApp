import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tutor/components/comp.dart';
import 'package:tutor/pages/Classwork.dart';
import 'package:tutor/pages/Inbox.dart';
import 'package:tutor/pages/Home.dart';
import 'package:tutor/pages/Notification.dart';
import 'package:tutor/pages/Profile.dart';
import 'package:tutor/pages/Schedule.dart';

import '../service/store.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(children: <Widget>[
      DrawerHeader(
          child: Image.asset(currUser!.profileImage, fit: BoxFit.fitWidth)),
      const ListTile(
        title: Text("Item 1"),
      ),
      const ListTile(
        title: Text("Item 2"),
      )
    ]));
  }
}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//  Drawer AppDrawer() {
//     return Drawer(
//           child: ListView(padding: EdgeInsets.zero, children: const <Widget>[
//         DrawerHeader(
//             decoration: BoxDecoration(color: Colors.amber),
//             child: Text(' Welcome ',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 24,
//                 ))),
//         ListTile(
//           leading: Icon(Icons.message),
//           title: Text('Messages'),
//         ),
//         ListTile(
//           // leading: Icon(Icons.account_circle),
//           title: Text('Profile'),
//         ),
//         ListTile(
//           leading: Icon(Icons.settings),
//           title: Text('Settings'),
//         ),
//         ListTile(
//           leading: const Icon(Icons.change_history),
//           title: const Text('Change history'),
//           // onTap: () => {
//           //   // change app state...
//           //   Navigator.pop(context); // close the drawer
//           // };
//         )
//       ]));