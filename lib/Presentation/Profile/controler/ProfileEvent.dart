import 'package:speach_learning/Domain/Entity/Participants.dart';
import 'package:speach_learning/Presentation/Route/controler/route_page_bloc.dart';
import 'package:speach_learning/core/utils/enums.dart';

abstract class ProfileEvent extends RoutePageEvent{
  const ProfileEvent();

  @override
  List<Object> get props =>[];
}

class GetParticipantEvent extends ProfileEvent {
  final int id;
  final String key;

  const GetParticipantEvent({required this.id,required this.key});

  @override
  List<Object> get props =>[id,key];
}

class SetParticipantEvent extends ProfileEvent {
  final Participants participants;

  const SetParticipantEvent({required this.participants});

  @override
  List<Object> get props =>[participants];
}

class SetThemeAppParticipantEvent extends ProfileEvent {
  final int id;
  final ThemeApp themeApp;

  const SetThemeAppParticipantEvent({required this.id,required this.themeApp});

  @override
  List<Object> get props =>[id,themeApp];
}

class SetVolumeParticipantEvent extends ProfileEvent {
  final double volume;

  const SetVolumeParticipantEvent({required this.volume});

  @override
  List<Object> get props =>[volume];
}

class SetLangParticipantEvent extends ProfileEvent {
  final int id;
  final int lang;

  const SetLangParticipantEvent({required this.id,required this.lang});

  @override
  List<Object> get props =>[id,lang];
}

class SetPhotoParticipantEvent extends ProfileEvent {
  final int id;
  final String photoPath;

  const SetPhotoParticipantEvent({required this.id,required this.photoPath});

  @override
  List<Object> get props =>[id,photoPath];
}