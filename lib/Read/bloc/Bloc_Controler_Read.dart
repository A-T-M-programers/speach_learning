import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: camel_case_types
class Bloc_Controler extends Cubit<dynamic>{
  Bloc_Controler():super(0);

  void increment(Map<String,int> type) => emit(type);
  // ignore: non_constant_identifier_names
  void chang_level(double le) => emit(le);
  // ignore: non_constant_identifier_names
  void chang_color_Word(Map<String,String> type) => emit(type);

  // ignore: non_constant_identifier_names
  void change_Language(String change_Language) =>emit(change_Language);

  void changeStateBottomSheet(bool isShow) => emit(isShow);

}