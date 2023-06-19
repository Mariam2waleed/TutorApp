import 'package:flutter/material.dart';
import 'package:tutor/components/comp.dart';
import 'package:tutor/service/store.dart';
import 'dart:math';
import 'package:video_player/video_player.dart';

class TeacherProfile extends StatefulWidget {
  const TeacherProfile({super.key});

  @override
  State<TeacherProfile> createState() => _TeacherProfileState();
}

class _TeacherProfileState extends State<TeacherProfile> {
  late VideoPlayerController _controller;
  bool _isplaying = false;
  List skills = ["Presentaion", "Communication", "well organized"];
  void changeVideo(String videoUrl) {
    _controller = VideoPlayerController.network(videoUrl)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {
          _controller.play();
          _isplaying = true;
          _controller.setLooping(true);
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 85.0,
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: const Center(
          child: Text(
            "Teachers",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(
                width: 2,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.95,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: 'Search for teacher..',
                            filled: true,
                            fillColor: Colors.grey.shade200,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide:
                                  const BorderSide(color: Colors.transparent),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide:  BorderSide(
                                    color: basecolor3))),
                      ),
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Container(
                      decoration:  BoxDecoration(
                          color: basecolor3,
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                          shape: BoxShape.rectangle),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.search,
                          size: 25,
                        ),
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.75,
                child: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.2,
                      color: Colors.transparent,
                      child: Center(
                        child: CircleAvatar(
                          radius: 60,
                          backgroundImage: AssetImage(currUser!.profileImage),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.52,
                        child: ListView(
                          children: <Widget>[
                            SizedBox(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.6,
                                            child: Text(
                                              currUser!.fname,
                                              overflow: TextOverflow.ellipsis,
                                              style:  TextStyle(
                                                  color: basecolor3,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                        Text('⭐️ '),
                                        SizedBox(
                                          width: 2,
                                        ),
                                        Text(
                                          "4",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                          width: 2,
                                        ),
                                        Text(
                                          '(${Random().nextInt(100)})',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                   Padding(
                                    padding:  EdgeInsets.all(8.0),
                                    child: Text(
                                      "Welcome video",
                                      style:  TextStyle(
                                          color: basecolor3,
                                          fontSize: 22,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          _isplaying == true
                                              ? _isplaying = false
                                              : _isplaying = true;
                                        });
                                        _isplaying == true
                                            ? _controller.pause()
                                            : _controller.play();
                                      },
                                      child: Center(
                                        child: _controller.value.isInitialized
                                            ? AspectRatio(
                                                aspectRatio: _controller
                                                    .value.aspectRatio,
                                                child: VideoPlayer(_controller),
                                              )
                                            : Container(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Info",
                                      style: TextStyle(
                                          color: basecolor3,
                                          fontSize: 22,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "I'm an eglish teacher who has experience 15 years with mid and senior level",
                                      style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                   Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "Skills",
                                      style: TextStyle(
                                          color: basecolor3,
                                          fontSize: 22,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.06,
                                    width: MediaQuery.of(context).size.width *
                                        0.95,
                                    child: ListView.builder(
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            width: 150,
                                            height: 29,
                                            decoration: BoxDecoration(
                                                color: Colors.red.shade100,
                                                borderRadius:
                                                    BorderRadius.circular(18)),
                                            child: Center(
                                              child: Text(
                                                skills[index],
                                                style:  TextStyle(
                                                    color: basecolor3,
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                      itemCount: skills.length,
                                      scrollDirection: Axis.horizontal,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
