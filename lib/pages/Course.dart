import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tutor/components/comp.dart';
import 'package:tutor/components/TAList.dart';
import 'package:tutor/components/PostsList.dart';
import 'package:tutor/pages/Notification.dart';
import 'package:tutor/pages/Profile.dart';
import 'package:tutor/service/store.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

import '../components/NavBar.dart';

class CoursePage extends StatefulWidget {
  final int index;
  const CoursePage(this.index, {Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => CoursePageState();
}

class CoursePageState extends State<CoursePage> {
  CoursePageState({Key? key});
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
  int network_type = 0;
  TextEditingController textarea = TextEditingController();

  //============================================================================
  Widget network_type_selector() {
    return SizedBox(
      //width:10,
      child: CupertinoSegmentedControl(
          // height: 70,
          padding: padding(55, 10),
          selectedColor: basecolor,
          borderColor: basecolor,
          pressedColor: basecolor,
          unselectedColor: white,
          groupValue: network_type,
          onValueChanged: (int new_index) {
            setState(() {
              network_type = new_index;
            });
          },
          children: ["Posts", "Members"].asMap().map((index, value) {
            return MapEntry(
                index,
                Padding(
                    padding: padding(0, 10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(value,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          SizedBox(width: 5.0),
                        ])));
          })),
    );
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
  Widget members() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('TA',
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: 25, fontWeight: FontWeight.bold, color: basecolor)),
          ListView.builder(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemCount: group.length,
            itemBuilder: (context, index) => TAList(
              group: group[index],
              onPress: () {},
            ),
          ),
        ],
      ),
    );
  }

  //============================================================================
  void openFile(PlatformFile file) {
    OpenFile.open(file.path!);
  }

  //===========================================================================
  Future<File> saveFilePermanentli(PlatformFile file) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final newFile = File('${appStorage.path}/${file.name}');

    return File(file.path!).copy(newFile.path);
  }
  //============================================================================
  // void openFiles(List<PlatformFile> files) => Navigator.of(context).push(MaterialPageRoute(builder: (context) => FilePage( files: files, onOpenedFile: openFile,),));
  //============================================================================

  @override
  Widget build(BuildContext context) {
    final int x = widget.index;
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
              Text(
                group[x].course_name,
                style: TextStyle(
                    color: black, fontSize: 25.0, fontWeight: FontWeight.bold),
              ),
              Text('All course topics and assignments',
                  style: TextStyle(color: Colors.black38, fontSize: 14.0)),
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
      // Course
      body: Stack(
        children: [
          // My body
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: ListView(children: [
              // Posts .. Members
              network_type_selector(),
              //  Posts
              if (network_type == 0) ...[posts()]
              // Members
              else ...[members()],
            ]),
          ),
          // to add post
          if (network_type == 0) ...[
            Positioned(
              bottom: 16,
              right: 16,
              child: FloatingActionButton(
                backgroundColor: basecolor,
                child: Icon(Icons.add),
                onPressed: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: Row(children: [
                      CircleAvatar(
                          radius: 20,
                          child: SvgPicture.asset('assets/images/aast.svg')),
                      Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(currUser!.fname + currUser!.lname,
                                    style: TextStyle(
                                        color: black, fontSize: 15.0)),
                              ]))
                    ]),
                    content: Stack(
                      children: [
                        // comment
                        TextField(
                          controller: textarea,
                          keyboardType: TextInputType.multiline,
                          maxLines: 5,
                          decoration: InputDecoration(
                            hintText: "Type somthing.. ",
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 2, color: white),
                            ),
                          ),
                        ),
                        // to add file
                        Positioned(
                          bottom: 5,
                          right: 5,
                          child: FloatingActionButton(
                              backgroundColor: basecolor3,
                              child: Icon(Icons.attach_file),
                              onPressed: () async {
                                final result =
                                    await FilePicker.platform.pickFiles();
                                // await FilePicker.platform.pickFiles(allowMultiple: true);

                                if (result == null) return;

                                // Open Single file
                                final file = result.files.first;
                                //openFile(file);

                                // Multiple files
                                // openFiles(result.files);

                                print('Name: ${file.name}');
                                print('Bytes: ${file.bytes}');
                                print('Size: ${file.size}');
                                print('Extension: ${file.extension}');
                                print('Path: ${file.path}');

                                final newFile = await saveFilePermanentli(file);
                                print('From path: ${file.path!}');
                                print('to path: ${newFile.path}');
                              }),
                        )
                      ],
                    ),
                    actions: <Widget>[
                      // Cancel
                      TextButton(
                        style: TextButton.styleFrom(
                          primary: white,
                          // elevation: 3,
                          side: BorderSide(width: 3, color: basecolor),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25))),
                          padding: EdgeInsets.all(25),
                        ),
                        onPressed: () => Navigator.pop(context, 'Cancel'),
                        child: Text('Cancel',
                            style: TextStyle(
                                color: basecolor, fontWeight: FontWeight.bold)),
                      ),
                      Spacer(),
                      // Request
                      ElevatedButton(
                        //  ButtonStyle(
                        //   backgroundColor:
                        //       MaterialStateProperty.all<Color>(basecolor),
                        // ),
                        style: ElevatedButton.styleFrom(
                          primary: basecolor,
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          // shape: StadiumBorder(), primary: basecolor
                          padding: EdgeInsets.all(25),
                        ),
                        onPressed: () {
                          print(textarea.text);
                        },
                        child: Text("Request",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ]
        ],
      ),
      //bottom navigation bar on scaffold
      bottomNavigationBar: NavBar(),
    );
  }
}
//============================================================================
