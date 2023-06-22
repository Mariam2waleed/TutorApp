
import 'package:flutter/material.dart';
import 'dart:convert';
import '../components/PostsList.dart';
import '../components/comp.dart';
import '../service/store.dart';
import 'package:http/http.dart' as http;
import 'package:date_time_line/date_time_line.dart';
import '../components/NavBar.dart';
import '../service/EndPoints.dart';

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
    var res = await http.get(Uri.parse(EndPoints.product));
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
  ConirmDelete(id) async => showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
            title: const Text("Delete"),
            content: const Text("Are you sure you want to delete"),
            actions: [
              TextButton(
                  child: const Text("Yes"),
                  onPressed: () async {
                    await http.delete(Uri.parse('${EndPoints.product}/$id'));
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NavBar()));
                  }),
              TextButton(
                  child: const Text("No"),
                  onPressed: () {
                    Navigator.pop(context);
                  })
            ],
          ));
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

        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
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
 