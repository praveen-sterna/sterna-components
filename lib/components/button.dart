import 'package:flutter/material.dart';
import '../utills/sterna_constants.dart';

enum ButtonType {
  filled,
  outlined,
}

class Button extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final Color? color;
  final Color? textColor;
  final ButtonType type;
  final IconData? icon;

  const Button(
      {Key? key,
        required this.text,
        required this.onPressed,
        this.color,
        this.textColor,
        this.type = ButtonType.filled,
        this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isFilled = (type == ButtonType.filled);
    return (isFilled) ? MaterialButton(
      onPressed: onPressed,
      height: SternaConstants.buttonHeight ?? 42,
      elevation: 0,
      minWidth: SternaConstants.buttonWidth,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      disabledColor: Colors.grey.shade300,
      color: color ?? SternaConstants.primary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Text(text, style: TextStyle(color: textColor ?? Colors.white, fontWeight: FontWeight.w600, fontSize: 15),),
    ) : MaterialButton(
      onPressed: onPressed,
      height: 42,
      elevation: 0,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      disabledColor: Colors.grey.shade300,
      color: null,
      shape:RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: BorderSide(color: color ?? SternaConstants.primary,)
      ),
      child: Text(text, style: TextStyle(color: color ?? SternaConstants.primary, fontWeight: FontWeight.w600, fontSize: 15),),
    );
  }
}

class FullWidthButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final Color? color;
  final Color? textColor;
  final ButtonType type;
  final IconData? icon;

  const FullWidthButton(
      {Key? key,
        required this.text,
        required this.onPressed,
        this.color,
        this.textColor,
        this.type = ButtonType.filled,
        this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isFilled = (type == ButtonType.filled);
    return (isFilled) ? MaterialButton(
      onPressed: onPressed,
      height: 50,
      elevation: 0,
      minWidth: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      disabledColor: Colors.grey.shade300,
      color: color ?? SternaConstants.primary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Text(text, style: TextStyle(color: textColor ?? Colors.white, fontWeight: FontWeight.w600, fontSize: 15),),
    ) : MaterialButton(
      onPressed: onPressed,
      height: 50,
      minWidth: double.infinity,
      elevation: 0,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      disabledColor: Colors.grey.shade300,
      color: null,
      shape:RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: BorderSide(color: color ?? SternaConstants.primary,)
      ),
      child: Text(text, style: TextStyle(color: color ?? SternaConstants.primary, fontWeight: FontWeight.w600, fontSize: 15),),
    );
  }
}