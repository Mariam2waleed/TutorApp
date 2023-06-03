import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'Constants/Dimensions.dart';
import 'ServiceNeeds.dart';
import 'UserProfile.dart';
import 'home.dart';

class ContactUS extends StatefulWidget {
  const ContactUS({Key? key}) : super(key: key);

  @override
  State<ContactUS> createState() => _ContactUSState();
}

class _ContactUSState extends State<ContactUS> {

  // late final double rating;
  // late final double size;
  // int? ratingCount;
  // RatingBar({required this.rating, this.ratingCount, this.size=18});

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
        child: Padding(
          padding: const EdgeInsets.only(top:MyDim.fontSizebetween),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height:MyDim.SizedBoxtiny*8,),
                  Container(
                    height:MyDim.fontSizeButtons*3,
                    width:MyDim.fontSizeButtons*3,
                    decoration: BoxDecoration(
                        image: DecorationImage(image:
                        AssetImage('Assets/images/img_12.png'),
                        )
                    ),
                  ),

                  Text('\u{00A0}'),
                  Text("Get in Touch",style: TextStyle(fontWeight: FontWeight.bold,fontSize: MyDim.fontSizeButtons),)
                ],
              ),
              Center(
                child: Divider(
                  thickness: 1,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height:MyDim.SizedBoxtiny*3,),
              SizedBox(
                width: 370.0,
                child: TextFormField(
                  style: TextStyle(
                      fontSize: 20.0
                  ),
                  decoration: InputDecoration(
                    labelText: 'Full Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MyDim.SizedBoxsmall*3.0,
              ),

              SizedBox(
                width: 370.0,
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(
                      fontSize: 20.0
                  ),
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.alternate_email_rounded,color: Colors.black,),
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MyDim.SizedBoxsmall*3.0,
              ),

              SizedBox(
                width: 370.0,
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  style: TextStyle(
                      fontSize: 20.0
                  ),
                  decoration: InputDecoration(

                    suffixIcon: Icon(Icons.call,color: Colors.black,),
                    labelText: 'Phone',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MyDim.SizedBoxsmall*3.0,
              ),


              SizedBox(
                width: 370.0,
                child: TextFormField(
                  maxLines: 3,
                  style: TextStyle(
                      fontSize: 20.0
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 40),
                    labelText: '   Leave Your Message',

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: MyDim.SizedBoxsmall*2.5,
              ),

              // Padding(
              //   padding: const EdgeInsets.only(right:MyDim.paddingUnit*10),
              // ),
              // TextButton(onPressed: (){}, child:Text('Submit')),
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color:  Color(0xFF00CDD0)
                  ),
                  width: 180.0,
                  height:70.0,
                  child: TextButton(onPressed: (){


                    showDialog(
                        context: context,
                        builder: (BuildContext context)
                        { return  Container(
                          width: 200,
                          height: 150,


                          child: AlertDialog(
                              backgroundColor: Colors.white,


                              title: Text('Thank you for sumbiting',style: TextStyle(color:Color(0xFF00CDD0),fontSize: 20.0),),
                              content: Container(
                                width: 200,
                                height: 120,
                                child: Stack(
                                  children: [
                                    Text("  Do you want to rate us ?",style: TextStyle(color:Color(0xFF00CDD0),fontSize: 20.0),),

                                    Padding(
                                      padding: const EdgeInsets.only(top: MyDim.paddingUnit*3.5, left: MyDim.paddingUnit*2.3),
                                      child: Container(
                                        width: MediaQuery.of(context).size.width*0.40,
                                        height: 35,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Colors.white,
                                        ),
                                        child: RatingBar.builder(
                                          minRating: 1,
                                          itemSize: 29,
                                          itemPadding: EdgeInsets.symmetric(horizontal: 1),
                                          itemBuilder: (context,_)=> Icon(Icons.star, color: Colors.amber),
                                          updateOnDrag: true,
                                          onRatingUpdate: (rating)
                                          {},
                                        ),
                                      ),
                                    ),


                                    Container(

                                        padding: const EdgeInsets.only(top: MyDim.paddingUnit*6, left: MyDim.paddingUnit*6),
                                        child: TextButton(onPressed: (){
                                          MaterialPageRoute materialPageRoute = new MaterialPageRoute(
                                            builder: ( context) => ContactUS(),
                                          );
                                          Navigator.of(context).push(materialPageRoute);
                                        }, child: GestureDetector(
                                          onTap: (){
                                            setState(() {
                                              Navigator.push(context,MaterialPageRoute(builder:(context)=>MainScreen()));
                                            });
                                          },
                                          child: Text("Done", style: TextStyle(color: Color(0xFF00CDD0),
                                            decoration: TextDecoration.underline,),),
                                        ))),

                                    Positioned( right: -40.0,
                                      top: -40.0,
                                      child: InkResponse(
                                        onTap: (){
                                          Navigator.of(context).pop();

                                        },

                                      ),)
                                  ],
                                ),

                              )
                          ),
                        ) ;

                        }
                    );
                  },

                      child:Text('Submit',style: TextStyle(color: Colors.white,fontSize: 20.0),))),

              SizedBox(height:20.0 ,),
            ],
          ),
        ),
      ),

    );

  }
}