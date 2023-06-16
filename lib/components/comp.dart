import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// import '../pages/Classwork.dart';
// import '../pages/Home.dart';
// import '../pages/Inbox.dart';
// import '../pages/Schedule.dart';

enum Role { student, teacher, admin }

// Color basecolor = Color(#691CC1);
Color basecolor = const Color(0xFF691CC1);
LinearGradient basecolorL = LinearGradient(colors: [basecolor, basecolor3]);
Gradient basecolorG = LinearGradient(colors: [basecolor, basecolor3]);
// Color basecolor3 = Colors.red;
Color basecolor3 = const Color(0xFFB48EE0);
Color black = Colors.black;
Color white = Colors.white;
//Color course_color = Color.fromARGB(255, 36, 212, 20);

// FontWeight wbold = FontWeight.bold;
// FontWeight wnoral = FontWeight.normal;
// padding(h, v) => EdgeInsets.symmetric(horizontal: h, vertical: v);
// styler(c, s, w) => TextStyle(color: c, fontSize: s, fontWeight: w);

Widget CheckBoxX(label, controller, {trigger}) {
  return StatefulBuilder(builder: ((context, setState) {
    return GestureDetector(
        onTap: () {
          setState(() => controller = !controller);
        },
        child: Row(
          children: [
            Checkbox(
              value: controller,
              onChanged: (newVal) {
                setState(() => controller = newVal);
              },
            ),
            Text(label),
          ],
        ));
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
        labelStyle: const TextStyle(fontWeight: FontWeight.bold),
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
        labelStyle: const TextStyle(fontWeight: FontWeight.bold),
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

Widget LoadButton({idle_txt = "", load_txt = "", action, args = const []}) {
  bool loading = false;
  bool disabled = false;
  return StatefulBuilder(
    builder: (context, setState) {
      Future<void> makeAction() async {
        if (loading) return;
        setState(() => loading = true);
        if (args.isEmpty) {
          await action();
        } else if (args.length == 1)
          await action(args[0]);
        else if (args.length == 2) await action(args[0], args[1]);
        setState(() => loading = false);
      }

      return Ink(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.deepPurple,
                  Color.fromARGB(255, 188, 112, 207)
                ]),
            borderRadius: BorderRadius.all(Radius.circular(70.0))),
        child: MaterialButton(
          minWidth: double.infinity,
          height: 60.0,
          onPressed: (disabled) ? null : makeAction,
          disabledTextColor: white,
          // shape: RoundedRectangleBorder(
              // side: BorderSide(width: 2, color: (bcolor == white) ? fcolor : bcolor),
              // borderRadius: BorderRadius.circular(20)),
          // padding: const EdgeInsets.all(0.0),
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
                  style: TextStyle(
                      color: white, fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            Expanded(
              flex: 2,
              child: Container(),
            ),
          ]),
        ),
      );
    },
  );
}

Widget baseButton(
    {idle_txt = "", color = Colors.grey, action, args = const []}) {
  bool disabled = false;
  return StatefulBuilder(builder: (context, setState) {
    Future<void> makeAction() async {
      if (args.isEmpty) {
        await action();
      } else if (args.length == 1)
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
                    return const SizedBox(
                      height: 5.0,
                    );
                  })()),
              Expanded(
                  flex: 8,
                  child: Text(idle_txt,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold))),
              Expanded(
                flex: 2,
                child: Container(),
              ),
            ])));
  });
}

//////////////////////////////// Online ////////////////////////////////////

class CustomButton extends StatelessWidget {
  String text = 'click';
  final VoidCallback? onTap;
  bool fill;
  double? height, width;
  final Color? color;
  EdgeInsetsGeometry? margin;
  EdgeInsetsGeometry? padding;
  CustomButton(
      {Key? key,
      required this.text,
      required this.onTap,
      this.fill = true,
      this.height,
      this.color,
      this.width,
      this.padding,
      this.margin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: padding,
        height: height ?? 50,
        width: width,
        margin: margin ?? const EdgeInsets.only(top: 10, right: 50, left: 50),
        decoration: BoxDecoration(
            // gradient: LinearGradient(colors: [
            //   GlobalVariables.base,
            //   GlobalVariables.base,
            //   Colors.white
            // ]),
            borderRadius: BorderRadius.circular(10),
            color: color ?? basecolor),
        //width: MediaQuery.of(context).size.width / 1.5,
        child: InkWell(
          onTap: onTap,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                  color: fill ? Colors.white : Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ));
  }
}
