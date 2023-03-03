import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:speach_learning/Process_Class/ChangeThemeEvent.dart';
import 'package:speach_learning/Process_Class/ChangeThemeState.dart';
import 'package:speach_learning/Process_Class/User.dart';

class ChangeThemeBloc extends Bloc<ChangeThemeEvent, ChangeThemeState> {
  ChangeThemeBloc(ChangeThemeState initialState) : super(initialState);



  // ignore: invalid_use_of_visible_for_testing_member
  void onLightThemeChange() => emit(ChangeThemeState.lightTheme());
  // ignore: invalid_use_of_visible_for_testing_member
  void onDarkThemeChange() => emit(ChangeThemeState.darkTheme());
  // ignore: invalid_use_of_visible_for_testing_member
  // void onDecideThemeChange() => emit(ChangeThemeState(themeData: DecideTheme()));

  ChangeThemeState get initialState => ChangeThemeState.lightTheme();

  Stream<ChangeThemeState> mapEventToState(
      ChangeThemeState currentState, ChangeThemeEvent event) async* {
    if (event is DecideTheme) {
      // ignore: avoid_print
      print('inside Theme decision body');
      final int optionValue = await getOption();
      if (optionValue == 0) {
        yield ChangeThemeState.lightTheme();
      } else if (optionValue == 1) {
        yield ChangeThemeState.darkTheme();
      }
    }

    if (event is DarkTheme) {
      // ignore: avoid_print
      print('inside darktheme body');

      yield ChangeThemeState.darkTheme();
      try {
        _saveOptionValue(1);
      } catch (_) {
        throw Exception("Could not persist change");
      }
    }
    if (event is LightTheme) {
      // ignore: avoid_print
      print('inside LightTheme body');

      yield ChangeThemeState.lightTheme();
      try {
        _saveOptionValue(0);
      } catch (_) {
        throw Exception("Could not persist change");
      }
    }
  }

  Future<void> _saveOptionValue(int optionValue) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setInt('theme_option', optionValue);
    // ignore: avoid_print
    print('Saving option value as $optionValue successfully');
  }

  Future<int> getOption() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    int option = preferences.getInt('theme_option') ?? 0;
    return option;
  }
}

final ChangeThemeBloc changeThemeBloc = ChangeThemeBloc(User.themApp ? ChangeThemeState.darkTheme() : ChangeThemeState.lightTheme());