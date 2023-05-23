import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speach_learning/Presentation/Profile/controler/ProfileBloc.dart';
import 'package:speach_learning/Presentation/Profile/controler/ProfileState.dart';
import 'package:speach_learning/core/network/api_constance.dart';
import 'package:speach_learning/core/utils/enums.dart';

class ViewParticipantImage extends StatelessWidget {
  const ViewParticipantImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ParticipantState>(
        buildWhen: (previos,current) => previos.requestState != current.requestState,
        builder: (context, state) {
      switch (state.requestState) {
        case RequestState.loading:
          return getErrorImageWidget(context);
        case RequestState.loaded:
          if(state.participants != null) {
            if (state.participants!.imageParticipant.linkImage != "") {
              switch (state.participants!.imageParticipant.stateImage) {
                case StateImage.local:
                  return Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Colors.white, width: 3),
                          image: DecorationImage(
                              image: FileImage(
                                  File(state.participants!.imageParticipant.linkImage))
                          )
                      ));
                case StateImage.remote:
                  CachedNetworkImage.evictFromCache(state.participants!.imageParticipant.linkImage);
                  return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: Colors.white, width: 3),
                      ),
                      child: CachedNetworkImage(

                        httpHeaders: {"Authorization":"Bearer "+ ApiConstance.token},
                        imageUrl: state.participants!.imageParticipant.linkImage,
                        imageBuilder: (context, imageProvider) {
                          return  Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Theme
                                          .of(context)
                                          .shadowColor, blurRadius: 10)
                                ],
                                borderRadius: BorderRadius.circular(50),
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.contain,
                                ),
                                border: Border.all(color: Colors.white,
                                    width: 3),
                              ),
                            );},
                        placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                          getErrorImageWidget(context),
                      ));
              }
            } else {
              return getErrorImageWidget(context);
            }
          }else{
            return getErrorImageWidget(context);
          }
        case RequestState.error:
          return getErrorImageWidget(context);
      }
    });
  }
  Widget getErrorImageWidget(BuildContext context){
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: Colors.white, width: 3),
        ),
        child: Icon(
          Icons.person_sharp,
          size: 90,
          color: Theme.of(context).textTheme.headline2!.color,
        ));
  }
}
