import 'package:flutter/material.dart';
import 'package:tutor/components/comp.dart';
import 'package:tutor/pages/Login.dart';
import 'package:tutor/pages/settings.dart';

import '../pages/contactus.dart';
import '../service/store.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(padding: EdgeInsets.zero, children: <Widget>[
      // Header
      UserAccountsDrawerHeader(
        accountName:
            Text(currUser!.fname, style: const TextStyle(fontSize: 20)),
        accountEmail:
            Text(currUser!.email, style: const TextStyle(fontSize: 15)),
        currentAccountPicture: CircleAvatar(
            child: ClipOval(
                child: Image.asset(currUser!.profileImage,
                    fit: BoxFit.cover, width: 90, height: 90))),
        decoration: BoxDecoration(
          color: basecolor,
          image: const DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(
                  'https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg')),
        ),
      ),
      //   Body of side Menu
      Column(children: [
        ListTile(
            leading: Icon(Icons.favorite, color: basecolor3),
            title: const Text("Favorites"),
            trailing: ClipOval(
              child: Container(
                  color: basecolor3,
                  width: 20,
                  height: 20,
                  child: Center(
                      child: Text('8',
                          style: TextStyle(color: black, fontSize: 12)))),
            ),
            onTap: () => {
                  // change app state...
                  Navigator.pop(context) // close the drawer
                }),
        ListTile(
            leading: Icon(Icons.phone_iphone_rounded, color: basecolor3),
            title: const Text('Contact Us'),
            onTap: () => {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ContactUsScreen(),
                  ))
                }
            // Navigator.push(
            //                           context,
            //                           MaterialPageRoute(
            //                               builder: (context) =>
            //                                    ContactUsScreen()))},
            ),
        ListTile(
          leading: Icon(Icons.info, color: basecolor3),
          title: const Text('About'),
          onTap: () => {Navigator.pop(context)},
        ),
        ListTile(
            leading: Icon(Icons.settings, color: basecolor3),
            title: const Text('Settings'),
            onTap: () => { Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SettingsPage(),
                  ))
                }),
        const Divider(),
        ListTile(
            title: const Text('LogOut'),
            leading: Icon(Icons.exit_to_app, color: basecolor3),
            onTap: () => {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  )
                }),
      ])
    ]));
  }
}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
