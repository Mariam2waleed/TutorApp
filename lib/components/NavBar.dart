import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:tutor/components/AppDrawer.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:tutor/components/comp.dart';
// import 'package:tutor/pages/Classwork.dart';
import 'package:tutor/pages/Chatting/Inbox.dart';
import 'package:tutor/pages/Home.dart';
import 'package:tutor/pages/Notification.dart';
// import 'package:tutor/pages/Profile.dart';
import 'package:tutor/pages/Schedule.dart';
import 'package:tutor/pages/profile.dart';
import 'package:tutor/service/store.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});
  @override
  State<StatefulWidget> createState() => NavBarState();
}

class NavBarState extends State<NavBar> {
  NavBarState({Key? key});
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  int index = 0;
  List<Widget> screens = [
    const HomePage(),
    const InboxPage(),
    const SchedulePage(),
    const NotificationPage(),
  ];

  List<String> titles = [
    'Home',
    "Ibox",
    "Schedule",
    "Notification",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        extendBody: true,
        appBar: AppBar(
            toolbarHeight: 110.0,
            elevation: 0,
            backgroundColor: white,
            iconTheme: IconThemeData(color: black),
            title: Center(
                child: Text(
              titles[index],
              style: TextStyle(color: black, fontWeight: FontWeight.bold),
            )),
            actions: [
              IconButton(
                  highlightColor: Colors.deepPurple[300],
                  iconSize: 48.0,
                  icon:
                      // ImageIcon(Image.asset('Assets/images/Me.jpeq').image)
                      CircleAvatar(
                          radius: 50,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.asset(currUser!.profileImage,
                                  fit: BoxFit.cover))),
                  onPressed: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ProfilePage()))
                      })
            ]),
        drawer: const AppDrawer(),
        body: screens[index],
        ///////////////////////
        bottomNavigationBar: Theme(
          data: Theme.of(context)
              .copyWith(iconTheme: IconThemeData(color: white)),
          child: CurvedNavigationBar(
            key: navigationKey,
            color: basecolor,
            buttonBackgroundColor: basecolor3,
            backgroundColor: Colors.transparent,
            animationCurve: Curves.easeInOut,
            animationDuration: const Duration(milliseconds: 300),
            index: index,
            items: const <Widget>[
              Icon(Icons.home, size: 30),
              Icon(Icons.chat, size: 30),
              Icon(Icons.calendar_today_rounded, size: 30),
              Icon(Icons.notifications, size: 30),
            ],
            //Handle button tap
            onTap: (index) => setState(() => this.index = index),
          ),
        ),
      ),
    );
  }
}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//   @override
//   Widget build(BuildContext context) {
//     return BottomAppBar(
//       color: basecolor,
//       shape: CircularNotchedRectangle(), //shape of notch
//       notchMargin: 8, //notche margin between floating button and bottom appbar
//       child: Row(
//         //children inside bottom appbar
//         mainAxisSize: MainAxisSize.max,
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: <Widget>[
//           IconButton(
//               tooltip: 'Home',
//               icon: Icon(Icons.home, color: basecolor3),
//               onPressed: () {
//                 Navigator.pushReplacement(
//                   context,
//                   MaterialPageRoute(builder: (context) => const HomePage()),
//                 );
//               }),
//           IconButton(
//               tooltip: 'Message',
//               icon: Icon(Icons.chat_outlined, color: Colors.white38),
//               onPressed: () {
//                 Navigator.pushReplacement(
//                   context,
//                   MaterialPageRoute(builder: (context) => const MessagesPage()),
//                 );
//               }),
//           Container(height: 60),
//           IconButton(
//               tooltip: 'Schedule',
//               icon: Icon(Icons.date_range_rounded, color: basecolor3),
//               onPressed: () {
//                 Navigator.pushReplacement(
//                   context,
//                   MaterialPageRoute(builder: (context) => const SchedulePage()),
//                 );
//               }),
//           IconButton(
//               tooltip: 'Task',
//               icon: Icon(Icons.menu, color: Colors.white38),
//               onPressed: () {
//                 // Navigator.pushReplacement(
//                 //   context,
//                 //   MaterialPageRoute(builder: (context) => const ClassworkPage()),
//                 // );
//               }),
//         ],
//       ),
//     );
//   }
// }
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

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
//           child: SvgPicture.asset('Assets/images/log.svg'),
//         ),
//         Opacity(
//           opacity: 0.5,
//           child: SvgPicture.asset('Assets/images/log.svg'),
//         ),
//         Opacity(
//           opacity: 0.5,
//           child: SvgPicture.asset('Assets/images/log.svg'),
//         ),
//         Opacity(
//           opacity: 0.5,
//           child: SvgPicture.asset('Assets/images/log.svg'),
//         ),
//       ],
//     ),
//   ),
// );
//}
//}
