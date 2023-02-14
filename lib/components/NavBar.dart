import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tutor/components/comp.dart';
import 'package:tutor/pages/Classwork.dart';
import 'package:tutor/pages/Login.dart';
import 'package:tutor/pages/Messages.dart';
import 'package:tutor/pages/Course.dart';
import 'package:tutor/pages/Home.dart';
import 'package:tutor/pages/Profile.dart';
import 'package:tutor/pages/Schedule.dart';

class NavBar extends StatelessWidget {
  const NavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: basecolor,
      shape: CircularNotchedRectangle(), //shape of notch
      notchMargin: 8, //notche margin between floating button and bottom appbar
      child: Row(
        //children inside bottom appbar
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
              tooltip: 'Home',
              icon: Icon(Icons.home, color: basecolor3),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              }),
          IconButton(
              tooltip: 'Message',
              icon: Icon(Icons.chat_outlined, color: Colors.white38),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MessagesPage()),
                );
              }),
          Container(height: 60),
          IconButton(
              tooltip: 'Schedule',
              icon: Icon(Icons.date_range_rounded, color: basecolor3),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const SchedulePage()),
                );
              }),
          IconButton(
              tooltip: 'Task',
              icon: Icon(Icons.menu, color: Colors.white38),
              onPressed: () {
                // Navigator.pushReplacement(
                //   context,
                //   MaterialPageRoute(builder: (context) => const ClassworkPage()),
                // );
              }),
        ],
      ),
    );
  }
}







// class BottomNavBar extends StatelessWidget {
//   BottomNavBar({super.key});
//   int currentIndex = 0;

//   final Screen = [
//     const HomePage(),
//     const ClassworkPage(),
//     const SchedulePage(),
//     const MessagesPage(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         backgroundColor: basecolor,
//         selectedItemColor: white,
//         unselectedItemColor: Colors.white70,
//         iconSize: 35,
//         //selectedFontSize: 12,
//         //unselectedFontSize: 5,
//         //showUnselectedLabels: false,
//         currentIndex: currentIndex,
//         // onTap: (index) => setState(() => currentIndex = index),
//         items: [
//           //News Feed
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home_filled),
//             label: 'Home',
//           ),
//           // ClassWork
//           BottomNavigationBarItem(
//             icon: Icon(Icons.class_outlined),
//             label: 'Classwork',
//           ),
//           // Schedule
//           BottomNavigationBarItem(
//             icon: Icon(Icons.calendar_today),
//             label: 'Schedule',
//           ),
//           //Messages
//           BottomNavigationBarItem(
//             icon: Icon(Icons.message_outlined),
//             label: 'Messages',
//           ),
//         ]);

////////////////////////////////////////////

    // Container(
    //   height: 80,
    //   decoration: BoxDecoration(
    //     color: basecolor,
    //     shape : BoxShape.rectangle,
    //     borderRadius: BorderRadius.only(
    //       topLeft: Radius.circular(30),
    //       topRight: Radius.circular(30),
    //     ),
    //   ),
    //   child: Padding(
    //     padding: const EdgeInsets.symmetric(horizontal: 20.0),
    //     child: Row(
    //       mainAxisSize: MainAxisSize.max,
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: [
    //         Opacity(
    //           opacity: 0.5,
    //           child: SvgPicture.asset('assets/images/aast.svg'),
    //         ),
    //         Opacity(
    //           opacity: 0.5,
    //           child: SvgPicture.asset('assets/images/aast.svg'),
    //         ),
    //         Opacity(
    //           opacity: 0.5,
    //           child: SvgPicture.asset('assets/images/aast.svg'),
    //         ),
    //         Opacity(
    //           opacity: 0.5,
    //           child: SvgPicture.asset('assets/images/aast.svg'),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  //}
//}
