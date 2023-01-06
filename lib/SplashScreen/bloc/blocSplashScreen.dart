import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: camel_case_types
class blocSplashScreen extends Cubit<dynamic>{
  blocSplashScreen():super(40.0);

  void changSize(double size) => emit(size);



}