// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tutor/components/comp.dart';
// import 'package:tutor/components/messagesList.dart';
import 'package:tutor/pages/Chatting/Chat.dart';
import 'package:tutor/pages/Profile.dart';
import 'package:tutor/service/store.dart';

import '../../components/AppDrawer.dart';

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

       body:
      
      //  Container(
      //   child: Column(
      //     children: [
      //       Expanded(flex:9 ,child: Container()),
      //       Expanded(child: Container(
      //         color: Colors.amber,
      //       )),
      //     ],
      //   ),
      // )
      
      
      ////////////////////////////////////////////////////////////////////      
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(children: [  IconButton(
                highlightColor: Colors.deepPurple[300],
                iconSize: 48.0,
                icon:
                    // ImageIcon(Image.asset('Assets/images/Me.jpeq').image)
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
                              builder: (context) => const ChatPage()))
                    })]),
      ),
      
      ////////////////////////////////////////////////////////////////////
      
      //bottom navigation bar on scaffold
      // bottomNavigationBar: NavBar(),
    );
  }
}
//============================================================================

//===========================================================================
