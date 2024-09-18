import 'package:flutter/material.dart';
import 'package:tobysestatephnew/pages/home.dart';
import 'package:tobysestatephnew/pages/login.dart';
import 'package:tobysestatephnew/pages/signup.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool showLoginPage = true;
  @override
  void toggleState() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  Widget build(BuildContext context) {
    if (showLoginPage) {
      return Login(onTap: toggleState);
    } else {
      return SignUp(onTap: toggleState);
    }
  }
}
