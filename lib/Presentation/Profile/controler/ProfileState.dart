
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:speach_learning/Domain/Entity/Participants.dart';
import 'package:speach_learning/core/error/failure.dart';
import 'package:speach_learning/core/global/themeApp/ThemeApp.dart';
import 'package:speach_learning/core/utils/enums.dart';

// class ProfileState extends Equatable{
//   final Participants? participants;
//   final RequestState requestState;
//   final String message;
//
//   const ProfileState(
//       {
//         this.participants,
//         this.requestState = RequestState.loading,
//         this.message = ""
//       });
//
//   ProfileState cobyWith({
//     Participants? participants,
//     RequestState? requestState,
//     String? message,
//   }) => ProfileState(
//     participants: participants?? this.participants,
//     requestState: requestState ?? this.requestState,
//     message: message ?? this.message
//   );
//
//   @override
//   List<Object> get props => [participants?? Participants.empty(), requestState, message];
// }
//
// class SetThemeAppProfileState extends ProfileState{
//   final ThemeData? themeData;
//   final ThemeApp themeApp;
//
//   const SetThemeAppProfileState(
//       {this.themeData,
//         this.themeApp = ThemeApp.light,
//         super.message = "",
//         super.requestState = RequestState.loading,
//         super.participants
//       });
//
//   @override
//   SetThemeAppProfileState cobyWith({
//     ThemeData? themeData,
//     ThemeApp? themeApp,
//     Participants? participants,
//     RequestState? requestState,
//     String? message,
//   }) => SetThemeAppProfileState(
//       themeData: themeData?? this.themeData,
//       themeApp: themeApp?? this.themeApp,
//       message: message?? this.message,
//     requestState: requestState?? this.requestState,
//     participants: participants?? this.participants
//   );
//
//   @override
//   List<Object> get props => [themeApp, themeData ?? kLightTheme, participants?? Participants.empty(), requestState, message];
// }
//
// class SetLangProfileState extends ProfileState{
//   final int lang;
//
//   const SetLangProfileState(
//       {this.lang = 1,
//         super.message = "",
//         super.requestState = RequestState.loading,
//         super.participants
//       });
//
//   @override
//   SetLangProfileState cobyWith({
//     int? lang,
//     Participants? participants,
//     RequestState? requestState,
//     String? message,
//   }) => SetLangProfileState(
//       lang: lang?? this.lang,
//       message: message?? this.message,
//       requestState: requestState?? this.requestState,
//       participants: participants?? this.participants
//   );
//
//   @override
//   List<Object> get props => [lang, participants?? Participants.empty(), requestState, message];
// }
//
// class SetPhotoProfileState extends ProfileState{
//   final ImageParticipant? imageParticipant;
//
//   const SetPhotoProfileState(
//       {this.imageParticipant,
//         super.message = "",
//         super.requestState = RequestState.loading,
//         super.participants
//       });
//
//   @override
//   SetPhotoProfileState cobyWith({
//     ImageParticipant? imageParticipant,
//     Participants? participants,
//     RequestState? requestState,
//     String? message,
//   }) => SetPhotoProfileState(
//       imageParticipant: imageParticipant?? this.imageParticipant,
//       message: message?? this.message,
//       requestState: requestState?? this.requestState,
//       participants: participants?? this.participants
//   );
//
//   @override
//   List<Object> get props => [imageParticipant ?? ImageParticipant.setImageParticipant(), participants?? Participants.empty(), requestState, message];
// }
//
// class SetVolumeProfileState extends Equatable{
//   final double volume;
//   final RequestState requestState;
//   final String message;
//
//   const SetVolumeProfileState({this.volume = 0.5,this.requestState = RequestState.loading,this.message = ""});
//
//   SetVolumeProfileState cobyWith({
//     double? volume,
//     RequestState? requestState,
//     String? message,
//   }) => SetVolumeProfileState(
//       volume: volume ?? this.volume,
//       message: message?? this.message,
//       requestState: requestState?? this.requestState,
//   );
//
//   @override
//   List<Object> get props => [volume, requestState, message];
// }

class ParticipantState extends Equatable {
  final ThemeData? themeData;
  final ThemeApp themeApp;
  final Participants? participants;
  final RequestState requestState;
  final ServerFailure error;
  final double volume;
  final ImageParticipant imageParticipant;
  final int lang;
  final int idParticipant;
  final String key;

  const ParticipantState(
      {this.themeData ,
        this.themeApp = ThemeApp.light,
      this.participants,
        this.volume = 0.5,
        this.lang = 2,
        this.idParticipant = 1,
        this.imageParticipant = const ImageParticipant(linkImage: "",stateImage: StateImage.local),
        this.key = "",
      this.requestState = RequestState.loading,
      this.error = const ServerFailure("", 400, DioErrorType.unknown)});

  ParticipantState cobyWith({
    ThemeData? themeData,
    Participants? participants,
    ThemeApp? themeApp,
    double? volume,
    int? lang,
    int? idParticipant,
    ImageParticipant? imageParticipant,
    RequestState? requestState,
    ServerFailure? error,
    String? key,
  }) {
    if(themeApp != null){
      this.participants!.setThemeApp(themeApp);
      themeData = themeApp == ThemeApp.light ? kLightTheme : kDarkTheme;
      if(participants != null){
        participants.setThemeApp(themeApp);
      }else{
        participants = this.participants;
      }
    }else{
      if(participants != null){
        themeApp = participants.themApp;
      }else if(this.participants != null){
        themeApp = this.participants!.themApp;
      }
    }
    if(lang != null){
      this.participants!.setLang(lang);
      if(participants != null){
        participants.setLang(lang);
      }else{
        participants = this.participants;
      }
    }else if(this.participants != null){
      if(participants != null){
        lang = participants.langApp;
      }else{
        lang = this.participants!.langApp;
      }
    }
    if(imageParticipant != null){
      this.participants!.setImageParticipant(imageParticipant);
      if(participants != null){
        participants.setImageParticipant(imageParticipant);
      }else {
        participants = this.participants;
      }
    }else if(this.participants != null){
      if(participants != null){
        imageParticipant = participants.imageParticipant;
      }else{
        imageParticipant = this.participants!.imageParticipant;
      }
    }
    return ParticipantState(
        themeData: themeData ?? this.themeData,
        themeApp: themeApp ?? this.themeApp,
        participants: participants ?? this.participants,
        requestState: requestState ?? this.requestState,
        volume: volume ?? this.volume,
        lang: lang ?? this.lang,
        idParticipant: idParticipant ?? this.idParticipant ,
        imageParticipant: imageParticipant ?? this.imageParticipant,
      error: error ?? this.error,
    key: key ?? this.key,
    );
  }

  @override
  List<Object> get props =>
      [themeData ?? kLightTheme, participants ?? Participants.empty(), volume, lang ,imageParticipant, themeApp, requestState, error,key,idParticipant];
}
