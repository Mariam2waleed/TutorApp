import 'package:flutter/material.dart';
import 'package:tutor/components/comp.dart';

import '../service/store.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(padding: EdgeInsets.zero, children: <Widget>[
      DrawerHeader(
          child: Column(children: [
        CircleAvatar(
            radius: 50,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child:
                    Image.asset(currUser!.profileImage, fit: BoxFit.fitWidth))),
        // Image.asset(currUser!.profileImage, fit: BoxFit.fitWidth),
        Text('Welcome ${currUser!.fname}', style: TextStyle(color: black))
      ])),
      Column(children: [
        const ListTile(leading: Icon(Icons.message), title: Text("Item 1")),
        const ListTile(
            leading: Icon(Icons.account_circle), title: Text("Item 2")),
        const ListTile(leading: Icon(Icons.settings), title: Text('Settings')),
        ListTile(
            leading: const Icon(Icons.change_history),
            title: const Text('Change history'),
            onTap: () => {
                  // change app state...
                  Navigator.pop(context) // close the drawer
                })
      ])
    ]));
  }
}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
