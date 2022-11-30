import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:adobe_xd/blend_mask.dart';

class Component21 extends StatelessWidget {
  Component21({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(),
        BlendMask(
          blendMode: BlendMode.overlay,
          child: Container(
            height: 40,
            width: 40,
            child: Icon(Icons.keyboard_arrow_right_rounded),
            decoration: BoxDecoration(
              color: const Color(0xff756329),
              borderRadius: BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
              border: Border.all(width: 1.0, color: const Color(0xff554616)),
            ),
          ),
        ),
      ],
    );
  }
}
