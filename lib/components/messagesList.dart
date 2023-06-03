import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tutor/components/comp.dart';
import 'package:tutor/service/models.dart';

import '../service/store.dart';

class MessageItem extends StatelessWidget {
  const MessageItem({super.key, required this.sentByMe});
  final bool sentByMe;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: sentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        margin: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: sentByMe ? basecolor : Colors.grey[300],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            SizedBox(width: 5),
            Text(
              "Hello",
              style:
                  TextStyle(color: sentByMe ? white : basecolor, fontSize: 18),
            ),
            Text(
              "12:44 PM",
              style: TextStyle(
                  color: (sentByMe ? Colors.grey[300] : Colors.blueGrey)?.withOpacity(0.7),
                  fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}

///////////////////////////////////////////////////////////////

class ChatList extends StatelessWidget {
  const ChatList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, index) {
          if (messages[index]['isMe'] == true) {
            return MyMessageCard(
                message: messages[index]['text'].toString(),
                date: messages[index]['time'].toString());
          }
          return SenderMessageCard(
              message: messages[index]['text'].toString(),
              date: messages[index]['time'].toString());
        });
  }
}

class SenderMessageCard extends StatelessWidget {
  const SenderMessageCard({Key? key, required this.message, required this.date})
      : super(key: key);
  final String message;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child: ConstrainedBox(
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width - 45),
            child: Card(
                elevation: 1,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                color: Colors.grey[300],
                margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Stack(children: [
                  Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 30, top: 5, bottom: 20),
                      child: Text(message,
                          style: TextStyle(color: basecolor, fontSize: 16))),
                  Positioned(
                      bottom: 2,
                      right: 10,
                      child: Text(date,
                          style:
                              TextStyle(fontSize: 13, color: Colors.grey[600])))
                ]))));
  }
}

class MyMessageCard extends StatelessWidget {
  final String message;
  final String date;

  const MyMessageCard({Key? key, required this.message, required this.date})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerRight,
        child: ConstrainedBox(
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width - 45),
            child: Card(
                elevation: 1,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                color: basecolor,
                margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Stack(children: [
                  Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 30, top: 5, bottom: 20),
                      child: Text(message,
                          style: TextStyle(color: white, fontSize: 16))),
                  Positioned(
                      bottom: 4,
                      right: 10,
                      child: Row(children: [
                        Text(date,
                            style: const TextStyle(
                                fontSize: 13, color: Colors.white60)),
                        const SizedBox(width: 5),
                        const Icon(Icons.done_all,
                            size: 20, color: Colors.white60)
                      ]))
                ]))));
  }
}

class MessagesList extends StatelessWidget {
  final Group group;
  void Function()? onPress;
  MessagesList({
    Key? key,
    onPress,
    required this.group,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPress,
        child: Container(
            // decoration: BoxDecoration(color: course_color),
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Row(children: [
              Container(
                  width: 60, child: SvgPicture.asset('Assets/images/log.svg')),
              SizedBox(width: 20),
              Text(group.course_name,
                  style: TextStyle(
                      fontFamily: 'sen',
                      fontSize: 20,
                      fontWeight: FontWeight.w400)),
              Spacer(),
              IconButton(
                  icon:
                      Icon(Icons.person_pin_circle_outlined, color: basecolor),
                  onPressed: () {})
            ])));
  }
}
