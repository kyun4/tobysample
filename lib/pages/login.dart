import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:tobysestatephnew/components/buttonCustomPrimary.dart';
import 'package:tobysestatephnew/components/textFieldCustomPrimary.dart';
import 'package:tobysestatephnew/pages/signup.dart';
import 'package:tobysestatephnew/services/authGate.dart';
import 'package:tobysestatephnew/services/authServices.dart';

class Login extends StatefulWidget {
  final void Function()? onTap;

  const Login({super.key, required this.onTap});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailUsernameController = new TextEditingController();
  final passwordController = new TextEditingController();

  void signIn() async {
    final _authService = Provider.of<AuthServices>(context, listen: false);

    try {
      await _authService.signInWithEmailAndPassword(
          emailUsernameController.text, passwordController.text);
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  } // signIn()

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(children: [
      Container(
          height: 100,
          margin: const EdgeInsets.all(40),
          child: Image.asset('assets/images/tobyslogo1.png')),
      Container(
          margin: const EdgeInsets.only(left: 20, right: 20, bottom: 5),
          child: TextFieldCustomPrimary(
            fieldController: emailUsernameController,
            fieldLabel: 'Email/Username',
            isObscureText: false,
          )),
      Container(
          margin: const EdgeInsets.only(left: 20, right: 20, bottom: 5),
          child: TextFieldCustomPrimary(
            fieldController: passwordController,
            fieldLabel: 'Password',
            isObscureText: true,
          )),
      GestureDetector(
        onTap: signIn,
        child: Container(
            height: 65,
            child: ButtonCustomPrimary(
              buttonText: 'Submit',
            )),
      ),
      Container(
          child: Container(
              margin: const EdgeInsets.all(10),
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Not yet registered? '),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text('Sign Up ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    Text('here')
                  ])))
    ])));
  }
}
