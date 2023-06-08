
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Constants/Dimensions.dart';
import 'UserProfile.dart';
import 'create_family.dart';

class SetUpProfile1 extends StatefulWidget {


  var radius =12;
  @override
  State<SetUpProfile1> createState() => _SetProfileoneState();
}

class _SetProfileoneState extends State<SetUpProfile1> {
  @override
  Widget build(BuildContext context) {
    bool ischecked = false;

    return Scaffold(


      body: SingleChildScrollView(
        child: Column(

          children:<Widget> [
            SizedBox(height:MyDim.SizedBoxtiny*6,),
            Padding(
              padding: const EdgeInsets.only(top:MyDim.paddingUnit*3,left:MyDim.paddingUnit*2),
              child: Row(
                children: [
                  Container(
                    width:30,
                    height:40, decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.contain,
                          image: AssetImage('Assets/images/info.png',)
                      )
                  ),
                  ),
                  SizedBox(width: MyDim.paddingUnit2,),
                  Text('Inform Us',style: TextStyle(fontSize:MyDim.fontSizebetween,fontWeight: FontWeight.bold,color:Color(0xff000000),decoration:TextDecoration.underline,decorationColor:Color(0xff000000),  ),),
                  SizedBox(width: MyDim.paddingUnit*6,),
                  Container(
                    width:90,
                    height:90, decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('Assets/images/familyColor.png')
                    ),

                  ),
                  ),

                ],
              ),
            ),
            SizedBox(
              height: MyDim.SizedBoxtiny*2,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(

                    width: 7,
                    height: 7,
                    decoration:BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(MyDim.radius)
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right:20 ),
                    child: Text('Do you have a family community ?',style: TextStyle(fontSize:MyDim.fontSizeButtons ,fontWeight: FontWeight.bold),),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:MyDim.paddingUnit2*4 ),
              child: Row(
                children: [
                  Checkbox(value: ischecked,activeColor:Colors.grey[400] ,checkColor: Colors.grey,tristate: true ,onChanged:(
                      bool ? newValue
                      ){
                    setState(() {
                      ischecked = newValue!;
                    });
                  }),
                  SizedBox(height:MyDim.SizedBoxsmall*9,),
                  Text('yes',style: TextStyle(fontSize: MyDim.fontSizeMedium,fontWeight: FontWeight.bold),)

                ],
              ),
            ),
            Container
              (
              width: 300,
              height: 45,
              decoration: BoxDecoration(color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(30)),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 25.0, top: 3, right: 10),
                child: TextFormField(
                  autocorrect: false,
                  enableSuggestions: false,
                  autofocus: false,
                  decoration: InputDecoration(border: InputBorder.none,
                    hintText: 'Enter your Family Name..',
                    hintStyle: TextStyle(fontSize: 18,

                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MyDim.SizedBoxtiny*3.5,
            ),
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color:  Color(0xFF00CDD0),
                ),
                width: MyDim.myWidth(context)*0.4,
                child: TextButton(onPressed: (){
                  setState(() {
                    Navigator.push(context,MaterialPageRoute(builder:(context)=>userprofile()));
                  });
                }, child:Text('Next',style: TextStyle(color: Colors.white,fontSize: MyDim.fontSizeButtons),))),
            SizedBox(
              height: MyDim.SizedBoxtiny*1,
            ),
            Padding(
              padding: const EdgeInsets.only(left:MyDim.paddingUnit2*4 ),
              child: Row(
                children: [
                  Checkbox(value: ischecked,activeColor:Colors.grey[400] ,checkColor: Colors.grey,tristate: true ,onChanged:(
                      bool ? newValue
                      ){
                    setState(() {
                      ischecked = newValue!;
                    });
                  }),
                  SizedBox(height:MyDim.SizedBoxsmall*9,),
                  Text('No',style: TextStyle(fontSize: MyDim.fontSizeMedium,fontWeight: FontWeight.bold),)


                ],
              ),
            ),
            Center(
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child:  Text(
                      'Do you want to create family Community?',textDirection: TextDirection.ltr,
                      style: new TextStyle(fontSize:MyDim.fontSizeButtons, color: Colors.black,fontWeight: FontWeight.bold),
                      maxLines: 3,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height:MyDim.paddingUnit*2 ,),
            Padding(
              padding: const EdgeInsets.only(left: MyDim.paddingUnit*4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                        color: Color(0xFF00CDD0),
                      ),
                      width: MyDim.myWidth(context)*0.4,
                      child: TextButton( onPressed: (){
                        setState(() {
                          Navigator.push(context,MaterialPageRoute(builder:(context)=>createFamily()));
                        });
                      }, child:Text('Create',style: TextStyle(color: Colors.white,fontSize: MyDim.fontSizeButtons),))),
                  SizedBox(width: MyDim.paddingUnit*2,),
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
            ),
            SizedBox(height: 30.0,)
















          ],
        ),
      ),


    );
  }
}