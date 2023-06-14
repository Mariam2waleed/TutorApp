// import 'dart:html';

// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tutor/components/comp.dart';
import 'package:tutor/pages/Profile.dart';
import 'package:tutor/service/store.dart';
import 'package:http/http.dart' as http;
// import 'dart:io';
import '../components/AppDrawer.dart';
import '../service/EndPoints.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});
  @override
  State<StatefulWidget> createState() => NotificationPageState();
}

class NotificationPageState extends State<NotificationPage> {
  NotificationPageState({Key? key});
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
  //============================================================================
  var formKey = GlobalKey<FormState>();
  var name = TextEditingController();
  var price = TextEditingController();
  var desc = TextEditingController();
  //============================================================================
  insert() async {
    var res = await http.post(Uri.parse(EndPoints.product),
        body: {"name": name.text, "price": price.text, "desc": desc.text},
        headers: {"Content-Type": "application/x-www-form-urlencoded"});
  }
  //============================================================================

  //============================================================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 110.0,
          elevation: 0,
          backgroundColor: white,
          // automaticallyImplyLeading: false,
          iconTheme: IconThemeData(color: black),
          title: Center(
              child: Text("Notifications",
                  style: TextStyle(color: black, fontWeight: FontWeight.bold))),
          actions: [
            IconButton(
                highlightColor: Colors.deepPurple[300],
                iconSize: 48.0,
                icon: CircleAvatar(
                    radius: 50,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(currUser!.profileImage,
                            fit: BoxFit.cover))),
                onPressed: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProfilePage()))
                    })
          ]),
      drawer: AppDrawer(),
      //============================================================================
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: formKey,
              child: Column(children: [
                TextFormField(
                    decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Enter your name'),
                    validator: (value) {
                      if (value == null) {
                        return "you should add value";
                      }
                      return null;
                    },
                    controller: name),
                const SizedBox(height: 20),
                TextFormField(
                    decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Enter your price'),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    validator: (value) {
                      if (value == null) {
                        return "you should add value";
                      }
                      return null;
                    },
                    controller: price),
                const SizedBox(height: 20),
                TextFormField(
                    decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Enter your desc'),
                    validator: (value) {
                      if (value == null) {
                        return "you should add value";
                      }
                      return null;
                    },
                    controller: desc),
                const SizedBox(height: 20),
                // insert button
                MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(70.0)),
                    padding: const EdgeInsets.all(0.0),
                    child: Ink(
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.deepPurple,
                                  Color.fromARGB(255, 188, 112, 207)
                                ]),
                            borderRadius:
                                BorderRadius.all(Radius.circular(70.0))),
                        child: Container(
                            constraints: const BoxConstraints(
                                maxWidth: 150,
                                // minWidth: 30.0,
                                minHeight:
                                    44.0), // min sizes for Material buttons
                            alignment: Alignment.center,
                            // text
                            child: const Text('Insert product',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25),
                                textAlign: TextAlign.center))),
                    // functionality
                    onPressed: () {
                      insert();
                      const snackBar = SnackBar(
                        content: Text('Yay! A New Product !'),
                        // action: SnackBarAction(
                        //   label: 'Remove',
                        //   onPressed: () async {
                        //           await http.delete(Uri.parse(
                        //               'https://tutor-running.herokuapp.com/product/$id'));
                        //     // Some code to undo the change.
                        //   },
                        // ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => const NavBar()));
                    }),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
//============================================================================

//===========================================================================
