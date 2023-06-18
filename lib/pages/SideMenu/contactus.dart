import 'package:flutter/material.dart';
// import 'package:tutor/api/api.dart';
// import 'package:tutor/components/NavBar.dart';

import '../../components/comp.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  ContactUsScreenState createState() => ContactUsScreenState();
}

class ContactUsScreenState extends State<ContactUsScreen> {
  // final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(children: [
        ///////////////// Logo //////////////////////////////////
        Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 3,
            decoration: const BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(
                    fit: BoxFit.fitHeight,
                    image: AssetImage('Assets/images/tutoricon.png')))),
        const SizedBox(height: 15),
        ///////////////// login Section //////////////////////////////////

        Expanded(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: basecolor3,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ////////////////// Contact Us ////////////////////
                    Center(
                      child: Text("Contact Us",
                          style:
                              // GoogleFonts.pacifico(),
                              TextStyle(
                                  color: black,
                                  fontSize: 35.0,
                                  fontWeight: FontWeight.bold)),
                    ),
                    ///////////////// Name  //////////////////////////////////
                    Text('Name',
                        style: TextStyle(
                            color: black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 5),
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: white),
                        child: TextField(
                            controller: nameController,
                            style: TextStyle(color: black),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Icon(Icons.person_2, color: black),
                                hintText: 'Your Name',
                                hintStyle: TextStyle(color: black)))),
                    const SizedBox(height: 15),
                    ///////////////// Email  //////////////////////////////////
                    Text('Email',
                        style: TextStyle(
                            color: black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: white),
                        child: TextField(
                            controller: emailController,
                            style: TextStyle(color: black),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Icon(Icons.email, color: black),
                                hintText: 'Email',
                                hintStyle: TextStyle(color: black)))),
                    const SizedBox(height: 15),
                    ///////////////// Password  //////////////////////////////////
                    Text('Message',
                        style: TextStyle(
                            color: black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: white),
                        child: TextField(
                            controller: messageController,
                            maxLines: 5,
                            style: TextStyle(color: black),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Icon(Icons.message, color: black),
                                hintText: 'Message',
                                hintStyle: TextStyle(color: black)))),
                    const SizedBox(height: 15),
                    ///////////////// Sign In button  //////////////////////////////////
                    MaterialButton(
                        minWidth: 20,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(70.0)),
                        padding: const EdgeInsets.all(0.0),
                        child: Center(
                            child: Ink(
                                decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Colors.deepPurple,
                                          Color.fromARGB(255, 188, 112, 207)
                                        ]),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(70.0))),
                                child: Container(
                                    constraints: const BoxConstraints(
                                        maxWidth: 150,
                                        // minWidth: 30.0,
                                        minHeight:
                                            44.0), // min sizes for Material buttons
                                    alignment: Alignment.center,
                                    child: Text('Submit',
                                        style: TextStyle(
                                            color: white,
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center)))),
                        onPressed: () async {
                          // debugPrint("Loding");

                          if (messageController.text.isEmpty ||
                              emailController.text.isEmpty) {
                            const snackBar =
                                SnackBar(content: Text('Empty Text !'));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          } else {
                            await Future.delayed(const Duration(seconds: 2));
                            Navigator.pop(context);
                          }
                        }),
                  ],
                ),
              ),
            ),
          ),
        ),
      ]),
    ));

// import 'package:flutter/material.dart';
// import 'package:tutor/api/api.dart';
// import 'package:tutor/models/contact_form_data.dart';
// import 'package:tutor/service/auth.dart';

// class ContactUsScreen extends StatefulWidget {
//   const ContactUsScreen({Key? key});

//   @override
//   _ContactUsScreenState createState() => _ContactUsScreenState();
// }

// class _ContactUsScreenState extends State<ContactUsScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final _nameController = TextEditingController();
//   final _emailController = TextEditingController();
//   final _messageController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Contact Us'),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 TextFormField(
//                   controller: _nameController,
//                   decoration: InputDecoration(
//                     labelText: 'Name',
//                   ),
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'Please enter your name';
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(height: 16.0),
//                 TextFormField(
//                   controller: _emailController,
//                   keyboardType: TextInputType.emailAddress,
//                   decoration: InputDecoration(
//                     labelText: 'Email',
//                   ),
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'Please enter your email';
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(height: 16.0),
//                 TextFormField(
//                   controller: _messageController,
//                   maxLines: 5,
//                   decoration: InputDecoration(
//                     labelText: 'Message',
//                   ),
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'Please enter your message';
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(height: 16.0),
//                 ElevatedButton(
//                   onPressed: () async {
//                     if (_formKey.currentState!.validate()) {
//                       final token = await AuthService.getToken();
//                       final formData = ContactFormData(
//                         name: _nameController.text,
//                         email: _emailController.text,
//                         message: _messageController.text,
//                       );
//                       final result = await Api.submitContactForm(formData, token!);
//                       if (result['success']) {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(
//                             content: Text('Form submitted successfully'),
//                           ),
//                         );
//                         Navigator.pop(context);
//                       } else {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(
//                             content: Text(result['message'] ?? 'An error occurred'),
//                           ),
//                         );
//                       }
//                     }
//                   },
//                   child: Text('Submit'),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
    // );
  // }
// }
  }
}
