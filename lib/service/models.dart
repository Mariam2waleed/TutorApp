// import 'package:flutter/cupertino.dart';
// import 'dart:ffi';
// import 'dart:ui';

// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:tutor/components/comp.dart';

class Access {
  String code;
  String group;
  Access(this.code, this.group);
}

// class UserModel {
//   Role role;
//   String type = "student";
//   //student, teacher, admin
//   String id;
//   String title;
//   String gender;
//   String fname;
//   String lname;
//   String email;
//   String location;
//   int age;
//   int phoneNumber;
//   //---------------------------------------------------------
//   String branch = "";
//   String college = "";
//   String dep = "";
//   //---------------------------------------------------------
//   List<Access> acl = [];
//   //---------------------------------------------------------
//   int sem = 0;
//   double gpa = 0.0;
//   // Image profileImage = Image.asset('Assets/images/Me.jpeq');
//   String profileImage;

//   UserModel(
//       {required this.role,
//       this.type = '',
//       this.id = '',
//       this.title = '',
//       this.gender = '',
//       this.fname = '',
//       this.lname = '',
//       this.email = '',
//       this.location = '',
//       this.branch = '',
//       this.college = '',
//       this.dep = '',
//       this.sem = 0,
//       this.age = 0,
//       this.gpa = 0.0,
//       this.phoneNumber = 0,
//       this.profileImage = ''
//       // Image.asset('Assets/images/Me.jpeq'),
//       // required this.profileImage,
//       });

//   // static UserModel decode(Map map) {
//   //   return UserModel(
//   //       type: map['type'] ?? '',
//   //       id: map['id'] ?? '',
//   //       fname: map['fname'] ?? '',
//   //       lname: map['lname'] ?? '',
//   //       email: map['email'] ?? '',
//   //       branch: map['branch'] ?? '',
//   //       college: map['college'] ?? '',
//   //       dep: map['dep'] ?? '',
//   //       sem: map['sem'] ?? 0,
//   //       gpa: map['gpa'] ?? 0.0,
//   //       profileImage: 'Assets/images/log.svg',
//   //       role: null,
//   //       // const Image(image: AssetImage('Assets/images/Me.jpeg'),)
//   //       );
//   // }

//   String getName() {
//     if (type == 'student') {
//       return "$fname $lname";
//     } else if (type == 'teacher') {
//       return "$fname $lname";
//     } else if (type == 'admin') {
//       return "$fname $lname";
//     }
//     ;
//     return "$title. $fname $lname";
//   }
// }

//==============================================================================

class userSchema {
  final String id;
  final String fname;
  final String lname;
  final String email;
  final String gender;
  final Role role;
  final String password;
  final String school_system;
  final String location;
  final int age;
  final String profileImage;
  final String phone_number;
  // final Bool isAdmin;
  final String accessToken;
  userSchema({
    required this.id,
    required this.fname,
    required this.lname,
    required this.email,
    required this.gender,
    required this.role,
    required this.password,
    required this.school_system,
    required this.age,
    required this.location,
    required this.profileImage,
    required this.phone_number,
    // required this.isAdmin,
    required this.accessToken,
  });
  factory userSchema.fromjson(Map<String, dynamic> json) => userSchema(
        id: json['_id'],
        fname: json['fname'],
        lname: json['lname'],
        email: json['email'],
        gender: json['gender'],
        role: json['role'] == 'student' ? Role.student : Role.teacher,
        password: json['password'],
        school_system: json['school_system'],
        age: json['age'],
        location: json['location'],
        phone_number: json['phone_number'],
        profileImage: json['profileImage'],
        // isAdmin: json['isAdmin'] == true,
        // isAdmin: json[true],
        accessToken: json['accessToken'],
      );
  toJson() => {
        'id': id,
        'fname': fname,
        'lname': lname,
        'email': email,
        'gender': gender,
        'role': role == Role.student ? 'student' : 'tutor',
        'location': location,
        'age': age,
        'profileImage': profileImage,
        // 'isAdmin': isAdmin,
        'phone_number': phone_number
      };
}

//==============================================================================
class StudentModel {
  final String id;
  final int grade;
  final userSchema user;

  StudentModel({required this.id, required this.grade, required this.user});
  factory StudentModel.fromJson(Map<String, dynamic> json) => StudentModel(
      id: json['_id'],
      user: userSchema.fromjson(json['user']),
      grade: json['grade']);
  toJson() => {'grade': grade, ...user.toJson()};
}

//==============================================================================
class TutorModel {
  final String id;
  final SubjectModel state;
  final userSchema user;
  final double? rating;
  final List certificates;

  TutorModel(
      {required this.id,
      this.rating,
      required this.state,
      required this.user,
      required this.certificates});
  factory TutorModel.fromJson(Map<String, dynamic> json) => TutorModel(
      id: json['_id'],
      rating: json['rating'],
      certificates: json['certificate'],
      state: SubjectModel.fromJson(json['state']),
      user: userSchema.fromjson(json['user']));
  toJson() =>
      {'state': state.id, 'certificate': certificates, ...user.toJson()};
}
//==============================================================================

class AdminModel {
  final String id;
  final SubjectModel state;
  final userSchema user;
  final double? rating;
  final List certificates;

  AdminModel(
      {required this.id,
      this.rating,
      required this.state,
      required this.user,
      required this.certificates});
  factory AdminModel.fromJson(Map<String, dynamic> json) => AdminModel(
      id: json['_id'],
      rating: json['rating'],
      certificates: json['certificate'],
      state: SubjectModel.fromJson(json['state']),
      user: userSchema.fromjson(json['user']));
  toJson() =>
      {'state': state.id, 'certificate': certificates, ...user.toJson()};
}
//==============================================================================

class SubjectModel {
  final String id;
  final String subject_name;
  final String image;
  SubjectModel(
      {required this.id, required this.subject_name, required this.image});
  @override
  bool operator ==(Object other) => other is SubjectModel && other.id == id;
  @override
  int get hashCode => id.hashCode;
  factory SubjectModel.fromJson(Map<String, dynamic> json) => SubjectModel(
      id: json['_id'],
      subject_name: json['subject_name'],
      image: json['image']);
  toJson() => {'subject_name': subject_name};
}

//==============================================================================
class Group {
  int id = 0;
  String name = "";
  String course_code = "";
  String course_name = "";
  Color course_color = white;
  String course_img;
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
    this.course_img = '',
  });
  static Group decode(Map map) {
    return Group(
        id: map['id'] ?? 0,
        name: map['name'] ?? '',
        course_code: map['course_code'] ?? '',
        course_name: map['course_name'] ?? '',
        course_color: map['course_color'] ?? white);
    // course_img:'Assets/images/log.svg';
  }
}

//==============================================================================
class ContactFormData {
    String name;
    String email;
    String message;
  
    ContactFormData({required this.name, required this.email, required this.message});
  
    Map<String, dynamic> toJson() {
      final Map<String, dynamic> data = Map<String, dynamic>();
      data['name'] = name;
      data['email'] = email;
      data['message'] = message;
      return data;
    }
  }
//==============================================================================

class Chat {
  final String name;
  final String lastMessage;
  final String image;
  final String time;
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
class Message {
  String message;
  String sentByMe;

  Message({required this.message, required this.sentByMe});
  factory Message.fromJSON(Map<String, dynamic> json) {
    return Message(message: json["message"], sentByMe: json["sentByMe"]);
  }
}

//==============================================================================

//==============================================================================
