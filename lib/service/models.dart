// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tutor/components/comp.dart';

class Access {
  String code;
  String group;
  Access(this.code, this.group);
}

class User {
  String type = "student";
  //student, teacher, admin
  String id = "";
  String title = "";
  String gender = "";
  String fname = "";
  String lname = "";
  //---------------------------------------------------------
  String branch = "";
  String college = "";
  String dep = "";
  //---------------------------------------------------------
  List<Access> acl = [];
  //---------------------------------------------------------
  int sem = 0;
  double gpa = 0.0;
  User(
      {this.type = '',
      this.id = '',
      this.title = '',
      this.gender = '',
      this.fname = '',
      this.lname = '',
      this.branch = '',
      this.college = '',
      this.dep = '',
      this.sem = 0,
      this.gpa = 0.0});
  static User decode(Map map) {
    return User(
      type: map['type'] ?? '',
      id: map['id'] ?? '',
      fname: map['fname'] ?? '',
      lname: map['lname'] ?? '',
      branch: map['branch'] ?? '',
      college: map['college'] ?? '',
      dep: map['dep'] ?? '',
      sem: map['sem'] ?? 0,
      gpa: map['gpa'] ?? 0.0,
    );
  }

  String getName() {
    if (type == 'student') {
      return "$fname $lname";
    }
    return "$title. $fname $lname";
  }
}

// class Student extends User{
//   Student(): super(type: 'student');
// }
// class Teacher extends User{
//   Teacher(): super(type: 'teacher');
// }
//==============================================================================
class Group {
  int id = 0;
  String name = "";
  String course_code = "";
  String course_name = "";
  Color course_color = white;
  //---------------------------------------------------------
  String branch = "";
  String college = "";
  String dep = "";
  //---------------------------------------------------------
  Group({
    this.id = 0,
    this.name = '',
    this.course_code = '',
    this.course_name = '',
    this.course_color = Colors.white,
  });
  static Group decode(Map map) {
    return Group(
        id: map['id'] ?? 0,
        name: map['name'] ?? '',
        course_code: map['course_code'] ?? '',
        course_name: map['course_name'] ?? '',
        course_color: map['course_color'] ?? white);
  }
}

//==============================================================================
class Chat {
  final String name, lastMessage, image, time;
  final bool isActive;
  Chat({
    this.name = '',
    this.lastMessage = '',
    this.image = '',
    this.time = '',
    this.isActive = false,
  });
}

//==============================================================================
// class Message {
//   String get id => _id;
//   final String from;
//   final String to;
//   final DateTime timestamp;
//   final String contents;
//   String _id;

//   Message({
//     required this.from,
//     required this.to,
//     required this.timestamp,
//     required this.contents,
//   });

//   toJson() => {
//         'from': this.from,
//         'to': this.to,
//         'timestamp': this.timestamp,
//         'contents': this.contents,
//       };

//   factory Message.fromJson(Map<String, dynamic> json) {
//     var message = Message(
//         from: json['from'],
//         to: json['to'],
//         timestamp: json['timestamp'],
//         contents: json['contents']);

//     message._id = json['id'];
//     return message;
//   }
// }

//==============================================================================
// class Course{
//   String code, name, ch;
// }
//==============================================================================
//==============================================================================
