import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utills/sterna_constants.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final Function(String?)? onChanged;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? formatters;
  final int? maxLength;
  final bool? isReadOnly;
  final bool? isAutoFocus;

  const CustomTextField(
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
  Widget build(BuildContext context) {
    return TextField(
      autofocus: isAutoFocus ?? false,
      controller: controller,
      keyboardType: keyboardType,
      inputFormatters: formatters,
      style: (keyboardType == TextInputType.number)
          ? const TextStyle(fontSize: 18, letterSpacing: 1.6, fontWeight: FontWeight.w500, height: 1)
          : const TextStyle(fontSize: 16, letterSpacing: 0, fontWeight: FontWeight.w500, height: 1),
      maxLength: maxLength,
      readOnly: isReadOnly ?? false,
      onChanged: onChanged,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w300, color: Colors.grey.shade500),
          counterText: "",
          filled: true,
          fillColor: SternaConstants.textFieldColor,
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
