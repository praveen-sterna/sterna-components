import 'dart:ui';
import 'package:flutter/material.dart';

class SternaConstants{
  static Color primary = const Color(0xFF0f3cc9);
  static Color bgColor = Colors.white;
  static Color appBarColor = const Color(0xFF0f3cc9);
  static Color appBarIconColor = Colors.white;
  static Color buttonColor = const Color(0xFF0f3cc9);
  static Color textFieldColor = Colors.white;
  static Color primaryTextColor = const Color(0xFF17202A);
  static Color secondaryTextColor = const Color(0xFF566573);

  static void setColors({
    required Color primaryValue,
    required Color bgColorValue,
    required Color appBarColorValue,
    required Color appBarIconColorValue,
    required Color buttonColorValue,
    required Color textFieldColorValue,
    required Color primaryTextColorValue,
    required Color secondaryTextColorValue,
}){
    primary = primaryValue;
    bgColor = bgColorValue;
    appBarColor = appBarColorValue;
    appBarIconColor = appBarIconColorValue;
    buttonColor = buttonColorValue;
    textFieldColor = textFieldColorValue;
    primaryTextColor = primaryTextColorValue;
    secondaryTextColor = secondaryTextColorValue;
  }
}