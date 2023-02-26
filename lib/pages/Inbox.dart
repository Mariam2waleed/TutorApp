import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tutor/components/comp.dart';
import 'package:tutor/components/messagesList.dart';
import 'package:tutor/pages/Classwork.dart';
import 'package:tutor/pages/Home.dart';
import 'package:tutor/pages/Profile.dart';
import 'package:tutor/pages/Schedule.dart';
import 'package:tutor/service/store.dart';

import '../components/NavBar.dart';

class InboxPage extends StatefulWidget {
  const InboxPage({super.key});
  @override
  State<StatefulWidget> createState() => InboxPageState();
}

class InboxPageState extends State<InboxPage> {
  InboxPageState({Key? key});
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
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.menu,
            color: black,
          ),
        ),
        title: Center(
            child: Text(
          "Inbox",
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
                  child:
                      Image.asset(currUser!.profileImage, fit: BoxFit.cover)),
            ),
            onPressed: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ProfilePage()))
            },
          ),
        ],
      ),

      // AppBar(
      //   toolbarHeight: 200.0,
      //   shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.only(
      //           bottomLeft: Radius.circular(50),
      //           bottomRight: Radius.circular(50))),
      //   elevation: 0,
      //   backgroundColor: basecolor,
      //   title: Column(
      //       verticalDirection: VerticalDirection.down,
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         Text(
      //           "Messages",
      //           style: TextStyle(
      //               color: white, fontSize: 25.0, fontWeight: FontWeight.bold),
      //         ),
      //         SizedBox(height: 15),
      //         CupertinoSearchTextField(
      //           backgroundColor: white,
      //           padding: EdgeInsets.all(15),
      //           borderRadius: BorderRadius.circular(50),
      //           controller: textController,
      //           placeholder: 'Search by name',
      //         ),
      //       ]),
      // Messages
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: ListView(children: [messages()]),
      ),
      //bottom navigation bar on scaffold
      // bottomNavigationBar: NavBar(),
    );
  }
}
//============================================================================

//===========================================================================
