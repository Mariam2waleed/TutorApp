import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tutor/components/comp.dart';
import 'package:tutor/pages/Classwork.dart';
import 'package:tutor/pages/Login.dart';
import 'package:tutor/pages/Messages.dart';
import 'package:tutor/pages/Course.dart';
import 'package:tutor/pages/NewsFeed.dart';
import 'package:tutor/pages/Profile.dart';
import 'package:tutor/pages/Schedule.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({super.key});
  int currentIndex = 0;

  final Screen = [
    const NewsFeedPage(),
    const ClassworkPage(),
    const SchedulePage(),
    const MessagesPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: basecolor,
        selectedItemColor: white,
        unselectedItemColor: Colors.white70,
        iconSize: 35,
        //selectedFontSize: 12,
        //unselectedFontSize: 5,
        //showUnselectedLabels: false,
        currentIndex: currentIndex,
        // onTap: (index) => setState(() => currentIndex = index),
        items: [
          //News Feed
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            label: 'News Feed',
          ),
          // ClassWork
          BottomNavigationBarItem(
            icon: Icon(Icons.class_outlined),
            label: 'Classwork',
          ),
          // Schedule
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Schedule',
          ),
          //Messages
          BottomNavigationBarItem(
            icon: Icon(Icons.message_outlined),
            label: 'Messages',
          ),
        ]);

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
  }
}
