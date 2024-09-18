import 'package:flutter/material.dart';

class TextFieldCustomPrimary extends StatefulWidget {
  final TextEditingController fieldController;
  final String fieldLabel;
  final bool isObscureText;
  const TextFieldCustomPrimary(
      {super.key,
      required this.fieldLabel,
      required this.fieldController,
      required this.isObscureText});

  @override
  State<TextFieldCustomPrimary> createState() => _TextFieldCustomPrimaryState();
}

class _TextFieldCustomPrimaryState extends State<TextFieldCustomPrimary> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.fieldController,
      obscureText: widget.isObscureText,
      decoration: InputDecoration(
          hintText: widget.fieldLabel,
          filled: true,
          fillColor: Color(0xffE7E1E1),
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    );
  }
}
