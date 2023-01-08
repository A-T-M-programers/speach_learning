import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: camel_case_types
class Bloc_Controler extends Cubit<dynamic>{
  Bloc_Controler():super(0);
  // ignore: non_constant_identifier_names
  void chang_level(double le) => emit(le);
}
// ignore: camel_case_types
class Bloc_increment extends Cubit<int>{
  Bloc_increment():super(0);

  void increment(int type) => emit(type);
}

// ignore: camel_case_types
class Bloc_chang_color_Word extends Cubit<Map<String,String>>{
  Bloc_chang_color_Word():super({});

  // ignore: non_constant_identifier_names
  void chang_color_Word(Map<String,String> type) => emit(type);
}

// ignore: camel_case_types
class Bloc_chang_display_circuler extends Cubit<Map<String,bool>>{
  Bloc_chang_display_circuler():super({});

  // ignore: non_constant_identifier_names
  void chang_display_circuler(Map<String,bool> type) => emit(type);
}
// ignore: camel_case_types
class Bloc_change_Language extends Cubit<String>{
  Bloc_change_Language():super("English(US)");

  // ignore: non_constant_identifier_names
  void change_Language(String change_Language) =>emit(change_Language);
}
// ignore: camel_case_types
class Bloc_changeStateBottomSheet extends Cubit<bool>{
  Bloc_changeStateBottomSheet():super(false);

  void changeStateBottomSheet(bool isShow) => emit(isShow);
}
// ignore: camel_case_types
class Bloc_CheckLevel extends Cubit<int>{
  // ignore: non_constant_identifier_names
  int Level = 0;

  Bloc_CheckLevel():super(0);

  // ignore: non_constant_identifier_names
  int CheckLevel() {
    emit(state <= 20 ? state + 1 : 0);
    if(state == 20){
      Level++;
      return Level;
    }
    return 0;
  }
}