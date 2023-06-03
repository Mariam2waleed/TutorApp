import 'package:flutter/material.dart';

import 'CategoriesSetUp2.dart';
import 'Constants/Dimensions.dart';
import 'EditProfileLogin.dart';
import 'ServiceNeeds.dart';
import 'WelcomePage.dart';
import 'fammember.dart';
import 'models/members.dart';

class userprofile extends StatefulWidget {
  @override
  State<userprofile> createState() => _userprofileState();
}

class _userprofileState extends State<userprofile> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final List<String> items = [
    'Family Community',
    'Service Needs',
    'Travel Guide',
    'Contact Us',
    'Nearest Building',
    'Guidance',
    'Edit Profile',
    'Logout',
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        key: _scaffoldKey,
        drawer: new Drawer(),
        appBar: new AppBar(
          backgroundColor:   Color(0xFF00CDD0),
          leading: IconButton(
            onPressed: () {

            },
            icon: Icon(
              Icons.notifications,
              color: Colors.white,
              size: MyDim.fontSizebetween,
            ),
          ),
        ),
        endDrawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child:Image(
                  image: ResizeImage(
                      AssetImage('Assets/images/blackLogo.png'),
                      width: 1000,
                      height: 800),),
                // child: Text('Monkez',style: TextStyle(fontSize: MyDim.fontSizebetween, fontWeight: FontWeight.w700),),
                decoration: BoxDecoration(
                  // image: 'Assets/images/logoblack.png',
                  color: Colors.black,
                ),
              ),
              for (String item in items)
                ListTile(
                  title: Text(item, style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),),
                  onTap: () {
                    for (int i = 0; i < items.length; i++) {

                      if(item ==items[i])
                      {
                        print('Family Community');
                        setState(() {
                          Navigator.push(context,MaterialPageRoute(builder:(context)=>userprofile()));
                        });
                        break;
                      }
                      else if(item ==items[i])
                      {
                        print('Service Needs');
                        setState(() {
                          Navigator.push(context,MaterialPageRoute(builder:(context)=>ServiceNeeds()));
                        });

                      }
                      else if(item ==items[i])
                      {
                        print('Travel Guide');
                        // setState(() {
                        //   Navigator.push(context,MaterialPageRoute(builder:(context)=>SetProfile2()));
                        // });
                      }
                      else if(item ==items[i])
                      {
                        print('Contact Us');
                        // setState(() {
                        //   Navigator.push(context,MaterialPageRoute(builder:(context)=>SetProfile2()));
                        // });
                      }
                      else if(item ==items[i])
                      {
                        print('Nearest Building');
                        // setState(() {
                        //   Navigator.push(context,MaterialPageRoute(builder:(context)=>SetProfile2()));
                        // });
                      }
                      else if(item ==items[i])
                      {
                        print('Guidance');
                        // setState(() {
                        //   Navigator.push(context,MaterialPageRoute(builder:(context)=>SetProfile2()));
                        // });
                      }
                      else if(item ==items[i])
                      {
                        print('Profile');
                        // setState(() {
                        //   Navigator.push(context,MaterialPageRoute(builder:(context)=>SetProfile2()));
                        // });
                      }
                      else if(item ==items[i])
                      {
                        print('Logout');
                        // setState(() {
                        //   Navigator.push(context,MaterialPageRoute(builder:(context)=>SetProfile2()));
                        // });
                      }

                    }
                  },
                ),
            ],
          ),
        ),
        drawerEdgeDragWidth: 0,

        // appBar: AppBar(
        //   backgroundColor:  Color(0xFF00CDD0),
        //   leading: IconButton(
        //       onPressed: (){
        //         setState(() {
        //           Navigator.push(context,MaterialPageRoute(builder:(context)=>MainScreen()));
        //         });
        //       },
        //       icon:Container(
        //         width: 30.0,
        //         height: 30.0,
        //         decoration: BoxDecoration(
        //           shape: BoxShape.circle,
        //           color: Colors.white.withOpacity(0.2),
        //         ),
        //
        //         child: Icon(
        //           Icons.arrow_back,
        //           color:Colors.white,
        //         ),
        //       )),
        //
        //   actions: [
        //     IconButton(onPressed: (){}, icon:Icon(Icons.menu)),
        //   ],
        // ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 60.0,),
              new Row(
                children: <Widget>[
                  new Container(
                    margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: new Image.asset(
                      'Assets/images/zayn.png',
                      height: 140.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  new Column(
                    children: <Widget>[
                      new Container(
                        margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Zayn Bryce',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                      ),
                      new Container(
                        margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        alignment: Alignment.topLeft,
                        child: Text('bryce12 \nDoctor,\nCalifornia, USA.',
                            style: TextStyle(fontSize: 15)),
                      ),
                      TextButton(
                        style: ButtonStyle(
                          foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  side:
                                  BorderSide(color: Colors.black, width: 2),
                                  borderRadius: BorderRadius.circular(10.0))),
                        ),
                        onPressed: () {

                            setState(() {
                              Navigator.push(context,MaterialPageRoute(builder:(context)=>SetUpProfile3LoginPath()));
                            });

                        },
                        child: Text('Edit Profile',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                      ),
                    ],
                  ),
                ],
              ),
              new Column(
                children: <Widget>[
                  new Container(
                    color: Color.fromARGB(255, 0, 205, 208),
                    margin: EdgeInsets.fromLTRB(12, 30, 12, 0),
                    padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                    alignment: Alignment.center,
                    child: Text(
                      'Family Members',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
              new Container(
                margin: EdgeInsets.fromLTRB(12, 0, 12, 0),
                padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0),
                      bottomLeft: Radius.circular(100),
                      bottomRight: Radius.circular(100)),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 0, 205, 208).withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  children: <Widget>[
                    new Row(
                      children: members.map((e) {
                        if (e.id != '4') {
                          return Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              // color: Colors.blue,
                              child: familymember(e),
                            ),
                          );
                        } else {
                          return Text("");
                        }
                      }).toList(),
                    ),
                    new Container(
                      margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
                      child: OutlinedButton.icon(
                        style: OutlinedButton.styleFrom(
                            padding: EdgeInsets.all(10),
                            side: BorderSide(color: Colors.black, width: 2),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ) //<-- SEE HERE
                        ),
                        onPressed: () {},
                        icon: Icon(
                          // <-- Icon
                          Icons.add_circle_outline,
                          color: Colors.black,
                          size: 26.0,
                        ),
                        label: Text('Add Family Member',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.black)), // <-- Text
                      ),
                    ),
                  ],
                ),
              ),
              new Container(
                margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                      shadowColor:
                      Color.fromARGB(255, 0, 205, 208).withOpacity(0.5),
                      padding: EdgeInsets.all(10),
                      side: BorderSide(
                          color: Color.fromARGB(255, 0, 205, 208), width: 2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ) //<-- SEE HERE
                  ),
                  onPressed: () {
                    setState(() {
                      Navigator.push(context,MaterialPageRoute(builder:(context)=>CategoriesSetUp2()));
                    });
                  },
                  icon: Icon(
                    // <-- Icon
                    Icons.folder,
                    color: Color.fromARGB(255, 66, 65, 65),
                    size: 50.0,
                  ),
                  label: Text('My Documents',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black)), // <-- Text
                ),
              ),
              new Container(
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 0, 205, 208),
                    primary: Colors.black87,
                    minimumSize: Size(88, 36),
                    padding: EdgeInsets.fromLTRB(50, 15, 50, 15),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      Navigator.push(context,MaterialPageRoute(builder:(context)=>WelcomePage()));
                    });
                  },
                  child: Text('Logout',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white)),
                ),
              ),

           SizedBox(height:20.0), ],
          ),
        ),

      ),
    );
  }

  Widget familymember(Members member) {
    return InkWell(
      child: Column(
        children: <Widget>[
          new Container(
            margin: EdgeInsets.fromLTRB(20, 30, 0, 0),
            child: Image.asset(
              member.urlphoto,
              height: 90.0,
              fit: BoxFit.cover,
            ),
          ),
          new Container(
            margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
            // alignment: Alignment.center,
            child: Text(
              member.name,
              // textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          new Container(
            margin: EdgeInsets.fromLTRB(25, 0, 0, 0),
            //   alignment: Alignment.center,
            child: Text(member.pos,
                //     textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15)),
          ),
        ],
      ),
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => fam(member)));
      },
    );
  }
}
