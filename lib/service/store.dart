import 'package:flutter/material.dart';
import 'package:tutor/service/models.dart';

User? currUser = User(
    type: 'student',
    id: '1',
    fname: 'Mariam ',
    lname: 'Waleed',
    email: 'Mariam2waleed@gmail.com',
    gender: 'Female',
    branch: 'Alexandria',
    college: 'Software engineering',
    dep: ' SIM ',
    sem: 8,
    gpa: 3.2,
    profileImage:
        // const Image(image: AssetImage('Assets/images/Me.jpeg'))
        'Assets/images/Me.jpeg');

List<Group> group = [
  Group(
    id: 0,
    name: 'A/1',
    course_code: 'GN111',
    course_name: 'Arabic',
    course_color: Colors.orange,
    course_img: 'Assets/images/Arabic.png',
  ),
  Group(
    id: 1,
    name: 'F/3',
    course_code: 'GN222',
    course_name: 'English ',
    course_color: Colors.yellow,
    course_img: 'Assets/images/English.png',
  ),
  Group(
    id: 2,
    name: 'B/1',
    course_code: 'BA101',
    course_name: 'Math',
    course_color: Colors.green,
    course_img: 'Assets/images/Math.png',
  ),
  Group(
    id: 3,
    name: 'C/2',
    course_code: 'BA304',
    course_name: 'Physics ',
    course_color: Colors.brown,
    course_img: 'Assets/images/Physics.png',
  )
];

List chatsData = [
  Chat(
      name: "Mariam waleed ",
      lastMessage: "my last",
      image: 'Assets/images/log.svg',
      time: '3m ago',
      isActive: false),
  Chat(
      name: "Mariam waleed 1",
      lastMessage: "my last",
      image: 'Assets/images/log.svg',
      time: '3m ago',
      isActive: false),
  Chat(
      name: "Mariam waleed 2",
      lastMessage: "my last",
      image: 'Assets/images/log.svg',
      time: '3m ago',
      isActive: false),
  Chat(
      name: "Mariam waleed 3",
      lastMessage: "my last",
      image: 'Assets/images/log.svg',
      time: '3m ago',
      isActive: false),
];

const info = [
  {
    'name': 'Rivaan Ranawat',
    'message': 'Hey, how are you doing?',
    'time': '3:53 pm',
    'profilePic':
        'https://upload.wikimedia.org/wikipedia/commons/8/85/Elon_Musk_Royal_Society_%28crop1%29.jpg',
  },
  {
    'name': 'John Doe',
    'message': 'Hello, whats up',
    'time': '2:25 pm',
    'profilePic':
        'https://www.socialketchup.in/wp-content/uploads/2020/05/fi-vill-JOHN-DOE.jpg',
  },
  {
    'name': 'Naman Ranawat',
    'message': 'Hello, I want to sleep.',
    'time': '1:03 pm',
    'profilePic':
        'https://media.cntraveler.com/photos/60596b398f4452dac88c59f8/16:9/w_3999,h_2249,c_limit/MtFuji-GettyImages-959111140.jpg',
  },
  {
    'name': 'Dad',
    'message': 'Call me, have some work',
    'time': '12:06 pm',
    'profilePic':
        'https://pbs.twimg.com/profile_images/1419974913260232732/Cy_CUavB.jpg',
  },
  {
    'name': 'Mom',
    'message': 'You ate food?',
    'time': '10:00 am',
    'profilePic':
        'https://uploads.dailydot.com/2018/10/olli-the-polite-cat.jpg?auto=compress%2Cformat&ixlib=php-3.3.0',
  },
  {
    'name': 'Jurica',
    'message': 'Yo!!!!! Long time, no see!?',
    'time': '9:53 am',
    'profilePic':
        'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60',
  },
  {
    'name': 'Albert Dera',
    'message': 'Am I fat?',
    'time': '7:25 am',
    'profilePic':
        'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60',
  },
  {
    'name': 'Joseph',
    'message': 'I am from International Olym...',
    'time': '6:02 am',
    'profilePic':
        'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60',
  },
  {
    'name': 'Sikandar',
    'message': 'Lets Code!',
    'time': '4:56 am',
    'profilePic':
        'https://images.unsplash.com/photo-1619194617062-5a61b9c6a049?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fHJhbmRvbSUyMHBlb3BsZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=900&q=60',
  },
  {
    'name': 'Ian Dooley',
    'message': 'Images by Unsplash',
    'time': '1:00 am',
    'profilePic':
        'https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60',
  },
];


const messages = [
  {"isMe": false, "text": "Hey What is up with you!!", "time": "10:00 am"},
  {"isMe": true, "text": "im fine,wbu?", "time": "11:00 am"},
  {"isMe": false, "text": "I am great man!", "time": "11:01 am"},
  {
    "isMe": false,
    "text": "Just messaged cuz I had some work.",
    "time": "11:01 am"
  },
  {"isMe": true, "text": "Obviously, say", "time": "11:03 am"},
  {
    "isMe": false,
    "text": "haha I wanted you to check out my new channel ^^",
    "time": "11:04 am"
  },
  {
    "isMe": true,
    "text": " Sure, what is the channel name?",
    "time": "11:05 am"
  },
  {
    "isMe": false,
    "text": "Rivaan Ranawat",
    "time": "11:06 am",
  },
  {
    "isMe": true,
    "text": "Looks great to me!",
    "time": "11:15 am",
  },
  

  {"isMe": false, "text": "Thanks bro!", "time": "11:17 am"},
  {
    "isMe": false,
    "text": "Did you subscribe?",
    "time": "11:16 am"
  },
  {
    "isMe": true,
    "text": "Yes, surely bro!",
    "time": "11:17 am"
  },
  {
    "isMe": false,
    "text": "Cool, did you like the content?",
    "time": "11:18 am",
  },
  {
    "isMe": true,
    "text": "I loved it?",
    "time": "11:19 am",
  },
  {
    "isMe": false,
    "text": "OMG! Woah! Thanks!",
    "time": "11:20 am",
  },
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
