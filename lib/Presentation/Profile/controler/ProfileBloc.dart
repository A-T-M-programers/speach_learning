import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:speach_learning/Domain/Entity/Participants.dart';
import 'package:speach_learning/Presentation/Profile/controler/ProfileEvent.dart';
import 'package:speach_learning/Presentation/Profile/controler/ProfileState.dart';
import 'package:speach_learning/core/error/failure.dart';
import 'package:speach_learning/core/global/themeApp/ThemeApp.dart';
import 'package:speach_learning/core/usecases/base_useCase.dart';
import 'package:speach_learning/core/utils/enums.dart';


class ProfileBloc extends Bloc<ProfileEvent, ParticipantState> {
  final BaseUseCase<Participants,GetParticipantEvent> getParticipantBaseUseCaseGet;
  final BaseUseCase<int,SetParticipantEvent> setParticipantBaseUseCase;
  final BaseUseCase<ThemeApp,SetThemeAppParticipantEvent> setThemeBaseUseCase;
  final BaseUseCase<int,SetLangParticipantEvent> setLangBaseUseCase;
  final BaseUseCase<String,SetPhotoParticipantEvent> setPhotoBaseUseCase;

  ProfileBloc(
      this.getParticipantBaseUseCaseGet,
      this.setParticipantBaseUseCase,
      this.setThemeBaseUseCase,
      this.setLangBaseUseCase,
      this.setPhotoBaseUseCase
      ) : super(const ParticipantState()) {
    on<SetLangParticipantEvent>(_setLangParticipant);
    on<GetParticipantEvent>(_getParticipant);
    on<SetParticipantEvent>(_setParticipant);
    on<SetThemeAppParticipantEvent>(_setThemeAppParticipant);
    on<SetVolumeParticipantEvent>(_setVolumeParticipant);
    on<SetPhotoParticipantEvent>(_setPhotoParticipant);
  }
    FutureOr<void> _getParticipant(GetParticipantEvent event, Emitter<ParticipantState> emit) async {
      emit(state.cobyWith(requestState: RequestState.loading,key: event.key));
      final response = await getParticipantBaseUseCaseGet(event);
      response.fold(
              (l) => emit(state.cobyWith(requestState: RequestState.error, error: l as ServerFailure,key: event.key)),
              (r) => r != Participants.empty() ? emit(state.cobyWith(requestState: RequestState.loaded, participants: r,key: event.key)) : null);
    }

  FutureOr<void> _setParticipant(SetParticipantEvent event, Emitter<ParticipantState> emit) async {
    emit(state.cobyWith(requestState: RequestState.loading));
    final response = await setParticipantBaseUseCase(event);
    response.fold(
            (l) => emit(state.cobyWith(requestState: RequestState.error, error: l as ServerFailure)),
            (r) => r != 0 ? emit(state.cobyWith(requestState: RequestState.loaded, idParticipant: r)) : null);
  }

  FutureOr<void> _setThemeAppParticipant(SetThemeAppParticipantEvent event, Emitter<ParticipantState> emit) async {
    emit(state.cobyWith(requestState: RequestState.loading));
    final response = await setThemeBaseUseCase(event);
    response.fold(
            (l) => emit(state.cobyWith(themeData: kLightTheme, requestState: RequestState.error, error: l as ServerFailure)),
            (r) => emit(state.cobyWith(themeData: r == ThemeApp.light ? kLightTheme : kDarkTheme, requestState: RequestState.loaded, themeApp: r)));
  }

  FutureOr<void> _setVolumeParticipant(SetVolumeParticipantEvent event, Emitter<ParticipantState> emit) async {
    emit(state.cobyWith(requestState: RequestState.loading));
    emit(state.cobyWith(volume: event.volume, requestState: RequestState.loaded));
  }

  FutureOr<void> _setLangParticipant(SetLangParticipantEvent event, Emitter<ParticipantState> emit) async {
    emit(state.cobyWith(requestState: RequestState.loading));
    final response = await setLangBaseUseCase(event);
    response.fold(
            (l) => emit(state.cobyWith(lang: 1, requestState: RequestState.error, error: l as ServerFailure)),
            (r) => emit(state.cobyWith(lang: r, requestState: RequestState.loaded)));
  }

  FutureOr<void> _setPhotoParticipant(SetPhotoParticipantEvent event, Emitter<ParticipantState> emit) async {
    emit(state.cobyWith(requestState: RequestState.loading));
    final response = await setPhotoBaseUseCase(event);
    response.fold(
            (l) => emit(state.cobyWith(imageParticipant: ImageParticipant.setImageParticipant(), requestState: RequestState.error, error: l as ServerFailure)), (r) {
      if (r != "") {
        return emit(state.cobyWith(imageParticipant: ImageParticipant(linkImage: r, stateImage: StateImage.remote), requestState: RequestState.loaded));
      } else {
        return emit(state.cobyWith(imageParticipant: ImageParticipant.setImageParticipant(), requestState: RequestState.error, error: const ServerFailure("File Empty", 402, DioErrorType.badResponse)));
      }
    });
  }
}

// class SetThemeAppParticipantProfileBloc extends ProfileBloc {
//   final BaseUseCase<ThemeApp,SetThemeAppParticipantEvent> baseUseCase;
//
//   SetThemeAppParticipantProfileBloc(this.baseUseCase) : super(sl(),sl()) {
//     on<SetThemeAppParticipantEvent>(_setThemeAppParticipant);
//   }
//
//   FutureOr<void> _setThemeAppParticipant(
//       SetThemeAppParticipantEvent event, Emitter<ProfileState> emit) async {
//     final response = await baseUseCase(event);
//     response.fold(
//             (l) => emit(SetThemeAppProfileState(themeData: kLightTheme, requestState: RequestState.error, message: l.message,participants: state.participants)),
//             (r) => emit(SetThemeAppProfileState(themeData: r == ThemeApp.light ? kLightTheme : kDarkTheme, requestState: RequestState.loaded, themeApp: r,participants: state.participants)));
//   }
// }

// class SetVolumeParticipantProfileBloc extends ProfileBloc {
//   SetVolumeParticipantProfileBloc() : super(sl(),sl()) {
//     on<SetVolumeParticipantEvent>(_setVolumeParticipant);
//   }
//
//   FutureOr<void> _setVolumeParticipant(
//       SetVolumeParticipantEvent event, Emitter<ParticipantState> emit) async {
//     emit(state.cobyWith(volume: event.volume, requestState: RequestState.loaded));
//   }
// }

// class SetLangParticipantProfileBloc extends ProfileBloc {
//   final BaseUseCase<int,SetLangParticipantEvent> baseUseCase;
//
//   SetLangParticipantProfileBloc(this.baseUseCase) : super(sl(),sl()) {
//     on<SetLangParticipantEvent>(_setLangParticipant);
//   }
//
//   FutureOr<void> _setLangParticipant(
//       SetLangParticipantEvent event, Emitter<ParticipantState> emit) async {
//     final response = await baseUseCase(event);
//     response.fold(
//         (l) => emit(state.cobyWith(lang: 1, requestState: RequestState.error, message: l.message)),
//         (r) => emit(state.cobyWith(lang: r, requestState: RequestState.loaded)));
//   }
// }

// class SetPhotoParticipantProfileBloc extends ProfileBloc {
//   final BaseUseCase<String,SetPhotoParticipantEvent> baseUseCase;
//
//   SetPhotoParticipantProfileBloc(this.baseUseCase) : super(sl(),sl()) {
//     on<SetPhotoParticipantEvent>(_setPhotoParticipant);
//   }
//
//   FutureOr<void> _setPhotoParticipant(SetPhotoParticipantEvent event, Emitter<ParticipantState> emit) async {
//     final response = await baseUseCase(event);
//     response.fold(
//         (l) => emit(state.cobyWith(imageParticipant: ImageParticipant.setImageParticipant(), requestState: RequestState.error, message: l.message)), (r) {
//       if (r != "") {
//         return emit(state.cobyWith(imageParticipant: ImageParticipant(linkImage: r, stateImage: StateImage.local), requestState: RequestState.loaded));
//       } else {
//         return emit(state.cobyWith(imageParticipant: ImageParticipant.setImageParticipant(), requestState: RequestState.error, message: "File Empty"));
//       }
//     });
//   }
// }

// class SetParticipantProfileBloc extends ProfileBloc {
//   final BaseUseCase<Participants,SetParticipantEvent> baseUseCase;
//
//   SetParticipantProfileBloc(this.baseUseCase) : super(const ParticipantState()) {
//     on<SetParticipantEvent>(_setParticipant);
//   }
//
//   FutureOr<void> _setParticipant(SetParticipantEvent event, Emitter<ParticipantState> emit) async {
//     final response = await baseUseCase(event);
//     response.fold(
//         (l) => emit(state.cobyWith(requestState: RequestState.error, message: l.message)),
//         (r) => emit(state.cobyWith(requestState: RequestState.loaded, participants: r)));
//   }
// }
