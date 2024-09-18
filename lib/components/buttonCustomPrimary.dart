import 'package:flutter/material.dart';

class ButtonCustomPrimary extends StatefulWidget {
  final String buttonText;

  const ButtonCustomPrimary({super.key, required this.buttonText});

  @override
  State<ButtonCustomPrimary> createState() => _ButtonCustomPrimaryState();
}

class _ButtonCustomPrimaryState extends State<ButtonCustomPrimary> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
          margin: EdgeInsets.only(left: 20, right: 20, top: 10),
          alignment: Alignment.center,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xff494547)),
          child: Text('Submit', style: TextStyle(color: Colors.white))),
    );
  }
}
