import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utilits {
  static toastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 15,
      toastLength: Toast.LENGTH_SHORT,
      //gravity: ToastGravity.TOP
    );
  }

  static void flushbarErrorMessage(String message, context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          message: message,
          backgroundColor: Colors.red,
          // title: 'Problem',
          // messageColor: Colors.white,
          flushbarPosition: FlushbarPosition.BOTTOM,
          forwardAnimationCurve: Curves.easeIn,
          reverseAnimationCurve: Curves.easeInOut,
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          padding: EdgeInsets.all(15),
          borderRadius: BorderRadius.circular(20),
          positionOffset: 20,
          icon: Icon(
            Icons.error_outline,
            size: 28,
            color: Colors.white,
          ),
          duration: const Duration(seconds: 5),
        )..show(context));
  }

  static snackBarMessage(String message, context) {
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(backgroundColor: Colors.red, content: Text(message)));
  }

  static void fieldFocusChange(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static void flushbarSuccessfullMessage(String message, context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          message: message,
          backgroundColor: Colors.green,
          // title: 'Problem',
          // messageColor: Colors.white,
          flushbarPosition: FlushbarPosition.BOTTOM,
          forwardAnimationCurve: Curves.easeIn,
          reverseAnimationCurve: Curves.easeInOut,
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          padding: EdgeInsets.all(15),
          borderRadius: BorderRadius.circular(20),
          positionOffset: 20,
          icon: Icon(
            Icons.done_outline,
            size: 28,
            color: Colors.white,
          ),
          duration: const Duration(seconds: 5),
        )..show(context));
  }
}
