import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: camel_case_types
class Bloc_Change_Lan extends Cubit<String>{
  Bloc_Change_Lan():super("");
  changeLan() => emit("");
}
class BlocSelectLevel extends Cubit<Map<String,dynamic>>{
  BlocSelectLevel():super({});
  changeSelect(Map<String,dynamic> state) => emit(state);
  changeUnSelect(Map<String,dynamic> state) => emit(state);
}