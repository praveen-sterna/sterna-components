import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utills/sterna_constants.dart';

class PasswordField extends StatefulWidget {
  final String hintText;
  final TextEditingController? controller;
  final Function(String?)? onChanged;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? formatters;
  final int? maxLength;
  final bool? isReadOnly;
  final bool? isAutoFocus;

  const PasswordField(
      {Key? key,
      required this.hintText,
      this.isAutoFocus,
      this.controller,
      this.formatters,
      this.onChanged,
      this.keyboardType,
      this.maxLength,
      this.isReadOnly})
      : super(key: key);

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool isHidePassword = true;

  void _changeHidePassword(){
    setState(() {
      isHidePassword = !isHidePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: widget.isAutoFocus ?? false,
      controller: widget.controller,
      obscureText: isHidePassword,
      keyboardType: widget.keyboardType,
      inputFormatters: widget.formatters,
      style: (widget.keyboardType == TextInputType.number)
          ? const TextStyle(fontSize: 18, letterSpacing: 1.6, fontWeight: FontWeight.w500, height: 1)
          : const TextStyle(fontSize: 16, letterSpacing: 0, fontWeight: FontWeight.w500, height: 1),
      maxLength: widget.maxLength,
      readOnly: widget.isReadOnly ?? false,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w300, color: Colors.grey.shade500),
          counterText: "",
          filled: true,
          fillColor: SternaConstants.textFieldColor,
          suffixIcon: IconButton(
            onPressed: (){
              _changeHidePassword();
            },
            icon: Icon(isHidePassword ? Icons.visibility_off_rounded : Icons.visibility_rounded, color: SternaConstants.primaryTextColor,size: 20,),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: SternaConstants.textFieldColor)
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: SternaConstants.textFieldColor)
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20)),
    );
  }
}
