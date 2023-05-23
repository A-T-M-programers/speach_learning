import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_view/photo_view.dart';
import 'package:speach_learning/Presentation/Profile/controler/ProfileBloc.dart';
import 'package:speach_learning/Presentation/Profile/controler/ProfileState.dart';
import 'package:speach_learning/core/utils/enums.dart';

// ignore: camel_case_types
class show_photo extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  show_photo();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Colors.transparent,
        body: BlocBuilder<ProfileBloc, ParticipantState>(
            builder: (context, state) {
          switch (state.requestState) {
            case RequestState.loading:
              return CircularProgressIndicator(
                color: Theme.of(context).textTheme.headline2!.color,
              );
            case RequestState.loaded:
              if(state.participants != null) {
                if (state.participants!.imageParticipant.linkImage != "") {
                  switch (state.participants!.imageParticipant.stateImage) {
                    case StateImage.local:
                      return PhotoView(
                          imageProvider: FileImage(
                              File(state.participants!.imageParticipant.linkImage)));
                    case StateImage.remote:
                      return PhotoView(
                          imageProvider:
                          NetworkImage(state.participants!.imageParticipant.linkImage));
                  }
                } else {
                  return Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: Colors.white, width: 3),
                      ),
                      child: Icon(
                        Icons.person_sharp,
                        size: 90,
                        color: Theme
                            .of(context)
                            .shadowColor,
                      ));
                }
              }else{
                return Scaffold(
                  appBar: AppBar(
                    backgroundColor: Colors.transparent,
                  ),
                  backgroundColor: Colors.transparent,
                  body: PhotoView(imageProvider: const AssetImage("assets/SplashScreen/SplashScreen.png")),
                );
              }
            case RequestState.error:
              return Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                ),
                backgroundColor: Colors.transparent,
                body: PhotoView(imageProvider: const AssetImage("assets/SplashScreen/SplashScreen.png")),
              );
          }
        }));
  }
}
