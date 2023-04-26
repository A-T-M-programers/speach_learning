import 'dart:async';


import 'package:bloc/bloc.dart';
import 'package:speach_learning/Domain/Entity/Participants.dart';
import 'package:speach_learning/Domain/UseCase/participant_usecase.dart';
import 'package:speach_learning/Presentation/Profile/controler/ProfileEvent.dart';
import 'package:speach_learning/Presentation/Profile/controler/ProfileState.dart';
import 'package:speach_learning/core/global/themeApp/ThemeApp.dart';
import 'package:speach_learning/core/utils/enums.dart';

class ProfileParticipantBloc extends Bloc<ProfileEvent, ParticipantState> {
  final ParticipantUseCase participantUseCase;
  static late ThemeApp themeApp;

  ProfileParticipantBloc(this.participantUseCase)
      : super(const ParticipantState()) {
    on<SetThemeAppParticipantEvent>(_setThemeAppParticipant);
    on<SetVolumeParticipantEvent>(_setVolumeParticipant);
    on<SetLangParticipantEvent>(_setLangParticipant);
    on<SetPhotoParticipantEvent>(_setPhotoParticipant);
    on<GetParticipantEvent>(_getParticipant);
    on<SetParticipantEvent>(_setParticipant);
  }

  FutureOr<void> _getParticipant(GetParticipantEvent event, Emitter<ParticipantState> emit) async {
    final response = await participantUseCase.executeGetParticipantWithId(event.id);
    response.fold(
            (l) => emit(state.cobyWith(requestState: RequestState.error, message: l.message)),
            (r) => emit(state.cobyWith(requestState: RequestState.loaded, participants: r)));
  }

  FutureOr<void> _setParticipant(SetParticipantEvent event, Emitter<ParticipantState> emit) async {
    final response = await participantUseCase.executeSetParticipant(event.participants);
    response.fold(
            (l) => emit(state.cobyWith(requestState: RequestState.error, message: l.message)),
            (r) => emit(state.cobyWith(requestState: RequestState.loaded, participants: r)));
  }

  FutureOr<void> _setThemeAppParticipant(SetThemeAppParticipantEvent event, Emitter<ParticipantState> emit) async{
    final response = await participantUseCase.executeSetThemeAppParticipant(event.themeApp,event.id);
    response.fold(
            (l) => emit(state.cobyWith(themeData: kLightTheme,requestState: RequestState.error, message: l.message)),
            (r) => emit(state.cobyWith(themeData: r == ThemeApp.light ? kLightTheme : kDarkTheme, requestState: RequestState.loaded, themeApp: r)));
  }

  FutureOr<void> _setVolumeParticipant(SetVolumeParticipantEvent event, Emitter<ParticipantState> emit) async {
    emit(state.cobyWith(volume: event.volume, requestState: RequestState.loaded));
  }

  FutureOr<void> _setLangParticipant(SetLangParticipantEvent event, Emitter<ParticipantState> emit) async {
    final response = await participantUseCase.executeSetLangParticipant(event.lang,event.id);
    response.fold(
            (l) => emit(state.cobyWith(lang: 1,requestState: RequestState.error, message: l.message)),
            (r) => emit(state.cobyWith(lang: r, requestState: RequestState.loaded)));
  }

  FutureOr<void> _setPhotoParticipant(SetPhotoParticipantEvent event, Emitter<ParticipantState> emit) async {
    final response = await participantUseCase.executeSetPhotoParticipant(event.photoPath,event.id);
    response.fold(
            (l) =>
            emit(state.cobyWith(
                imageParticipant: ImageParticipant.setImageParticipant(),requestState: RequestState.error, message: l.message)),
            (r) {
              if(r != "") {
                return emit(state.cobyWith(
                    imageParticipant: ImageParticipant(
                        linkImage: r, stateImage: StateImage.local),
                    requestState: RequestState.loaded));
              }else{
                return emit(state.cobyWith(
                    imageParticipant: ImageParticipant.setImageParticipant(),requestState: RequestState.error, message: "File Empty"));
              }
            });
  }
}
