import 'package:flutter/material.dart';


const Color white  = Color(0xFFFFFFFF);
const Color background  = Color(0xFFF1F5F7);
const Color btnColor  = Color(0xFF2A9CB5);
const Color formColor  = Color(0xFFd7e2f9);
const Color caption  = Color(0xFF3c5575);
const Color failed  = Color(0xFFf15a24);
const Color completed  = Color(0xFF79C063);
const Color kDark  = Color(0xFF333333);
const Color formText1  = Color(0xFFb1b5c4); // profile and appointment
const Color kCheckbox  = Color(0xFFE6E6E6);
const Color lightText  = Color(0xFFB3B3B3);
const Color darkText  = Color(0xFF808080);
const Color nearBlack  = Color(0xFF4D4D4D);
const Color transactionText  = Color(0xFF3C5575);
const Color transactionText2  = Color(0xFF889CB5);
const Color kTransparent  = Colors.transparent;

class ThemeClass {

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: background,

    appBarTheme: const AppBarTheme(
      backgroundColor: background,

    )
  );

}