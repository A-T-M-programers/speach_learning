import 'dart:math';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_animations/animation_builder/custom_animation_builder.dart';
import 'package:simple_animations/movie_tween/movie_tween.dart';
import 'package:speach_learning/Presentation/Profile/controler/ProfileBloc.dart';
import 'package:speach_learning/Presentation/Profile/controler/ProfileEvent.dart';
import 'package:speach_learning/Presentation/Profile/controler/ProfileState.dart';
import 'package:speach_learning/core/utils/enums.dart';

enum _CustomSwitchParams { paddingLeft, color, text, rotation }

class SimpleSwitchCustome extends StatelessWidget {
  SimpleSwitchCustome({Key? key}) : super(key: key);

  final MovieTween customTween = MovieTween()
    ..scene(duration: const Duration(milliseconds: 500))
        .tween(_CustomSwitchParams.paddingLeft, Tween(begin: 0.0, end: 35.0))
    ..scene(duration: const Duration(seconds: 1)).tween(
        _CustomSwitchParams.color,
        ColorTween(begin: Colors.red, end: Colors.green))
    ..scene(duration: const Duration(milliseconds: 500))
        .tween(_CustomSwitchParams.text, ConstantTween('EN'))
        .thenTween(_CustomSwitchParams.text, ConstantTween('AR'),
            duration: const Duration(milliseconds: 500))
    ..scene(duration: const Duration(milliseconds: 500))
        .tween(_CustomSwitchParams.rotation, Tween(begin: (-2 * pi), end: 0.0));

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ParticipantState>(
        buildWhen: (previos, current) => previos.lang != current.lang || previos.requestState != current.requestState
          , builder: (context, state) {
      switch (state.requestState) {
        case RequestState.loading:
          return getWidget(false, 2, context);
        case RequestState.loaded:
          if (state.participants != null) {
            context.setLocale(Locale(state.lang == 2 ? "en" : "ar"));
            return getWidget(true, state.participants!.langApp, context, id: state.participants!.id);
          } else {
            return getWidget(false, 2, context);
          }
        case RequestState.error:
          return getWidget(false, 2, context);
      }
    });
  }

  Widget getWidget(bool checkLoaded, int langApp, BuildContext context, {int? id}) {
    return GestureDetector(
        onTap: () {
          if (checkLoaded) {
            if (langApp != 2) {
              //In English
              context.read<ProfileBloc>().add(SetLangParticipantEvent(id: id!, lang: 2));
            } else {
              //In Arabic
              context.read<ProfileBloc>().add(SetLangParticipantEvent(id: id!, lang: 1));
            }
          }
        },
        child: CustomAnimationBuilder<Movie>(
          // control of the animation
          control: langApp == 2 ? Control.playReverse : Control.play,
          // the relative position where animation will start
          startPosition: langApp == 2 ? 1.0 : 0.0,
          duration: customTween.duration * 1.2,
          // movie tween object
          tween: customTween,
          curve: Curves.easeInOut,
          builder: (context, value, child) {
            return Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  border:
                      Border.all(color: value.get(_CustomSwitchParams.color))),
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
                              shape: BoxShape.circle),
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
        ));
  }
}
