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
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool showClear = false;
  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: widget.isAutoFocus ?? false,
      focusNode: focusNode,
      cursorColor: Colors.grey.shade400,
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      inputFormatters: widget.formatters,
      style: (widget.keyboardType == TextInputType.number)
          ? const TextStyle(fontSize: 18, letterSpacing: 1.6, fontWeight: FontWeight.w500, height: 1)
          : const TextStyle(fontSize: 16, letterSpacing: 0, fontWeight: FontWeight.w500, height: 1),
      maxLength: widget.maxLength,
      readOnly: widget.isReadOnly ?? false,
      onChanged: (val) {
        if (val.isEmpty) {
          showClear = false;
        } else {
          showClear = true;
        }
        if(widget.onChanged != null)widget.onChanged!(val);
        setState(() {});
      },
      onTap: () {
        setState(() {
          FocusScope.of(context).requestFocus(focusNode);
        });
      },
      decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(fontSize: 14, letterSpacing: 0.5, fontWeight: FontWeight.w300, color: Colors.grey.shade500),
          counterText: "",
          suffixIcon: (focusNode.hasFocus && showClear) ? IconButton(
                  onPressed: () {
                    widget.controller?.clear();
                    showClear = false;
                    setState(() {});
                  },
                  icon: Icon(Icons.cancel, color: SternaConstants.primary, size: 20,)
          ) : null,
          filled: true,
          fillColor: Colors.grey.shade200,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.shade100)
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.shade100)
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20)),
    );
  }
}
