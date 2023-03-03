import 'package:bloc/bloc.dart';

// ignore: camel_case_types
class Bloc_Add_Level extends Cubit<Map<String,String>>{
  Bloc_Add_Level():super({});

  void addContent(String str) => emit({"content":str});
  void addTransContent(String str) => emit({"trans":str});
}