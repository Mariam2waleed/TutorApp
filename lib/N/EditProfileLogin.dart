import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'Constants/SetUp3Data.dart';
import 'Constants/Dimensions.dart';
import 'Constants/designConstants.dart';
import 'UserProfile.dart';
class SetUpProfile3LoginPath extends StatefulWidget {
  const SetUpProfile3LoginPath({Key? key}) : super(key: key);

  @override
  State<SetUpProfile3LoginPath> createState() => _SetUpProfile3LoginPathState();
}

class _SetUpProfile3LoginPathState extends State<SetUpProfile3LoginPath> {
  String? selecteditem = 'Cairo';
  late Object _value;

  bool? Nationalid = false;
  bool? driverLisence = false;
  bool? birthCirt = false;
  bool? HSCirt = false;
  bool? passport = false;
  bool? visa = false;
  bool? vaccine = false;

  List<DropdownMenuItem> choices = [
    DropdownMenuItem(
      value: 1,
      child: Row(
        children: [
          Icon(Icons.image_search),
          Text("  Choose from gallery", style: kMenuItemStyle),
        ],
      ),
    ),
    DropdownMenuItem(
      value: 2,
      child: Row(
        children: [
          Icon(Icons.camera_alt_outlined),
          Text("  Take a photo", style: kMenuItemStyle),
        ],
      ),
    ),
  ];

//text editing controller for text field
  TextEditingController dateinput = TextEditingController();
  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF00CDD0),
        centerTitle: true,
        title: const Text(
          'Edit Profile',
          style: TextStyle(
              color: Colors.white,
              fontSize: MyDim.fontSizebetween,
              fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
            onPressed: () {
              setState(() {
                Navigator.push(context,MaterialPageRoute(builder:(context)=>userprofile()));
              });
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: MyDim.fontSizeButtons,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Add an avatar text
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 15),
              child: Text.rich(
                TextSpan(
                  text: 'Add an avatar',
                  style: const TextStyle(
                    color: Colors.transparent,
                    decorationColor:Color(0xFF00CDD0),
                    shadows: [
                      Shadow(color: Colors.black, offset: Offset(0, -10))
                    ],
                    decoration: TextDecoration.underline,
                    decorationThickness: 3,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ), // default text style
                  children: <TextSpan>[
                    TextSpan(
                      text: '      (Optional) ',
                      style: TextStyle(
                        fontSize: 18,
                        shadows: [
                          Shadow(
                              color: Colors.black.withOpacity(0.6),
                              offset: const Offset(0, -10))
                        ],
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //Circle avatar + choose image button
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.transparent,
                    backgroundImage:
                    AssetImage('Assets/images/avatar.png'),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: DropdownButton<dynamic>(
                      alignment: AlignmentDirectional.topCenter,
                      hint: Text(
                        "Choose image",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      icon: Visibility(
                          visible: false, child: Icon(Icons.arrow_downward)),
                      items: choices,
                      onChanged: (value) {
                        setState(() {
                          _value = value!;
                        });
                      },
                    ),
                  )
                ],
              ),
            ),

            //Add your location text
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 15),
              child: Text.rich(
                TextSpan(
                  text: 'Add your location',
                  style: const TextStyle(
                    color: Colors.transparent,
                    decorationColor: Color(0xFF00CDD0),
                    shadows: [
                      Shadow(color: Colors.black, offset: Offset(0, -10))
                    ],
                    decoration: TextDecoration.underline,
                    decorationThickness: 3,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ), // default text style
                  children: <TextSpan>[
                    TextSpan(
                      text: '    (Optional) ',
                      style: TextStyle(
                        fontSize: 18,
                        shadows: [
                          Shadow(
                              color: Colors.black.withOpacity(0.6),
                              offset: const Offset(0, -10))
                        ],
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //drop down location
            Center(
              child: Padding(
                padding: const EdgeInsets.all(7.0),
                child: DropdownButtonFormField<dynamic>(
                  menuMaxHeight:250,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(20),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(width: 2, color: Colors.black),
                    ),
                  ),
                  alignment: Alignment.center,
                  items: LocationList(),
                  onChanged: (value) {
                    setState(() {
                      _value = value!;
                    });
                  },
                  hint: Text("   Choose your location", style: kHintTextStyle),
                ),
              ),
            ),

            //Birthdate text
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 15, bottom: 10),
              child: Text.rich(
                TextSpan(
                  text: 'Birthdate',
                  style: const TextStyle(
                    color: Colors.transparent,
                    decorationColor: Color(0xFF00CDD0),
                    shadows: [
                      Shadow(color: Colors.black, offset: Offset(0, -10))
                    ],
                    decoration: TextDecoration.underline,
                    decorationThickness: 3,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ), // default text style
                  children: <TextSpan>[
                    TextSpan(
                      text: '    (Optional) ',
                      style: TextStyle(
                        fontSize: 18,
                        shadows: [
                          Shadow(
                              color: Colors.black.withOpacity(0.6),
                              offset: const Offset(0, -10))
                        ],
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //calender + date textfield
            Center(
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: TextField(
                  controller: dateinput, //editing controller of this TextField
                  decoration: InputDecoration(
                    icon: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Icon(Icons.calendar_today, color: Colors.cyan),
                    ), //icon of text field
                    labelText: "  Enter a date",
                    labelStyle: kHintTextStyle,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(width: 3, color: Colors.black),
                    ),
                  ),
                  readOnly: true,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(
                            1900), //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2101));
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

            //pick docs text
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
              child: Text.rich(
                TextSpan(
                  text: 'Pick the documents you want',
                  style: const TextStyle(
                      color: Colors.transparent,
                      decorationColor: Color(0xFF00CDD0),
                      shadows: [
                        Shadow(color: Colors.black, offset: Offset(0, -10))
                      ],
                      decoration: TextDecoration.underline,
                      decorationThickness: 3,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      wordSpacing: 2,
                      height: 1.4),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "to be public",
                  style: TextStyle(
                      color: Colors.transparent,
                      decorationColor: Colors.cyan,
                      shadows: [
                        Shadow(color: Colors.black, offset: Offset(0, -10))
                      ],
                      decoration: TextDecoration.underline,
                      decorationThickness: 3,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      wordSpacing: 2,
                      height: 1.4),
                  textAlign: TextAlign.center,
                ),
                SizedBox(width: MyDim.paddingUnit * 1.5),
                Padding(
                  padding: const EdgeInsets.only(right: 12, bottom: 9),
                  child: Text(
                    "(Optional)",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black.withOpacity(0.6),
                    ),
                  ),
                ),
              ],
            ),

            //checkboxes+ finish button
            Column(
              children: [
                CheckboxListTile(
                  value: Nationalid,
                  controlAffinity:
                  ListTileControlAffinity.leading, //checkbox at left
                  onChanged: (bool? value) {
                    setState(() {
                      Nationalid = value;
                    });
                  },
                  title: Text(
                    "National ID",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                CheckboxListTile(
                  value: driverLisence,
                  controlAffinity:
                  ListTileControlAffinity.leading, //checkbox at left
                  onChanged: (bool? value) {
                    setState(() {
                      driverLisence = value;
                    });
                  },
                  title: Text(
                    "Driver's lisence",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                CheckboxListTile(
                  value: birthCirt,
                  controlAffinity:
                  ListTileControlAffinity.leading, //checkbox at left
                  onChanged: (bool? value) {
                    setState(() {
                      birthCirt = value;
                    });
                  },
                  title: Text(
                    "Birth Certificate",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                CheckboxListTile(
                  value: HSCirt,
                  controlAffinity:
                  ListTileControlAffinity.leading, //checkbox at left
                  onChanged: (bool? value) {
                    setState(() {
                      HSCirt = value;
                    });
                  },
                  title: Text(
                    "High School Graduation Certificate",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                CheckboxListTile(
                  value: passport,
                  controlAffinity:
                  ListTileControlAffinity.leading, //checkbox at left
                  onChanged: (bool? value) {
                    setState(() {
                      passport = value;
                    });
                  },
                  title: Text(
                    "Passport",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                CheckboxListTile(
                  value: visa,
                  controlAffinity:
                  ListTileControlAffinity.leading, //checkbox at left
                  onChanged: (bool? value) {
                    setState(() {
                      visa = value;
                    });
                  },
                  title: Text(
                    "Acquired Visas",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                CheckboxListTile(
                  value: vaccine,
                  controlAffinity:
                  ListTileControlAffinity.leading, //checkbox at left
                  onChanged: (bool? value) {
                    setState(() {
                      vaccine = value;
                    });
                  },
                  title: Text(
                    "Vaccines",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: MyDim.paddingUnit * 4, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Color(0xFF00CDD0),),
                          width: 150,
                          height: 65,
                          child: TextButton(
                              onPressed: () {
                                setState(() {
                                  Navigator.push(context,MaterialPageRoute(builder:(context)=>userprofile()));
                                });

                              },
                              child: Text(
                                'Finish',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: MyDim.fontSizeButtons),
                              ))),
                      SizedBox(
                        width: MyDim.paddingUnit * 2,
                      ),
                      // GestureDetector(
                      //   onTap: () {},
                      //   child: Text(
                      //     'Skip',
                      //     style: TextStyle(
                      //         color: Colors.grey,
                      //         decoration: TextDecoration.underline,
                      //         fontWeight: FontWeight.bold),
                      //   ),
                      // )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
