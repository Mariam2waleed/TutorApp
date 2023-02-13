import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tutor/components/comp.dart';
import 'package:tutor/components/messagesList.dart';
import 'package:tutor/pages/Classwork.dart';
import 'package:tutor/pages/NewsFeed.dart';
import 'package:tutor/pages/Profile.dart';
import 'package:tutor/pages/Schedule.dart';
import 'package:tutor/service/store.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({super.key});
  @override
  State<StatefulWidget> createState() => MessagesPageState();
}

class MessagesPageState extends State<MessagesPage> {
  MessagesPageState({Key? key});
  late TextEditingController textController;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController(text: '');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    textController.dispose();

    super.dispose();
  }

  //============================================================================

  //============================================================================

  //============================================================================

  //============================================================================
  Widget messages() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: ListView.builder(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount: group.length,
        itemBuilder: (context, index) => MessagesList(
          group: group[index],
          onPress: () {},
        ),
      ),
    );
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
        toolbarHeight: 200.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50))),
        elevation: 0,
        backgroundColor: basecolor,
        title: Column(
            verticalDirection: VerticalDirection.down,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Messages",
                style: TextStyle(
                    color: white, fontSize: 25.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),
              CupertinoSearchTextField(
                backgroundColor: white,
                padding: EdgeInsets.all(15),
                borderRadius: BorderRadius.circular(50),
                controller: textController,
                placeholder: 'Search by name',
              ),
            ]),
      ),
      // Messages
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: ListView(children: [messages()]),
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
                icon: Icon(Icons.message_outlined, color: white),
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
