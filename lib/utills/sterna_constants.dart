import 'dart:ui';

class SternaConstants{
  static Color primary = const Color(0xFF0f3cc9);
  static double? buttonWidth;

  static void setPrimaryColor(Color color){
    primary = color;
  }

  static void setButtonWidth(double? value){
    buttonWidth = value;
  }
}