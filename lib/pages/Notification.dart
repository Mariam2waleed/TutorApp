import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tutor/components/comp.dart';
import 'package:tutor/components/PostsList.dart';
import 'package:tutor/pages/Classwork.dart';
import 'package:tutor/pages/Messages.dart';
import 'package:tutor/pages/NewsFeed.dart';
import 'package:tutor/pages/Profile.dart';
import 'package:tutor/pages/Schedule.dart';
import 'package:tutor/service/store.dart';

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
  Widget Notification() {
    return ListView.builder(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemCount: group.length,
      itemBuilder: (context, index) => PostsList(
        group: group[index],
        onPress: () {},
      ),
    );
  }
  //============================================================================

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
                "Notifications",
                style: TextStyle(
                    color: basecolor,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold),
              ),
              Opacity(
                opacity: 0.5,
                child: Text('Lorem ipsum ipsum lorem',
                    style: TextStyle(color: black, fontSize: 14.0)),
              )
            ]),
      ),
      // Notifications
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: ListView(children: [
          Notification(),
        ]),
      ),
      //bottom navigation bar on scaffold
      bottomNavigationBar: BottomAppBar(
        color: basecolor,
        shape: CircularNotchedRectangle(), //shape of notch
        notchMargin:
            8, //notche margin between floating button and bottom appbar
        child: Row(
          //children inside bottom appbar
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
                tooltip: 'News Feed',
                icon: Icon(Icons.post_add, color: Colors.white38),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NewsFeedPage()),
                  );
                }),
            IconButton(
                tooltip: 'ClassWork',
                icon: Icon(Icons.class_, color: Colors.white38),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ClassworkPage()),
                  );
                }),
            Container(height: 60),
            IconButton(
                tooltip: 'Schedule',
                icon: Icon(Icons.calendar_today, color: Colors.white38),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SchedulePage()),
                  );
                }),
            IconButton(
                tooltip: 'Messages',
                icon: Icon(Icons.message_outlined, color: Colors.white38),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MessagesPage()),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
//============================================================================

//===========================================================================
