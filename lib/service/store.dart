import 'package:flutter/material.dart';
import 'package:tutor/service/models.dart';

User? currUser = User(
    type: 'student',
    id: '1',
    fname: 'Mariam ',
    lname: 'Waleed',
    gender: 'Female',
    branch: 'Alexandria',
    college: 'Software engineering',
    dep: ' SIM ',
    sem: 8,
    gpa: 3.2,
    profileImage:
        // const Image(image: AssetImage('assets/images/Me.jpeg'))
        'assets/images/Me.jpeg');

List<Group> group = [
  Group(
    id: 0,
    name: 'A/1',
    course_code: 'GN111',
    course_name: 'Arabic',
    course_color: Colors.orange,
  ),
  Group(
    id: 1,
    name: 'F/3',
    course_code: 'GN222',
    course_name: 'English ',
    course_color: Colors.yellow,
  ),
  Group(
    id: 2,
    name: 'B/1',
    course_code: 'BA101',
    course_name: 'Math',
    course_color: Colors.green,
  ),
  Group(
      id: 3,
      name: 'C/2',
      course_code: 'BA304',
      course_name: 'Physics ',
      course_color: Colors.pink),
];

List chatsData = [
  Chat(
      name: "Mariam waleed ",
      lastMessage: "my last",
      image: 'assets/images/log.svg',
      time: '3m ago',
      isActive: false),
  Chat(
      name: "Mariam waleed 1",
      lastMessage: "my last",
      image: 'assets/images/log.svg',
      time: '3m ago',
      isActive: false),
  Chat(
      name: "Mariam waleed 2",
      lastMessage: "my last",
      image: 'assets/images/log.svg',
      time: '3m ago',
      isActive: false),
  Chat(
      name: "Mariam waleed 3",
      lastMessage: "my last",
      image: 'assets/images/log.svg',
      time: '3m ago',
      isActive: false),
];

List<Map> structure = [
  {
    "id": 1,
    "name": "Abu-Kir",
    "selected": false,
    "expanded": false,
    "colleges": [
      {
        "id": 11,
        "name": "Engineering",
        "selected": false,
        "departments": [
          {
            "id": 111,
            "name": "Computer",
            "selected": false,
          },
          {
            "id": 112,
            "name": "Electronics",
            "selected": false,
          },
        ]
      },
      {
        "id": 12,
        "name": "Computing",
        "selected": false,
        "departments": [
          {
            "id": 121,
            "name": "Computer Science",
            "selected": false,
          },
          {
            "id": 122,
            "name": "Software Engineering",
            "selected": false,
          },
        ]
      },
    ]
  },
  {
    "id": 2,
    "name": "Smart Village",
    "selected": false,
    "expanded": false,
    "colleges": [
      {
        "id": 21,
        "name": "Languange",
        "selected": false,
        "departments": [
          {
            "id": 21,
            "name": "Media",
            "selected": false,
          },
          {
            "id": 212,
            "name": "Translation",
            "selected": false,
          },
        ]
      },
      {
        "id": 22,
        "name": "Computing",
        "selected": false,
        "departments": [
          {
            "id": 221,
            "name": "Computer Science",
            "selected": false,
          },
          {
            "id": 222,
            "name": "Information System",
            "selected": false,
          },
        ]
      },
    ]
  },
  // {
  //   "id": 3,
  //   "name": "Alamein",
  //   "selected": false,
  // "expanded": false,
  //   "colleges":[]
  // },
  // {
  //   "id": 4,
  //   "name": "Sheraton",
  //   "selected": false,
  //   "colleges":[]
  // },
];
