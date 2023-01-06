


import 'dart:math';

import 'package:flutter/material.dart';
import 'package:simple_animations/animation_builder/custom_animation_builder.dart';
import 'package:simple_animations/movie_tween/movie_tween.dart';

enum _CustomSwitchParams { paddingLeft, color, text, rotation }

class SimpleSwitchCustome extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  SimpleSwitchCustome({Key? key,required this.toggle}) : super(key: key);
  final bool toggle;

  @override
  State<SimpleSwitchCustome> createState() => _SimpleSwitchCustomeState();
}

class _SimpleSwitchCustomeState extends State<SimpleSwitchCustome> {

  var customTween = MovieTween()
    ..scene(duration: const Duration(milliseconds: 500))
        .tween(_CustomSwitchParams.paddingLeft, Tween(begin: 0.0,end: 35.0))
    ..scene(duration: const Duration(seconds: 1))
        .tween(_CustomSwitchParams.color, ColorTween(begin: Colors.red,end: Colors.green))
    ..scene(duration: const Duration(milliseconds: 500))
        .tween(_CustomSwitchParams.text, ConstantTween('OFF'))
        .thenTween(_CustomSwitchParams.text, ConstantTween('ON'),
        duration: const Duration(milliseconds: 500))
    ..scene(duration: const Duration(milliseconds: 500))
        .tween(_CustomSwitchParams.rotation, Tween(begin:(-2 * pi),end:0.0));



@override
Widget build(BuildContext context) {
  return CustomAnimationBuilder<Movie>(
    // control of the animation
    control: widget.toggle ? Control.play : Control.playReverse,
    // the relative position where animation will start
    startPosition: widget.toggle ? 1.0 : 0.0,
    // define unique key
    key: const Key('0'),
    duration: customTween.duration * 1.2,
    // movie tween object
    tween: customTween,
    curve: Curves.easeInOut,
    builder: (context, value, child) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(color: value.get(_CustomSwitchParams.color))),
        width: 70.0,
        height: 30.0,
        padding: const EdgeInsets.all(2.0),
        child: Stack(
          children: [
            Positioned(
              child: Padding(
                padding: EdgeInsets.only(
                  left: value.get(_CustomSwitchParams.paddingLeft),
                ),
                child: Transform.rotate(
                  angle: value.get(_CustomSwitchParams.rotation),
                  child: Container(
                    decoration: BoxDecoration(
                      color: value.get(_CustomSwitchParams.color),
                      shape: BoxShape.circle
                    ),
                    width: 30.0,
                    child: Center(
                      child: Text(
                        value.get(_CustomSwitchParams.text),
                        style: const TextStyle(
                            height: 1.5,
                            fontSize: 8,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
}