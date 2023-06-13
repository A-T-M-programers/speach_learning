import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class BlocOffsetSlideTransition extends Cubit<Map<int,Offset>>{
  // ignore: prefer_const_constructors
  BlocOffsetSlideTransition():super({0:Offset(0.0, 0.0)});

  void offsetSlideTransition(Map<int,Offset> data) => emit(data);
}