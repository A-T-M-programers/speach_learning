import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speach_learning/Presentation/Profile/UI/profile_page.dart';
import 'package:speach_learning/Presentation/Profile/controler/ProfileBloc.dart';
import 'package:speach_learning/Presentation/Profile/controler/ProfileEvent.dart';
import 'package:speach_learning/core/route_file.dart';
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
    return GestureDetector(
        onTap: () {
          try {
            switch (bottomSheetOption) {
              case BottomSheetOption.profile:
                context.read<ProfileParticipantBloc>().add(GetParticipantEvent(id: id, key: RoutePage.profilePage));
                Navigator.push(context, MaterialPageRoute(builder: (route) =>  const profile_page()));
                break;
              case BottomSheetOption.empty:
                break;
            }
          } catch (e, s) {
            // ignore: avoid_print
            print(s);
          }
        },
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(assetImage))),
          child: null,
        ));
  }
}
