import 'package:flutter/material.dart';
import 'package:speach_learning/core/utils/enums.dart';

class ButtonBottomSheet extends StatelessWidget {
  const ButtonBottomSheet(
      {Key? key,
      required this.assetImage,
      required this.bottomSheetOption,
      required this.id})
      : super(key: key);
  final String assetImage;
  final BottomSheetOption bottomSheetOption;
  final int id;

  @override
  Widget build(BuildContext context) {
    return Container(
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(assetImage))),
          child: null,
        );
  }
}
