import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tutor/components/comp.dart';
import 'package:tutor/components/structureList.dart';
import 'package:tutor/pages/Classwork.dart';
import 'package:tutor/pages/Messages.dart';
import 'package:tutor/pages/Home.dart';
import 'package:tutor/pages/Notification.dart';
import 'package:tutor/pages/Profile.dart';
import 'package:tutor/pages/Schedule.dart';
import 'package:tutor/service/store.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:accordion/accordion.dart';

import '../components/NavBar.dart';

class BroadCast extends StatefulWidget {
  const BroadCast({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => BroadCastState();
}

class BroadCastState extends State<BroadCast> {
  BroadCastState({Key? key});
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
  TextEditingController textarea = TextEditingController();
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
  int count(branch) {
    int all = 0;
    for (int i = 0; i < branch['colleges']; i++) {
      // if(branch['colleges'][i]['selected']) all++;
      all += branch['colleges'][i]['departments']
          .where((x) => x['selected'])
          .length as int;
    }
    return all;
  }

  //============================================================================
  int count_all() {
    int all = 0;
    for (int i = 0; i < structure.length; i++) {
      for (int j = 0; j < structure[i]['colleges'].length; j++) {
        // if(branch['colleges'][i]['selected']) all++;
        all += structure[i]['colleges'][j]['departments']
            .where((x) => x['selected'] == true)
            .length as int;
      }
    }
    return all;
  }

  //============================================================================
  TextEditingController options = TextEditingController();

  //============================================================================

  Widget makeBot() {
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Stack(
        children: [
          // Post content
          TextField(
            // controller: textarea,
            keyboardType: TextInputType.multiline,
            maxLines: 7,
            decoration: InputDecoration(
              hintText: " Type somthing.. ",
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.black26),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          // icons
          Positioned(
            bottom: 5,
            left: 5,
            child: Row(
              children: [
                // to add file
                FloatingActionButton(
                    backgroundColor: basecolor3,
                    child: Icon(Icons.attach_file),
                    onPressed: () async {
                      final result = await FilePicker.platform.pickFiles();
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
                SizedBox(width: 5),
                // to create Poll
                FloatingActionButton(
                  backgroundColor: basecolor3,
                  child: Icon(Icons.bar_chart),
                  onPressed: () => showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: Row(children: [
                        // profile image
                        CircleAvatar(
                            radius: 20,
                            child: SvgPicture.asset('assets/images/aast.svg')),
                        // User name
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
                          // poll options
                          // SizedBox(height: MediaQuery.of(context).size.height),
                          Column(
                            children: [
                              InputField(options, 'First option'),
                            ],
                          ),
                          SizedBox(height: 5),
                          InputField(options, 'Second option'),

                          // to add more options
                          Positioned(
                            bottom: 5,
                            right: 5,
                            child: FloatingActionButton(
                                backgroundColor: basecolor3,
                                child: Icon(Icons.add),
                                onPressed: () {
                                  InputField(options, 'Second option');
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
                                  color: basecolor,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Spacer(),
                        // Create Poll
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
                          child: Text("Create Poll",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Post btn
          Positioned(
            bottom: 5,
            right: 5,
            child: Row(
              children: [
                // ElevatedButton(
                //   style: ElevatedButton.styleFrom(
                //     primary: basecolor,
                //     elevation: 7,
                //     shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(15)),
                //     padding: EdgeInsets.all(25),
                //   ),
                //   onPressed: () {
                //     print(textarea.text);
                //   },
                //   child: Text(" Poll ",
                //       style: TextStyle(fontWeight: FontWeight.bold)),
                // ),
                // SizedBox(width: 5),
                // // to create Poll
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: basecolor,
                    elevation: 7,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    padding: const EdgeInsets.all(25),
                  ),
                  onPressed: () {
                    print(textarea.text);
                  },
                  child: const Text(" Post ",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  //============================================================================
  @override
  Widget build(BuildContext context) {
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
                "Create Post",
                style: TextStyle(
                    color: black, fontSize: 25.0, fontWeight: FontWeight.bold),
              ),
              const Text('This will appear on the newsfeed',
                  style: TextStyle(color: Colors.black38, fontSize: 14.0)),
            ]),
        actions: [
          IconButton(
              padding: const EdgeInsets.only(right: 40),
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
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Structure List
              ExpansionPanelList(
                  expansionCallback: (index, isExpanded) {
                    setState(() {
                      for (int i = 0; i < structure.length; i++) {
                        if (i != index) {
                          structure[i]['expanded'] = false;
                        }
                      }
                      structure[index]['expanded'] =
                          !structure[index]['expanded'];
                    });
                  },
                  children: structure.map<ExpansionPanel>((branch) {
                    List<Map> colleges = branch['colleges'];
                    return ExpansionPanel(
                      headerBuilder: (context, isExpanded) {
                        return GestureDetector(
                          onTap: () {
                            for (int i = 0; i < structure.length; i++) {
                              if (structure[i]['id'] != branch['id']) {
                                structure[i]['expanded'] = false;
                              }
                            }
                            setState(
                                () => branch['expanded'] = !branch['expanded']);
                          },
                          child: ListTile(
                            title: Text("${branch['name']}",
                                style: TextStyle(color: basecolor, fontSize: 14, fontWeight: FontWeight.bold)),
                          ),
                        );
                      },
                      isExpanded: branch['expanded'],
                      body: Column(
                          children: colleges.map<Widget>((college) {
                        return Column(
                          children: [
                            GestureDetector(
                                onTap: () {
                                  setState(() {
                                    college['selected'] = !college['selected'];
                                    for (int i = 0;
                                        i < college['departments'].length;
                                        i++) {
                                      college['departments'][i]['selected'] =
                                          college['selected'];
                                    }
                                  });
                                },
                                child: Row(
                                  children: [
                                    Checkbox(
                                      value: college['selected'],
                                      onChanged: (new_val) {
                                        setState(() {
                                          college['selected'] = new_val;
                                          for (int i = 0;
                                              i < college['departments'].length;
                                              i++) {
                                            college['departments'][i]
                                                ['selected'] = new_val;
                                          }
                                        });
                                      },
                                    ),
                                    Text(college['name']),
                                  ],
                                )),
                            ...college['departments'].map<Widget>((dep) {
                              return Row(
                                children: [
                                  SizedBox(width: 25.0),
                                  GestureDetector(
                                      onTap: () {
                                        setState(() =>
                                            dep['selected'] = !dep['selected']);
                                      },
                                      child: Row(
                                        children: [
                                          Checkbox(
                                            value: dep['selected'],
                                            onChanged: (new_val) {
                                              setState(() =>
                                                  dep['selected'] = new_val);
                                            },
                                          ),
                                          Text(dep['name']),
                                        ],
                                      ))
                                ],
                              );
                            }).toList()
                          ],
                        );
                      }).toList()),
                    );
                  }).toList()),
              // structure.map<Widget>((branch)){
              //   return Text("${structure[index]["name"]}");
              // },
              SizedBox(height: 15),
              Text("You selected ${count_all()} departments"),
              SizedBox(height: 15),
              Text('Create Post',
                  style: TextStyle(
                      color: basecolor,
                      fontFamily: 'sen',
                      fontSize: 15,
                      fontWeight: FontWeight.bold)),
              SizedBox(height: 5),
              makeBot()
            ],
          ),
        ),
      ),
      //bottom navigation bar on scaffold
      bottomNavigationBar: NavBar(),
    );
  }
}
//============================================================================
