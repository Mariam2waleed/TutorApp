import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tutor/components/PostsList.dart';
import 'package:tutor/components/comp.dart';
import 'package:tutor/pages/Classwork.dart';
import 'package:tutor/pages/Messages.dart';
import 'package:tutor/pages/NewsFeed.dart';
import 'package:tutor/pages/Notification.dart';
import 'package:tutor/pages/Profile.dart';
import 'package:tutor/service/store.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});
  @override
  State<StatefulWidget> createState() => SchedulePageState();
}

class SchedulePageState extends State<SchedulePage> {
  SchedulePageState({Key? key});

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
  int Day_type = 0;
  //============================================================================
  Widget Day_selector() {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: CupertinoSegmentedControl(
            padding: padding(0, 10),
            selectedColor: white,
            borderColor: basecolor,
            pressedColor: white,
            unselectedColor: basecolor,
            groupValue: Day_type,
            onValueChanged: (int newIndex) {
              setState(() {
                Day_type = newIndex;
              });
            },
            children: [
              'Sunday',
              'Monday',
              'Tuesday',
              'Wednesday',
              'Thursday',
              'Satrday'
            ].asMap().map((index, value) {
              return MapEntry(
                  index,
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text(value,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                  ]));
            })));
  }

  //============================================================================
  Widget posts() {
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
              // title
              Text(
                "Your Schedule",
                style: TextStyle(
                    color: basecolor,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold),
              ),
              // subtitle
              Text(
                "Stay up to date with your class times.",
                style: TextStyle(color: Colors.black87, fontSize: 14.0),
              ),
            ]),
        actions: [
          IconButton(
              padding: EdgeInsets.only(right: 40),
              icon: Icon(
                Icons.notifications,
                color: basecolor,
                size: 35,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NotificationPage()),
                );
              })
        ],
      ),
      // News Feed
      body: ListView(children: [
        Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(color: basecolor, child: Day_selector()),
              SizedBox(height: 25),
            ])
      ]),

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
                icon: Icon(Icons.calendar_today, color: white),
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
  // List Days = [
  //   'Sunday',
  //   'Monday',
  //   'Tuesday',
  //   'Wednesday',
  //   'Thursday',
  //   'Satrday'
  // ];

  // Container(
  //                   color: basecolor,
  //                   height: 50.0,
  //                   child: GestureDetector(
  //                       onTap: () {},
  //                       child: ListView.builder(
  //                           // This next line does the trick.
  //                           scrollDirection: Axis.horizontal,
  //                           itemCount: 6,
  //                           itemBuilder: (BuildContext context, int index) {
  //                             return Container(
  //                                 alignment: Alignment.center,
  //                                 margin: EdgeInsets.all(10),
  //                                 // padding: EdgeInsets.symmetric(horizontal: 5),
  //                                 decoration: BoxDecoration(
  //                                     borderRadius:
  //                                         BorderRadius.all(Radius.circular(50)),
  //                                     color: white),
  //                                 child: TextButton(
  //                                   onPressed: () {
  //                                     posts();
  //                                   },
  //                                   child: Text(
  //                                     Days[index],
  //                                     style: TextStyle(color: basecolor),
  //                                   ),
  //                                 ));
  //                           })))

//===========================================================================

// enum Sky { midnight, viridian, cerulean }

// Map<Sky, Color> skyColors = <Sky, Color>{
//   Sky.midnight: const Color(0xff191970),
//   Sky.viridian: const Color(0xff40826d),
//   Sky.cerulean: const Color(0xff007ba7),
// };

// void main() => runApp(const SegmentedControlApp());

// class SegmentedControlApp extends StatelessWidget {
//   const SegmentedControlApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const CupertinoApp(
//       theme: CupertinoThemeData(brightness: Brightness.light),
//       home: SegmentedControlExample(),
//     );
//   }
// }

// class SegmentedControlExample extends StatefulWidget {
//   const SegmentedControlExample({super.key});

//   @override
//   State<SegmentedControlExample> createState() =>
//       _SegmentedControlExampleState();
// }

// class _SegmentedControlExampleState extends State<SegmentedControlExample> {
//   Sky _selectedSegment = Sky.midnight;

//   @override
//   Widget build(BuildContext context) {
//     return CupertinoPageScaffold(
//       backgroundColor: skyColors[_selectedSegment],
//       navigationBar: CupertinoNavigationBar(
//         // This Cupertino segmented control has the enum "Sky" as the type.
//         middle: CupertinoSegmentedControl<Sky>(
//           selectedColor: skyColors[_selectedSegment],
//           // Provide horizontal padding around the children.
//           padding: const EdgeInsets.symmetric(horizontal: 12),
//           // This represents a currently selected segmented control.
//           groupValue: _selectedSegment,
//           // Callback that sets the selected segmented control.
//           onValueChanged: (Sky value) {
//             setState(() {
//               _selectedSegment = value;
//             });
//           },
//           children: const <Sky, Widget>{
//             Sky.midnight: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 20),
//               child: Text('Midnight'),
//             ),
//             Sky.viridian: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 20),
//               child: Text('Viridian'),
//             ),
//             Sky.cerulean: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 20),
//               child: Text('Cerulean'),
//             ),
//           },
//         ),
//       ),
//       child: Center(
//         child: Text(
//           'Selected Segment: ${_selectedSegment.name}',
//           style: const TextStyle(color: CupertinoColors.white),
//         ),
//       ),
//     );
//   }
// }

//===========================================================================
 