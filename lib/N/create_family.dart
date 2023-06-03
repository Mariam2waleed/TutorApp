import 'package:flutter/material.dart';

import 'Constants/Dimensions.dart';
import 'UserProfile.dart';

class createFamily extends StatefulWidget {
  const createFamily({Key? key}) : super(key: key);

  @override
  State<createFamily> createState() => _createFamilyState();
}

class _createFamilyState extends State<createFamily> {
  String? dropdownValue;
  int _count=0;
  void _incrementCount(){
    setState((){
      _count++;
    });
  }

  void _decrementCount(){
    setState((){
      _count--;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   elevation: 0.0,
        // leading: IconButton(
        //     onPressed: (){
        //       setState(() {
        //         Navigator.push(context,MaterialPageRoute(builder:(context)=>SetUpProfile1()));
        //       });
        //     },
        //     icon:Container(
        //       width: 30.0,
        //       height: 30.0,
        //       decoration: BoxDecoration(
        //         shape: BoxShape.circle,
        //         color: Color(0xFF00CDD0),
        //       ),
        //
        //       child: Icon(
        //         Icons.arrow_back,
        //         color:Colors.white,
        //       ),
        //     )),

      // ),
  body: SingleChildScrollView(
    child: Column(
      children: [
        SizedBox(height:MyDim.SizedBoxtiny*8,),
      Text(
      'Create Family \n Community',
      textAlign: TextAlign.center,
      style: TextStyle(
          color: Colors.black,
          fontSize: 35.0,
        fontWeight: FontWeight.bold,
      ),),
     SizedBox(
       height: 5.0,
     ),
     CircleAvatar(
       radius: 35.0,
       backgroundImage: NetworkImage('https://cdn-icons-png.flaticon.com/512/6966/6966266.png'),
     ),
        SizedBox(
          height: 10.0,
        ),
      Divider(
        color: Colors.blue,
        height: 2, //height spacing of divider
        thickness: 2, //thickness of divier line
       indent: 2,
        endIndent: 2,
      ),
        SizedBox(
          height: 10.0,
        ),
        RichText(text: TextSpan(
          text: 'We are ',
          style: TextStyle(color: Colors.black, fontSize: 22),
          children: <TextSpan>[
            TextSpan(text:'PLEASURED ',style: TextStyle( color: Color(0xFF00CDD0),)),
             TextSpan(text:'to use ',style: TextStyle(color: Colors.black, fontSize: 22),),
            TextSpan(text:'MONKEZ ',style: TextStyle( color: Color(0xFF00CDD0),)),
            // \u{00A0} to give spaces between words
            TextSpan(text:'\n \u{00A0}  to ease your ',style: TextStyle(color: Colors.black, fontSize: 22),),
            TextSpan(text:'CONTACT ',style: TextStyle( color: Color(0xFF00CDD0),)),
            TextSpan(text:'with your ',style: TextStyle(color: Colors.black, fontSize: 22),),
            TextSpan(text:'\n \u{00A0} \u{00A0} \u{00A0} \u{00A0}\u{00A0}\u{00A0}\u{00A0}\u{00A0}\u{00A0}  FAMILY COMMUNITY! ',style: TextStyle( color: Color(0xFF00CDD0),)),
          ],


        )),
        SizedBox(
          height: 30.0,
        ),
       SizedBox(
         width: 370.0,
         child: TextFormField(
           style: TextStyle(
             fontSize: 20.0
           ),
           decoration: InputDecoration(
             labelText: 'Family Name',
             border: OutlineInputBorder(
               borderRadius: BorderRadius.circular(25.0),
             ),
           ),
         ),
       ),
        SizedBox(
          height: 25.0,
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: InputDecorator(
            decoration: InputDecoration(
              labelText: 'Family Location',
              labelStyle: TextStyle(
                fontSize: 20
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0)),
              contentPadding: EdgeInsets.all(10),
            ),
            child: ButtonTheme(
              materialTapTargetSize: MaterialTapTargetSize.padded,
              child: DropdownButton<String>(
                hint: const Text("Choose your location"),
                isExpanded: true,
                value: dropdownValue,
                elevation: 16,
                underline: DropdownButtonHideUnderline(
                  child: Container(),
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
                items: <String>['Alexandria', 'Cairo', 'Luxor', 'Aswan','PortSaid']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 3.0,
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: InputDecorator(
            decoration: InputDecoration(
              labelText: 'Initial number of family members',
              labelStyle: TextStyle(
                  fontSize: 20
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0)),
              contentPadding: EdgeInsets.all(10),
            ),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceAround,
             children: [
               FloatingActionButton.small(
                 child: Icon(Icons.add),
                 onPressed: _incrementCount,
                 backgroundColor:  Color(0xFF00CDD0),

               ),
               Text('${_count}',
               style: TextStyle(
                 fontSize: 25.0
               ),),

               FloatingActionButton.small(
                 child: Icon(Icons.remove),
                 onPressed: _decrementCount,
                 backgroundColor:  Color(0xFF00CDD0),
               ),
             ],
           ),
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color:  Color(0xFF00CDD0)
            ),
            width: 180.0,
            height:60.0,
            child: TextButton(onPressed: (){
              setState(() {
                Navigator.push(context,MaterialPageRoute(builder:(context)=>userprofile()));
              });
            }, child:Text('Create',style: TextStyle(color: Colors.white,fontSize: 20.0),))),
        SizedBox(height:20.0 ,),
      ],
    ),
  ),

    );

  }
}



