import 'package:flutter/material.dart';
import 'package:ui_login/main.dart';


Color bgColor = HexColor.fromHex('1F1D36');

class MyThemes {
  static final dartTheme =ThemeData(
      scaffoldBackgroundColor: bgColor,
      appBarTheme: AppBarTheme(
          backgroundColor: bgColor,
        elevation: 0,
        toolbarHeight: 40,
      ),
      colorScheme: const ColorScheme.dark(),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
              backgroundColor: Colors.tealAccent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)
              )

          )
      ),
      textTheme:  const TextTheme(
          button: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.bold
          ),
          headline1: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,

          ),
          subtitle1: TextStyle(
            color: Colors.white54,

            fontSize: 17,

          )
      )
  );


  static final lightTheme =ThemeData(
    colorScheme: const ColorScheme.light(),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 40,


      ),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
              backgroundColor: Colors.teal,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)
              )

          )
      ),
      textTheme:   TextTheme(
          button: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold
          ),
          headline1: const TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.bold,

          ),
          subtitle1: TextStyle(
            color: Colors.grey.shade800,

            fontSize: 17,

          )
      )
  );
}

class ThemeProvider extends ChangeNotifier
{
 ThemeMode themeMode = ThemeMode.dark;

 bool get isDarkMode => themeMode==ThemeMode.dark;

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}