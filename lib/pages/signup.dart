import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tobysestatephnew/components/buttonCustomPrimary.dart';
import 'package:tobysestatephnew/components/textFieldCustomPrimary.dart';
import 'package:tobysestatephnew/services/authGate.dart';
import 'package:tobysestatephnew/services/authServices.dart';

class SignUp extends StatefulWidget {
  final void Function()? onTap;
  const SignUp({super.key, required this.onTap});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController usernameController = new TextEditingController();
  TextEditingController firstNameController = new TextEditingController();
  TextEditingController lastNameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController confirmPasswordController = new TextEditingController();

  void signUp() {
    final _authService = Provider.of<AuthServices>(context, listen: false);

    try {
      _authService.signUpWithEmailAndPassword(
          emailController.text,
          passwordController.text,
          firstNameController.text,
          lastNameController.text,
          phoneController.text);
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  } // signUp()

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(leading: Container(), title: Text(''), actions: []),
        body: SafeArea(
            child: Column(children: [
          Text('Register',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
          SizedBox(height: 15),
          Container(
              margin: const EdgeInsets.only(left: 20, right: 20, bottom: 5),
              child: TextFieldCustomPrimary(
                  fieldController: usernameController,
                  fieldLabel: 'Username',
                  isObscureText: false)),
          Container(
              margin: const EdgeInsets.only(left: 20, right: 20, bottom: 5),
              child: TextFieldCustomPrimary(
                  fieldController: firstNameController,
                  fieldLabel: 'First Name',
                  isObscureText: false)),
          Container(
              margin: const EdgeInsets.only(left: 20, right: 20, bottom: 5),
              child: TextFieldCustomPrimary(
                  fieldController: lastNameController,
                  fieldLabel: 'Last Name',
                  isObscureText: false)),
          Container(
              margin: const EdgeInsets.only(left: 20, right: 20, bottom: 5),
              child: TextFieldCustomPrimary(
                  fieldController: phoneController,
                  fieldLabel: 'Phone',
                  isObscureText: false)),
          Container(
              margin: const EdgeInsets.only(left: 20, right: 20, bottom: 5),
              child: TextFieldCustomPrimary(
                  fieldController: emailController,
                  fieldLabel: 'Email',
                  isObscureText: false)),
          Container(
              margin: const EdgeInsets.only(left: 20, right: 20, bottom: 5),
              child: TextFieldCustomPrimary(
                  fieldController: passwordController,
                  fieldLabel: 'Password',
                  isObscureText: true)),
          Container(
              margin: const EdgeInsets.only(left: 20, right: 20, bottom: 5),
              child: TextFieldCustomPrimary(
                  fieldController: confirmPasswordController,
                  fieldLabel: 'Confirm Password',
                  isObscureText: true)),
          GestureDetector(
            onTap: signUp,
            child: Container(
                height: 65, child: ButtonCustomPrimary(buttonText: 'Register')),
          ),
          SizedBox(height: 10),
          Container(
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                Text('Already registered? '),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text('Login ',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Text('here')
              ]))
        ])));
  }
}
