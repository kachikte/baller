import 'package:flutter/material.dart';

class AppHelperFunctions {

  static bool emailValidator({required String email}) {
    final bool isValidEmail =
    RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    return isValidEmail;
  }

  static bool nameValidator({required String name}) {
    final bool isValidName = name.length > 0;
    return isValidName;
  }

  static bool passwordValidator({required String password}) {
    final bool isValidPassword =
    RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)").hasMatch(password);
    return isValidPassword;
  }

  static showSnackBar({required BuildContext context, required String text, required double height, required backgroundColor}) {
    final snackBar = SnackBar(content: Text(text), backgroundColor: backgroundColor, behavior: SnackBarBehavior.floating, margin: EdgeInsets.only(bottom: height * .9, right: 10, left: 10),);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

}