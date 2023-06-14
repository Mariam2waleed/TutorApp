// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tutor/components/comp.dart';
import 'package:tutor/service/models.dart';
import 'package:tutor/service/store.dart';

class PostsList extends StatelessWidget {
  final Group group;
  void Function()? onPress;
  PostsList({
    Key? key,
    onPress,
    required this.group,
  }) : super(key: key);

  TextEditingController Comment = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Color.fromARGB(240, 236, 239, 236)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(children: [
                        CircleAvatar(
                            radius: 30,
                            child: SvgPicture.asset('Assets/images/log.svg')),
                        Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(currUser!.fname + currUser!.lname,
                                      style: TextStyle(
                                          color: black, fontSize: 15.0)),
                                  Row(children: [
                                    Text('2 hr ',
                                        style: TextStyle(
                                            color: black, fontSize: 15.0)),
                                    Icon(Icons.people, color: basecolor)
                                  ])
                                ]))
                      ]),
                      const SizedBox(height: 15),
                      Text(
                          'Dear Students,                                                                                                            Thursday lectures are cancelled due to public holiday. All assignments will be due Sunday 17th',
                          style: TextStyle(color: black, fontSize: 10)),
                      const SizedBox(height: 15),
                      InputField(Comment, "Type a comment here..",
                          numbers: false),
                    ],
                  ),
                ),
              ),
              // send comment 
              Positioned(
                bottom: 16,
                right: 15,
                child: SizedBox(
                  height: 35.0,
                  child: FloatingActionButton(
                    shape:
                        const BeveledRectangleBorder(borderRadius: BorderRadius.zero),
                    backgroundColor: const Color.fromARGB(240, 236, 239, 236),
                    child: Icon(
                      Icons.send,
                      color: basecolor,
                    ),
                    onPressed: () => {},
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
//============================================================================

   // Container(
          //   padding: EdgeInsets.symmetric(vertical: 16),
          //   child: Row(
          //     children: [
          //       Container(
          //         width: 60,
          //         child: SvgPicture.asset('Assets/images/log.svg'),
          //       ),
          //       SizedBox(
          //         width: 20,
          //       ),
          //       Text(
          //         group.course_name,
          //         style: TextStyle(
          //             fontFamily: 'sen', fontSize: 20, fontWeight: FontWeight.w400),
          //       ),
          //       Spacer(),
          //       IconButton(
          //         icon: Icon(
          //           Icons.send,
          //           color: basecolor,
          //         ),
          //         onPressed: () {},
          //       ),
          //     ],
          //   ),
          // ),