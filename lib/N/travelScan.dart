import 'package:flutter/material.dart';

import 'Constants/Dimensions.dart';
import 'Constants/DocumentButton.dart';
import 'Constants/TravelGuideConstants.dart';
import 'ServiceNeeds.dart';
import 'UserProfile.dart';

class TravelGuide extends StatefulWidget {
  const TravelGuide({Key? key}) : super(key: key);

  @override
  State<TravelGuide> createState() => _TravelGuideState();
}

class _TravelGuideState extends State<TravelGuide> {
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
      body: SingleChildScrollView(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 50.0,),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 150,
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFF00CDD0), width: 3),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image(
                        image: ResizeImage(
                            AssetImage('Assets/images/NearestBuilding.png'),
                            width: 50,
                            height: 70),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        'Travel Scan',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                "Which country do you want to inquire about ?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Divider(
              color: Colors.black,
              thickness: 1.2,
              endIndent: MyDim.paddingUnit * 3,
              indent: MyDim.paddingUnit * 3,
            ),
            SizedBox(height:MyDim.SizedBoxtiny*1,),
            DocumentButton(

                image: 'Assets/images/mlz.jpeg',
                label: 'Malaysia',
                clickdoc: openDialogMz),
            SizedBox(height:MyDim.SizedBoxtiny*1,),
            DocumentButton(

                image: 'Assets/images/leb.jpeg',
                label: 'Lebanon',
                clickdoc: openDialogLeb),
            SizedBox(height:MyDim.SizedBoxtiny*1,),
            DocumentButton(

                image: 'Assets/images/alb.jpeg',
                label: 'Albania',
                clickdoc: openDialogAlb),
            SizedBox(height:MyDim.SizedBoxtiny*1,),
            DocumentButton(

                image: 'Assets/images/mal.jpeg',
                label: 'Maldives',
                clickdoc: openDialogMal),
            SizedBox(
              height: MyDim.SizedBoxsmall,
            ),
          ],
        ),
      ),
    );
  }

  Future openDialogAlb() => showDialog(
      context: context,
      builder: (context) =>
          InstructionsPopUp(onpressed: Done, steps: Albania()));

  Future openDialogLeb() => showDialog(
      context: context,
      builder: (context) =>
          InstructionsPopUp(onpressed: Done, steps: Lebanon()));
  Future openDialogMal() => showDialog(
      context: context,
      builder: (context) =>
          InstructionsPopUp(onpressed: Done, steps: Maldives()));
  Future openDialogMz() => showDialog(
      context: context,
      builder: (context) =>
          InstructionsPopUp(onpressed: Done, steps: Malaysia()));

  void Done() {
    Navigator.of(context).pop();
  }
}
