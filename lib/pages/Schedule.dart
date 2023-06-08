import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tutor/components/PostsList.dart';
import 'package:tutor/components/comp.dart';
import 'package:tutor/pages/Profile.dart';
import 'package:tutor/service/store.dart';
import 'package:http/http.dart' as http;
import 'package:date_time_line/date_time_line.dart';
import '../components/AppDrawer.dart';
import '../components/NavBar.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});
  @override
  State<StatefulWidget> createState() => SchedulePageState();
}

class SchedulePageState extends State<SchedulePage> {
  SchedulePageState({Key? key});

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

  TextEditingController dateinput = TextEditingController();

  //============================================================================

  //============================================================================

  //============================================================================
  Widget posts() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemCount: group.length,
      itemBuilder: (context, index) => PostsList(
        group: group[index],
        onPress: () {},
      ),
    );
  }

  //============================================================================
  getProduct() async {
    // print("product: ");
    var res = await http
        .get(Uri.parse('https://tutor-running.herokuapp.com/product'));
    // print(res);
    // print(res.statusCode);
    if (res.statusCode == 200) {
      var jsonObj = json.decode(res.body);
      return jsonObj['result'];
    } //else {
    // throw Exception('Failed to fetch products');
    // }
  }

  //============================================================================
  ConirmDelete(id) {
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: Text("Delete"),
              content: Text("Are you sure you want to delete"),
              actions: [
                TextButton(
                    child: const Text("Yes"),
                    onPressed: () async {
                      await http.delete(Uri.parse(
                          'https://tutor-running.herokuapp.com/product/$id'));
                      //  Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const NavBar()));
                    }),
                TextButton(
                    child: Text("No"),
                    onPressed: () {
                      Navigator.pop(context);
                    })
              ],
            ));
  }
  //============================================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // floatingActionButton: FloatingActionButton(
        //   backgroundColor: basecolor,
        //   onPressed: () {
        //     Navigator.pushReplacement(context,
        //         MaterialPageRoute(builder: (context) => const ProfilePage()));
        //   },
        //   child: const Icon(Icons.person),
        // ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

        appBar: AppBar(
            toolbarHeight: 110.0,
            elevation: 0,
            backgroundColor: white,
            // automaticallyImplyLeading: false,
            iconTheme: IconThemeData(color: black),
            title: Center(
                child: Text(
              "Schedule",
              style: TextStyle(color: black, fontWeight: FontWeight.bold),
            )),
            actions: [
              IconButton(
                  highlightColor: Colors.deepPurple[300],
                  iconSize: 48.0,
                  icon:
                      // ImageIcon(Image.asset('Assets/images/Me.jpeq').image)
                      CircleAvatar(
                    radius: 50,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(currUser!.profileImage,
                            fit: BoxFit.cover)),
                  ),
                  onPressed: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ProfilePage()))
                      })
            ]),
        drawer: AppDrawer(),

        // appBar: AppBar(
        //   toolbarHeight: 110.0,
        //   elevation: 0,
        //   backgroundColor: white,
        //   title: Column(
        //       mainAxisAlignment: MainAxisAlignment.start,
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         // title
        //         Text(
        //           "Your Schedule",
        //           style: TextStyle(
        //               color: basecolor,
        //               fontSize: 25.0,
        //               fontWeight: FontWeight.bold),
        //         ),
        //         // subtitle
        //         Text(
        //           "Stay up to date with your class times.",
        //           style: TextStyle(color: Colors.black87, fontSize: 14.0),
        //         ),
        //       ]),
        //   actions: [
        //     IconButton(
        //         padding: EdgeInsets.only(right: 40),
        //         icon: Icon(
        //           Icons.notifications,
        //           color: basecolor,
        //           size: 35,
        //         ),
        //         onPressed: () {
        //           Navigator.push(
        //             context,
        //             MaterialPageRoute(
        //                 builder: (context) => const NotificationPage()),
        //           );
        //         })
        //   ],
        // ),
        // Schedule

        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Column(children: [
            // Body of home page
            DateTimeLine(
                width: MediaQuery.of(context).size.width,
                color: basecolor3,
                hintText: "10 task today",
                onSelected: (value) {
                  setState(() {
                    // var date = value;
                  });
                }),
            const SizedBox(height: 20),
            //////////////////////////////
            Expanded(
                child: FutureBuilder(
                    future: getProduct(),
                    builder: (context, snapshot) {
                      if (snapshot.data != null) {
                        return ListView.builder(
                            itemCount: (snapshot.data as List<dynamic>).length,
                            itemBuilder: (context, index) {
                              return Card(
                                  elevation: 4,
                                  child: ListTile(
                                      title: Text((snapshot.data as List<dynamic>)[index]
                                          ['name']),
                                      subtitle: Text((snapshot.data
                                          as List<dynamic>)[index]["desc"]),
                                      trailing: IconButton(
                                          icon: Icon(Icons.delete,
                                              color: basecolor3),
                                          onPressed: () => ConirmDelete(
                                              (snapshot.data as List<dynamic>)[index]
                                                  ["id"]))));
                            });
                      } //else if (snapshot.hasError) {
                      // return Center(
                      // child: Text('Error: ${snapshot.error}'),
                      // );}
                      else {
                        return const CircularProgressIndicator();
                      }
                    }))
          ]),
        )

        //bottom navigation bar on scaffold
        // bottomNavigationBar: NavBar(),
        );
  }
}
//============================================================================

//===========================================================================

//===========================================================================

//===========================================================================
 