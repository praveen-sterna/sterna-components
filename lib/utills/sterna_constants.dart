import 'package:flutter/material.dart';

class SternaConstants{
  static Color primary = Colors.blue;
  static Color primary50 = Colors.blue.shade50;
  static Color primary100 = Colors.blue.shade100;
  static Color bgColor = Colors.white;
  static Color appBarColor = Colors.blue;
  static Color appBarIconColor = Colors.white;
  static Color buttonColor = Colors.blue;
  static Color primaryTextColor = const Color(0xFF17202A);
  static Color secondaryTextColor = const Color(0xFF566573);

  static void setColors({
    required Color primaryValue,
    required Color primary50Value,
    required Color primary100Value,
    required Color bgColorValue,
    required Color appBarColorValue,
    required Color appBarIconColorValue,
    required Color buttonColorValue,
    required Color primaryTextColorValue,
    required Color secondaryTextColorValue,
}){
    primary = primaryValue;
    primary50 = primary50Value;
    primary100 = primary100Value;
    bgColor = bgColorValue;
    appBarColor = appBarColorValue;
    appBarIconColor = appBarIconColorValue;
    buttonColor = buttonColorValue;
    primaryTextColor = primaryTextColorValue;
    secondaryTextColor = secondaryTextColorValue;
  }
}