import 'package:flutter/material.dart';
import 'package:adobe_xd/blend_mask.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/blocSplashScreen.dart';

// ignore: camel_case_types, must_be_immutable
class Button_Draage {
  int? icons;

  Button_Draage({this.icons});

  Widget build() {
    return Center(child: Stack(
      children: <Widget>[
        BlendMask(
          blendMode: BlendMode.overlay,
          child: BlocBuilder<blocSplashScreen, dynamic>(builder: (context, size) {
            return Container(
              height: size,
              width: size,
              // ignore: prefer_const_constructors
              child: icons == 0
                  // ignore: prefer_const_constructors
                  ? Icon(Icons.keyboard_arrow_right_rounded)
                  // ignore: prefer_const_constructors
                  : Icon(Icons.keyboard_arrow_left_rounded),
              decoration: BoxDecoration(
                color: const Color(0xff756329),
                borderRadius:
                    const BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                border: Border.all(width: 1.0, color: const Color(0xff554616)),
              ),
            );
          }),
        ),
      ],
    ));
  }
}
