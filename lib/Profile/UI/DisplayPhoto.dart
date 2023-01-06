import 'dart:io';

import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

// ignore: camel_case_types
class show_photo extends StatefulWidget {
  final String path, type;

  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  show_photo({required this.path, required this.type});

  @override
  show_photo_state createState() => show_photo_state();

}

// ignore: camel_case_types
class show_photo_state extends State<show_photo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.transparent,
      body: Container(
        child: (widget.type == "N") ?
        PhotoView(imageProvider: NetworkImage(widget.path)) :
        (widget.type == "D") ?
        PhotoView(imageProvider: FileImage(File(widget.path)),) :
        // ignore: prefer_const_constructors
        PhotoView(imageProvider: AssetImage("assets/SplashScreen/SplashScreen.png")
        )
        ,
      )
      ,
    );
  }
}