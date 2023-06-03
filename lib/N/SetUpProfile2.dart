import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'CategoriesSetUp2.dart';
import 'Constants/Dimensions.dart';
import 'ServiceNeeds.dart';
import 'UserProfile.dart';

class SetProfile2 extends StatefulWidget {
  const SetProfile2({Key? key}) : super(key: key);

  @override
  State<SetProfile2> createState() => _SetProfile2State();
}

class _SetProfile2State extends State<SetProfile2> {
  TextEditingController dateinput = TextEditingController();
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
        centerTitle: true,
        title: Text('Personal Identification', style: TextStyle(fontSize: 25 , 
        fontWeight: FontWeight.bold , 
        fontFamily: 'IBMPlexSerif-LightItalic')) ,
        backgroundColor: Color(0xFF00CDD0),
        leading: IconButton(
          onPressed: () {},
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
              child: Image(
                image: ResizeImage(AssetImage('Assets/images/blackLogo.png'),
                    width: 1000, height: 800),
              ),
              // child: Text('Monkez',style: TextStyle(fontSize: MyDim.fontSizebetween, fontWeight: FontWeight.w700),),
              decoration: BoxDecoration(
                // image: 'Assets/images/logoblack.png',
                color: Colors.black,
              ),
            ),
            for (String item in items)
              ListTile(
                title: Text(
                  item,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  for (int i = 0; i < items.length; i++) {
                    if (item == items[i]) {
                      print('Family Community');
                      setState(() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => userprofile()));
                      });
                      break;
                    } else if (item == items[i]) {
                      print('Service Needs');
                      setState(() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ServiceNeeds()));
                      });
                    } else if (item == items[i]) {
                      print('Travel Guide');
                      // setState(() {
                      //   Navigator.push(context,MaterialPageRoute(builder:(context)=>SetProfile2()));
                      // });
                    } else if (item == items[i]) {
                      print('Contact Us');
                      // setState(() {
                      //   Navigator.push(context,MaterialPageRoute(builder:(context)=>SetProfile2()));
                      // });
                    } else if (item == items[i]) {
                      print('Nearest Building');
                      // setState(() {
                      //   Navigator.push(context,MaterialPageRoute(builder:(context)=>SetProfile2()));
                      // });
                    } else if (item == items[i]) {
                      print('Guidance');
                      // setState(() {
                      //   Navigator.push(context,MaterialPageRoute(builder:(context)=>SetProfile2()));
                      // });
                    } else if (item == items[i]) {
                      print('Profile');
                      // setState(() {
                      //   Navigator.push(context,MaterialPageRoute(builder:(context)=>SetProfile2()));
                      // });
                    } else if (item == items[i]) {
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: MyDim.paddingUnit * 1.5, left: MyDim.paddingUnit * 2),
            child: Expanded(
              child: Row(
                children: <Widget>[
                  //National ID
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: MyDim.paddingUnit * 1,
                        right: MyDim.paddingUnit * 2),
                    child: Container(
                      child: Column(
                        children: [
                          Image.asset(
                            'Assets/images/id.png',
                            width: MyDim.myWidth(context) * 0.3,
                            height: MyDim.myHeight(context) * 0.2,
                          ),
                          IconButton(
                            onPressed: () {
                              onClick();
                            },
                            icon: Icon(
                              Icons.add_circle_outline,
                              color: Colors.black,
                              size: 30.0,
                            ),
                          ),
                          Text(
                            'National ID',
                            style: TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(
                    width: 70.0,
                  ),

                  //Passport
                  Container(
                    child: Column(
                      children: [
                        Image.asset(
                          'Assets/images/Passport.png',
                          width: MyDim.myWidth(context) * 0.3,
                          height: MyDim.myHeight(context) * 0.2,
                        ),
                        IconButton(
                          onPressed: () {
                            onClick();
                          },
                          icon: Icon(
                            Icons.add_circle_outline,
                            color: Colors.black,
                            size: 30.0,
                          ),
                        ),
                        Text(
                          'Passport',
                          style: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          //second Column
          Padding(
            padding: const EdgeInsets.only(
                top: MyDim.paddingUnit * 1.5, left: MyDim.paddingUnit * 1.5),
            child: Expanded(
                child: Row(
              children: [
                //Driving
                Container(
                  child: Column(
                    children: [
                      Image.asset(
                        'Assets/images/driving.png',
                        width: MyDim.myWidth(context) * 0.3,
                        height: MyDim.myHeight(context) * 0.2,
                      ),
                      IconButton(
                        onPressed: () {
                          onClick();
                        },
                        icon: Icon(
                          Icons.add_circle_outline,
                          color: Colors.black,
                          size: 30.0,
                        ),
                      ),
                      Text(
                        'Driving Lisence',
                        style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  width: 70.0,
                ),

                //BirthDate
                Container(
                  child: Column(
                    children: [
                      Image.asset(
                        'Assets/images/Birth.png',
                        width: MyDim.myWidth(context) * 0.3,
                        height: MyDim.myHeight(context) * 0.2,
                      ),
                      IconButton(
                        onPressed: () {
                          onClick();
                        },
                        icon: Icon(
                          Icons.add_circle_outline,
                          color: Colors.black,
                          size: 30.0,
                        ),
                      ),
                      Text(
                        ' Birthdate \nCertificate',
                        style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
          ),

          SizedBox(
            height: 28.0,
          ),

          Padding(
            padding: const EdgeInsets.only(left: MyDim.paddingUnit * 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color(0xFF00CDD0),
                    ),
                    width: MyDim.myWidth(context) * 0.4,
                    child: TextButton(
                        onPressed: () {
                          setState(() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CategoriesSetUp2()));
                          });
                        },
                        child: Text(
                          'Done',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: MyDim.fontSizeButtons),
                        ))),
                SizedBox(
                  width: MyDim.paddingUnit * 2,
                ),
                // GestureDetector(
                //   onTap: (){
                //     setState(() {
                //       Navigator.push(context,MaterialPageRoute(builder:(context)=>CategoriesSetUp2()));
                //     });
                //   },
                //   child:Text('Skip',style: TextStyle(color: Colors.grey,decoration:TextDecoration.underline,fontWeight: FontWeight.bold),),
                // )
              ],
            ),
          )
        ],
      ),
    );
  }

  //plus Button function
  void onClick() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Container(
            child: AlertDialog(
              backgroundColor: Colors.white,
              title: Container(
                width: 600,
                height: 170,
                child: Row(
                  children: [
                    //Upload
                    Column(
                      children: [
                        Image.asset(
                          'Assets/images/upload.png',
                          color: Colors.black,
                          width: 90.0,
                          height: 90.0,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Color(0xFF00CDD0)),
                          width: 100.0,
                          height: 50.0,
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'Upload',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20.0),
                            ),
                          ),
                        )
                      ],
                    ),
                    //Camera
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: MyDim.paddingUnit * 1,
                          left: MyDim.paddingUnit * 3.5),
                      child: Expanded(
                          child: Column(
                        children: [
                          Image.asset(
                            'Assets/images/camera.png',
                            color: Colors.black,
                            width: 100.0,
                            height: 90.0,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Color(0xFF00CDD0)),
                            width: 100.0,
                            height: 50.0,
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                'Camera',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20.0),
                              ),
                            ),
                          )
                        ],
                      )),
                    ),
                  ],
                ),
              ),
              content: Container(
                child: Stack(
                  children: [
                    //Expire Date text
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 2.0),
                      child: Text(
                        'Expire Date',
                        style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.black,
                        ),
                      ),
                    ),

                    //calender + date textfield
                    Center(
                      child: Padding(
                        padding:
                            const EdgeInsets.only(right: 10, bottom: 200.0),
                        child: TextField(
                          controller:
                              dateinput, //editing controller of this TextField
                          decoration: InputDecoration(
                            icon: Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Icon(Icons.calendar_today,
                                  color: Colors.cyan),
                            ), //icon of text field
                            labelText: "  Enter a date",
                            labelStyle:
                                TextStyle(color: Colors.black, fontSize: 18.0),

                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  BorderSide(width: 2, color: Colors.black),
                            ),
                          ),
                          readOnly: true,
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime(2001),
                                firstDate: DateTime(
                                    1920), //DateTime.now() - not to allow to choose before today.
                                lastDate: DateTime(2009));

                            if (pickedDate != null) {
                              print(
                                  pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                              String formattedDate =
                                  DateFormat('dd-MM-yyyy').format(pickedDate);
                              print(
                                  formattedDate); //formatted date output using intl package =>  2021-03-16
                              //you can implement different kind of Date Format here according to your requirement

                              setState(() {
                                dateinput.text =
                                    formattedDate; //set output date to TextField value.
                              });
                            } else {
                              print("Date is not selected");
                            }
                          },
                        ),
                      ),
                    ),

                    //OK Button
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 50.0,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Color(0xFF00CDD0)),
                          width: 200.0,
                          height: 50.0,
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SetProfile2()));
                        });
                            },
                            child: Text(
                              'Done',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20.0),
                            ),
                          ),
                        ),
                      ),
                    ),

                    //Cancel Button
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 180.0,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Color(0xFF00CDD0)),
                          width: 200.0,
                          height: 50.0,
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SetProfile2()));
                        });
                            },
                            child: Text(
                              'Cancel',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20.0),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
