// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tutor/components/comp.dart';
import 'package:tutor/service/models.dart';

class LectureList extends StatelessWidget {
  final Group group;
  void Function()? onPress;
  LectureList({
    Key? key,
    onPress,
    required this.group,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          children: [
            SizedBox(
              width: 60,
              child: SvgPicture.asset('Assets/images/log.svg'),
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              group.course_name,
              style: const TextStyle(
                  fontFamily: 'sen', fontSize: 20, fontWeight: FontWeight.w400),
            ),
            const Spacer(),
            IconButton(
              icon: Icon(
                Icons.chat_rounded,
                color: basecolor,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
