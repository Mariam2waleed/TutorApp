import 'package:flutter/material.dart';

import 'Constants/Dimensions.dart';
import 'Education.dart';
import 'MoneyRelated.dart';
import 'Photos.dart';
import 'ServiceNeeds.dart';
import 'SetUpProfile2.dart';
import 'UserProfile.dart';
import 'Vaccines.dart';

class CategoryModel {
  final String title;
  final String photoUrl;

  CategoryModel({
    required this.title,
    required this.photoUrl,
  });
}

class CategoriesSetUp2 extends StatefulWidget {
  @override
  State<CategoriesSetUp2> createState() => _CategoriesSetUp2State();
}

class _CategoriesSetUp2State extends State<CategoriesSetUp2> {
  List<CategoryModel> categories = [
    CategoryModel(
      title: 'Personal Identification',
      photoUrl: 'Assets/images/Me.jpeg',
    ),
    CategoryModel(
      title: 'Money Related',
      photoUrl: 'Assets/images/Me.jpeg',
    ),
    CategoryModel(
      title: 'Education',
      photoUrl: 'Assets/images/Me.jpeg',
    ),
    CategoryModel(
      title: 'Vaccines',
      photoUrl: 'Assets/images/Me.jpeg',
    ),
    CategoryModel(
      title: 'Personal Photos',
      photoUrl: 'Assets/images/Me.jpeg',
    )
  ];
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
        // appBar: AppBar(
        //   backgroundColor: Color(0xFF00CDD0),
        //   centerTitle: true,
        //   title: const Text(
        //     'SetUp Profile 2',
        //     style: TextStyle(
        //       color: Colors.white,
        //       fontSize: 20.0,
        //       fontWeight: FontWeight.bold,
        //     ),
        //   ),
        //   leading: IconButton(
        //       onPressed: () {},
        //       icon: const Icon(
        //         Icons.arrow_back,
        //         color: Colors.white,
        //         size: 20.0,
        //       )),
        // ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Center(
                  child: Text(
                    ''
                    'Choose Your Category',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Divider(
                thickness: 2.0,
              ),
              SizedBox(
                height: 20.0,
              ),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) =>
                    buildCategory(categories[index]),
                separatorBuilder: (context, index) => SizedBox(
                  height: 20.0,
                ),
                itemCount: categories.length,
              )
            ],
          ),
        ));
  }

// build item
  Widget buildCategory(CategoryModel category) => GestureDetector(
        onTap: () {
          if (category.title == 'Personal Identification') {
            // Your code here
            print('Personal');
            setState(() {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SetProfile2()));
            });
          } else if (category.title == 'Money Related') {
            print('Money');
            setState(() {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MoneyRelated()));
            });
          } else if (category.title == 'Education') {
            print('Education');
            setState(() {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Education()));
            });
          } else if (category.title == 'Vaccines') {
            print('Vaccines');
            setState(() {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Vaccines()));
            });
          } else if (category.title == 'Personal Photos') {
            print('Photos');
            setState(() {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Photos()));
            });
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: 120,
            decoration: BoxDecoration(
              border: Border.all(
                color: Color(0xFF00CDD0),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      '${category.photoUrl}',
                      height: 60.0,
                      width: 50.0,
                    ),
                  ),
                  Text(
                    "${category.title}",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
