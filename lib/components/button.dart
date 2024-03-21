import 'dart:async';

import 'package:flutter/material.dart';
import '../utills/sterna_constants.dart';

enum ButtonType {
  filled,
  outlined,
  rounded,
}

class Button extends StatefulWidget {
  final String text;
  final Function() onPressed;
  final Color? color;
  final Color? textColor;
  final ButtonType type;
  final IconData? icon;
  final double? height;
  final double? width;

  const Button(
      {Key? key,
        required this.text,
        required this.onPressed,
        this.color,
        this.textColor,
        this.type = ButtonType.filled,
        this.height,
        this.width,
        this.icon}) : super(key: key);

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  Timer? _debounce;

  void _onPressed() {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 200), widget.onPressed);
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isFilled = (widget.type == ButtonType.filled);
    bool isRounded = (widget.type == ButtonType.rounded);
    return (isFilled) ? MaterialButton(
      onPressed: widget.onPressed,
      height: widget.height ?? 50,
      elevation: 0.5,
      minWidth: widget.width ?? double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      disabledColor: Colors.grey.shade300,
      color: widget.color ?? SternaConstants.primary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular((isRounded) ? 30 : 8)),
      child: Text(widget.text.toUpperCase(), style: TextStyle(color: widget.textColor ?? Colors.white, fontWeight: FontWeight.w600, fontSize: 15),),
    ) : MaterialButton(
      onPressed: _onPressed,
      height: 42,
      elevation: 0,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      disabledColor: Colors.grey.shade300,
      color: null,
      shape:RoundedRectangleBorder(
          borderRadius: BorderRadius.circular((isRounded) ? 30 : 8),
          side: BorderSide(color: widget.color ?? SternaConstants.buttonColor,)
      ),
      child: Text(widget.text.toUpperCase(), style: TextStyle(color: widget.color ?? SternaConstants.buttonColor, fontWeight: FontWeight.w600, fontSize: 15),),
    );
  }
}