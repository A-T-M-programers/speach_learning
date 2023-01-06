import 'package:flutter/material.dart';

class AlertDialogShow{
  static showAlertDialog(BuildContext context){
    // ignore: prefer_const_constructors
    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      actions:const [
        Center(
            child: CircularProgressIndicator(
      color: Colors.white,
    ))]);
    showDialog(
      barrierDismissible: false,
      context:context,
      builder:(BuildContext context){
        return alert;
      },
    );
  }
}