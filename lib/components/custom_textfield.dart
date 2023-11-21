import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utills/sterna_constants.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController? controller;
  final Function(String?)? onChanged;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? formatters;
  final int? maxLength;
  final bool? isReadOnly;
  final bool? isAutoFocus;
  final Function()? onTap;

  const CustomTextField(
      {Key? key,
        required this.hintText,
        this.isAutoFocus,
        this.controller,
        this.formatters,
        this.onChanged,
        this.keyboardType,
        this.maxLength,
        this.onTap,
        this.isReadOnly})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final FocusNode _focusNode = FocusNode();
  bool hasFocus = false;

  @override
  void initState() {
    _focusNode.addListener(() {
      setState(() {
        hasFocus = _focusNode.hasFocus;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: _focusNode,
      autofocus: widget.isAutoFocus ?? false,
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      inputFormatters: widget.formatters,
      onTap: widget.onTap,
      style: (widget.keyboardType == TextInputType.number)
          ? const TextStyle(fontSize: 18, letterSpacing: 1.6, fontWeight: FontWeight.w500, height: 1)
          : const TextStyle(fontSize: 18, letterSpacing: 0, fontWeight: FontWeight.w500, height: 1.5),
      maxLength: widget.maxLength,
      readOnly: widget.isReadOnly ?? false,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
          labelText: widget.hintText,
          filled: true,
          fillColor: hasFocus ? SternaConstants.primary50 : Colors.grey.shade50,
          isDense: true,
          floatingLabelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color:  hasFocus ? SternaConstants.primary : SternaConstants.secondaryTextColor),
          labelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w300, color: Colors.grey.shade500),
          counterText: "",
          enabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: hasFocus ? SternaConstants.primary100 : Colors.grey.shade100, width: 2),
          ),
          focusedBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: hasFocus ? SternaConstants.primary100 : Colors.grey.shade100, width: 2),
          )
      ),
    );
  }
}
