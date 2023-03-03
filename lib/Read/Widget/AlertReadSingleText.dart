import 'package:flutter/material.dart';

class AlertDialogShowSingleText {
  static showAlertDialogSingleText(BuildContext context,String text) {
    // ignore: prefer_const_constructors
    AlertDialog alert = AlertDialog(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          Center(
              // ignore: avoid_unnecessary_containers
              child:Container(
                // ignore: prefer_const_literals_to_create_immutables
                child: Center(child: Column(children: [
                  Text(text),
                  const Text(""),
                  Row(children: const [Icon(Icons.spatial_audio_rounded)],)
                ],),),
              ))
        ]);
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}