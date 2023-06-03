
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'Constants/Dimensions.dart';
import 'Constants/SetUp3Data.dart';
import 'Constants/designConstants.dart';
import 'Constants/new_constrants2.dart';
import 'ServiceNeeds.dart';
import 'UserProfile.dart';

class NearestBuilding extends StatefulWidget {
  const NearestBuilding({Key? key}) : super(key: key);

  @override
  State<NearestBuilding> createState() => _NearestBuildingState();
}

class _NearestBuildingState extends State<NearestBuilding> {
  late Object _value;
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
    return Scaffold(
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
      //   backgroundColor: Color(0xFF00CDD0),
      //   leading: IconButton(
      //     onPressed: () {
      //
      //     },
      //     icon: Icon(
      //       Icons.notifications,
      //       color: Colors.white,
      //       size: MyDim.fontSizebetween,
      //     ),
      //   ),
      //   actions: [
      //     IconButton(
      //       onPressed: () {
      //
      //       },
      //       icon: Icon(
      //         Icons.person,
      //         color: Colors.white,
      //         size: MyDim.fontSizebetween,
      //       ),
      //     ),
      //   ],
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height:MyDim.paddingUnit*8,
              child: Padding(
                padding: const EdgeInsets.only(top: 30,left: 10),
                child: Row(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        image: DecorationImage(image:AssetImage('Assets/images/info.png') ),
                      ),
                    ),
                    SizedBox(
                      width: MyDim.SizedBoxtiny,
                    ),
                    Expanded(
                      child: Container(
                        // width:  MediaQuery.of(context).size.width,
                        // facingaproblemtoknowwhatisthen (0:4)
                        // constraints: BoxConstraints (
                        //   maxWidth:350,
                        // ),
                        child:
                        Text(
                          'Facing a problem to know what is the nearest governmental building  for you?',
                          style: TextStyle(
                            fontSize:  21.5,
                            fontWeight:  FontWeight.w400,
                            height:  1.3,
                            color:  Color(0xff454141),
                          ),
                        ),
                      ),
                    ),


                  ],
                ),
              ),
            ),
            SizedBox(
              height:MyDim.SizedBoxtiny,
            ),
            GestureDetector(
              child: RichText(text:  TextSpan(
                  text: 'Don’t worry,  ',
                  style: TextStyle(fontSize: 20,color: Colors.black),
                  children: <InlineSpan>[
                    TextSpan(
                      text: 'Monkez',style: TextStyle(color: Colors.cyan,fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: '  is here to guide you!',style: TextStyle(color: Colors.black),
                    ),
                  ]
              ) ),
            ),
            Container(
              width:MediaQuery.of(context).size.width*0.22,
              height: MediaQuery.of(context).size.height*0.13,
              decoration:BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('Assets/images/building.png')
                  )
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right:12 ),
              child: Text("Kindly fill the following to help you out:",style: TextStyle(decoration: TextDecoration.underline ,fontWeight: FontWeight.bold,fontSize: MyDim.fontSizeButtons*0.9),),
            ),
            SizedBox(
              height:MyDim.SizedBoxtiny,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 5,
                  height: 5,
                  decoration:BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(MyDim.radius)
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right:MyDim.paddingUnit*4 ), child: Text('Type of  governmental building ? ',style: TextStyle(fontSize:18),),
                ),
              ],
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(right:130,top:10),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200]
                  ),
                  width:200,
                  child: DropdownButtonFormField<dynamic>(
                    menuMaxHeight:350,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(2),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(width: 2,color: Colors.grey),
                      ),
                    ),
                    alignment: Alignment.center,
                    items: LocationList(),
                    onChanged: (value) {
                      setState(() {
                        _value = value!;
                      });
                    },
                    hint: Text("Traffic unit....", style: kHintTextStyle),
                  ),
                ),
              ),
            ),
            SizedBox(
              height:MyDim.SizedBoxtiny,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 5,
                  height: 5,
                  decoration:BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(MyDim.radius)
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right:MyDim.paddingUnit*14 ), child: Text('Governorate ',style: TextStyle(fontSize:18),),
                ),
              ],
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(right:130,top:10),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200]
                  ),
                  width:200,
                  child: DropdownButtonFormField<dynamic>(
                    menuMaxHeight:200,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(5),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                        borderSide: BorderSide(width: 2,color: Colors.grey),
                      ),
                    ),
                    alignment: Alignment.center,
                    items:  GovernemtalList(),
                    onChanged: (value) {
                      setState(() {
                        _value = value!;
                      });
                    },
                    hint: Text("Alexandria....", style: kHintTextStyle),
                  ),
                ),
              ),
            ),









          ],
        ),
      ),


    );
  }
}
