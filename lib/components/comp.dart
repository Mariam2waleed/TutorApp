import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../pages/Classwork.dart';
import '../pages/Home.dart';
import '../pages/Inbox.dart';
import '../pages/Schedule.dart';

// Color basecolor = Color(#691CC1);
Color basecolor = Color.fromARGB(226, 118, 5, 189);
LinearGradient basecolorL = LinearGradient(colors: [basecolor,basecolor3]);
Gradient basecolorG = LinearGradient(colors: [basecolor,basecolor3]);
// Color basecolor3 = Colors.red;
Color basecolor3 = Color.fromARGB(242, 160, 62, 218);
Color black = Colors.black;
Color white = Colors.white;
//Color course_color = Color.fromARGB(255, 36, 212, 20);

// FontWeight wbold = FontWeight.bold;
// FontWeight wnoral = FontWeight.normal;
// padding(h, v) => EdgeInsets.symmetric(horizontal: h, vertical: v);
// styler(c, s, w) => TextStyle(color: c, fontSize: s, fontWeight: w);

Widget CheckBoxX(label, controller, {trigger = null}){
  return StatefulBuilder(builder: ((context, setState){
    return GestureDetector(
      onTap: (){
        setState(() => controller = !controller );
      },
      child: Row(
        children: [
          Checkbox(
            value: controller,
            onChanged: (new_val){
              setState(() => controller = new_val );
            },
          ),
          Text(label),
        ],
      )
    );
  }));
}

Widget InputField(controller, placeholder, {numbers = false}) {
  var border = OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.grey),
    borderRadius: BorderRadius.circular(15.0),
  );
  return TextField(
    textAlign: TextAlign.center,
    controller: controller,
    keyboardType: (numbers) ? TextInputType.number : TextInputType.text,
    inputFormatters: (numbers) ? [FilteringTextInputFormatter.digitsOnly] : [],
    decoration: InputDecoration(
        labelText: placeholder,
        labelStyle: TextStyle(fontWeight: FontWeight.bold),
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
        enabledBorder: border,
        focusedBorder: border,
        border: border),
  );
}

Widget PasswordField(controller, placeholder, {numbers = false}) {
  var border = OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.grey),
    borderRadius: BorderRadius.circular(15.0),
  );
  bool visible = false;
  return StatefulBuilder(builder: (context, setState) {
    return TextField(
      textAlign: TextAlign.center,
      controller: controller,
      obscureText: !visible,
      keyboardType: (numbers) ? TextInputType.number : TextInputType.text,
      inputFormatters:
          (numbers) ? [FilteringTextInputFormatter.digitsOnly] : [],
      decoration: InputDecoration(
        labelText: placeholder,
        labelStyle: TextStyle(fontWeight: FontWeight.bold),
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
        enabledBorder: border,
        focusedBorder: border,
        border: border,
        suffixIcon: IconButton(
          icon: Icon(
            visible ? Icons.visibility : Icons.visibility_off,
            color: black,
          ),
          onPressed: () {
            debugPrint(visible.toString());
            setState(() {
              visible = !visible;
            });
          },
        ),
      ),
    );
  });
}

Widget LoadButton({idle_txt = "", load_txt = "", action = null, args = const []}) {
  bool loading = false;
  bool disabled = false;
  return StatefulBuilder(builder: (context, setState) {
    Future<void> makeAction() async {
      if (loading) return;
      setState(() => loading = true);
      if (args.isEmpty)
        await action();
      else if (args.length == 1)
        await action(args[0]);
      else if (args.length == 2) await action(args[0], args[1]);
      setState(() => loading = false);
    }

    return MaterialButton(
        minWidth: double.infinity,
        height: 60.0,
        onPressed: (disabled) ? null : makeAction,
        color: Color.fromRGBO(67, 144, 84, 1),
        disabledColor: Colors.grey,
        disabledTextColor: white,
        shape: RoundedRectangleBorder(
          // side: BorderSide(width: 2, color: (bcolor == white) ? fcolor : bcolor),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
            color: (disabled) ? Colors.grey : Color.fromRGBO(67, 144, 84, 1),
            child: Row(children: <Widget>[
              Expanded(
                  flex: 2,
                  child: (() {
                    if (loading) {
                      return SizedBox(
                          height: 55.0,
                          child: SpinKitRing(color: white, lineWidth: 4));
                    } else {
                      return Container();
                    }
                  })()),
              Expanded(
                  flex: 8,
                  child: Text((loading) ? load_txt : idle_txt,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: white, fontSize: 20, fontWeight: FontWeight.bold))),
              Expanded(
                flex: 2,
                child: Container(),
              ),
            ])));
  });
}

Widget baseButton({idle_txt = "",color= Colors.grey, action = null, args = const []}) {
  bool disabled = false;
  return StatefulBuilder(builder: (context, setState) {
    Future<void> makeAction() async {
      if (args.isEmpty)
        await action();
      else if (args.length == 1)
        await action(args[0]);
      else if (args.length == 2) await action(args[0], args[1]);
    }

    return MaterialButton(
        minWidth: double.infinity,
        height: 60.0,
        onPressed: (disabled) ? null : makeAction,
        color: basecolor,
        disabledColor: Colors.grey,
        disabledTextColor: white,
        shape: RoundedRectangleBorder(
          // side: BorderSide(width: 2, color: (bcolor == white) ? fcolor : bcolor),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
            color: (disabled) ? Colors.grey : basecolor,
            child: Row(children: <Widget>[
              Expanded(
                  flex: 2,
                  child: (() {
                    return SizedBox(
                      height: 5.0,
                    );
                  })()),
              Expanded(
                  flex: 8,
                  child: Text(idle_txt,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: white, fontSize: 20, fontWeight: FontWeight.bold))),
              Expanded(
                flex: 2,
                child: Container(),
              ),
            ])));
  });
}
