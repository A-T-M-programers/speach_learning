import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: camel_case_types
class Bloc_Controler extends Cubit<dynamic>{
  Bloc_Controler():super(0);

  increment()=>emit(state+10);
  // ignore: non_constant_identifier_names
  void chang_level(double le) => emit(le);
  // ignore: non_constant_identifier_names
  void chang_color_Word(Map<String,String> type) => emit(type);
}