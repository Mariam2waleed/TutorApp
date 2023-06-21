import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:tutor/main.dart';

class ThemeSwitcher extends StatefulWidget {
  const ThemeSwitcher({Key? key}) : super(key: key);

  @override
  ThemeSwitcherState createState() => ThemeSwitcherState();
}

class ThemeSwitcherState extends State<ThemeSwitcher> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: isDarkMode,
      onChanged: (value) {
        setState(() {
          isDarkMode = value;
          print(isDarkMode);
        });
        final provider =
            Provider.of<ThemeProvider>(context, listen: false);
        provider.setThemeMode(isDarkMode ? ThemeMode.dark : ThemeMode.light);
      },
    );
  }
}
class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = ThemeData.light();
  ThemeData _darkThemeData = ThemeData.dark();
  ThemeMode _themeMode = ThemeMode.light;

  ThemeData get themeData => _themeData;
  ThemeData get darkThemeData => _darkThemeData;

  ThemeMode get themeMode => _themeMode;

  setThemeMode(ThemeMode mode) {
    _themeMode = mode;
    notifyListeners();
  }

  setThemeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  setDarkThemeData(ThemeData darkThemeData) {
    _darkThemeData = darkThemeData;
    notifyListeners();
  }
}

// void main() {
//   runApp(
//     ChangeNotifierProvider(
//       create: (context) => ThemeProvider(),
//       child: MyApp(),
//     ),
//   );
// }