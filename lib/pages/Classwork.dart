import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tutor/components/comp.dart';
import 'package:tutor/pages/Notification.dart';
import 'package:tutor/pages/Profile.dart';
import 'package:tutor/components/TAList.dart';
import 'package:tutor/service/store.dart';

// import '../components/NavBar.dart';

class ClassworkPage extends StatefulWidget {
  const ClassworkPage({super.key});
  @override
  State<StatefulWidget> createState() => ClassworkPageState();
}

class ClassworkPageState extends State<ClassworkPage> {
  ClassworkPageState({Key? key});

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
  Widget members() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: group.length,
                itemBuilder: (context, index) => TAList(
                  group: group[index],
                  onPress: () {},
                ),
              ),
            ]));
  }

  //============================================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              Text(
                "Your Tasks",
                style: TextStyle(
                    color: black, fontSize: 25.0, fontWeight: FontWeight.bold),
              ),
              Opacity(
                opacity: 0.5,
                child: Text('Your upcoming tasks to-do',
                    style: TextStyle(color: black, fontSize: 14.0)),
              )
            ]),
        actions: [
          IconButton(
              padding: EdgeInsets.only(right: 40),
              icon: Icon(Icons.notifications, color: basecolor, size: 35),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NotificationPage()),
                );
              })
        ],
      ),
      // Messages
      body: SafeArea(
        child: ListView(children: [members()]),
      ),
      //bottom navigation bar on scaffold
      // bottomNavigationBar: NavBar(),
    );
  }
}
//============================================================================

//===========================================================================
