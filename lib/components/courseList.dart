import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tutor/components/comp.dart';
import 'package:tutor/pages/Course.dart';
import 'package:tutor/service/models.dart';

class CourseList extends StatelessWidget {
  final Group group;
  bool _customTileExpanded = false;

  void Function()? onPress;
  CourseList({
    Key? key,
    onPress,
    required this.group,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Column(
        children: [
          SizedBox(height: 5),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: group.course_color),
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Column(
              children: [
                ExpansionTile(
                  // collapsedBackgroundColor: group.course_color,
                  title: Text(group.course_name),
                  children: <Widget>[
                    ListTile(
                        title: Column(
                      children: [
                        // View Course
                        baseButton(
                            idle_txt: "View Course",
                            action: () async {
                              debugPrint("Loding");
                              await Future.delayed(Duration(seconds: 0));
                              // int index= group.id as int;
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                           CoursePage(group.id)));
                            }),
                        SizedBox(height: 5),
                        //  Course Outline
                        ExpansionTile(
                          title: Text('Course Outline'),
                          children: <Widget>[
                            ListTile(
                                title: Text(
                                    'data data data data data data data data data data ')),
                          ],
                        ),
                        SizedBox(height: 5),
                        // Learning Objectives
                        ExpansionTile(
                          title: Text('Learning Objectives'),
                          children: <Widget>[
                            ListTile(
                              title: Text(
                                  'Learning Objectives Learning Objectives Learning Objectives Learning Objectives '),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        // Grading
                        ExpansionTile(
                          title: Text('Grading'),
                          children: <Widget>[
                            ListTile(
                              title: Text('Grading Grading Grading Grading'),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        // Attendance
                        ExpansionTile(
                          title: Text('Attendance'),
                          children: <Widget>[
                            ListTile(
                              title: Text(
                                  'Attendance Attendance Attendance Attendance'),
                            ),
                          ],
                        ),
                      ],
                    )),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//  Container(
//               width: 60,
//               child: SvgPicture.asset('Assets/images/log.svg'),
//             ),
//             SizedBox(
//               width: 20,
//             ),
//             Text(
//               group.course_name,
//               style: TextStyle(
//                   fontFamily: 'sen', fontSize: 20, fontWeight: FontWeight.w400),
//             ),
//             Spacer(),
//             Icon(Icons.keyboard_arrow_down)
