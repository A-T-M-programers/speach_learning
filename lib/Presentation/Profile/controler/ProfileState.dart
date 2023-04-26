import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:speach_learning/Domain/Entity/Participants.dart';
import 'package:speach_learning/core/global/themeApp/ThemeApp.dart';
import 'package:speach_learning/core/utils/enums.dart';

class ParticipantState extends Equatable {
  final ThemeData? themeData;
  final Participants? participants;
  final RequestState requestState;
  final String message;
  final double volume;
  final String key;

  const ParticipantState(
      {this.themeData ,
      this.participants,
        this.volume = 0.5,
        this.key = "",
      this.requestState = RequestState.loading,
      this.message = ''});

  ParticipantState cobyWith({
    ThemeData? themeData,
    Participants? participants,
    ThemeApp? themeApp,
    double? volume,
    int? lang,
    ImageParticipant? imageParticipant,
    RequestState? requestState,
    String? message,
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
    }
    if(lang != null){
      this.participants!.setLang(lang);
      if(participants != null){
        participants.setLang(lang);
      }else{
        participants = this.participants;
      }
    }
    if(imageParticipant != null){
      this.participants!.setImageParticipant(imageParticipant);
      if(participants != null){
        participants.setImageParticipant(imageParticipant);
      }else {
        participants = this.participants;
      }
    }
    print(lang);
    print(participants);
    print(this.participants);
    return ParticipantState(
        themeData: themeData ?? this.themeData,
        participants: participants ?? this.participants,
        requestState: requestState ?? this.requestState,
        volume: volume ?? this.volume,
        message: message ?? this.message,
    key: key ?? this.key,
    );
  }

  @override
  List<Object> get props =>
      [themeData ?? kLightTheme, participants ?? Participants.empty(), volume , requestState, message,key];
}
