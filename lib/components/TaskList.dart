import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tutor/components/comp.dart';
import 'package:tutor/pages/Assignment.dart';
import 'package:tutor/service/models.dart';

class TaskList extends StatelessWidget {
  final Group group;
  void Function()? onPress;
  TaskList({
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
          Text(group.course_code,
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: 25, fontWeight: FontWeight.bold, color: basecolor)),
          Container(
            decoration: BoxDecoration(color: group.course_color),
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Row(
              children: [
                Container(
                  width: 60,
                  child: SvgPicture.asset('assets/images/aast.svg'),
                ),
                SizedBox(width: 20),
                Text(
                  group.course_name,
                  style: TextStyle(
                      fontFamily: 'sen',
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
                Spacer(),
                IconButton(
                  iconSize: 35,
                  icon: Icon(
                    Icons.schedule,
                    color: basecolor,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AssignmentPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
