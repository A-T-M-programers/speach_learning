import 'package:flutter_bloc/flutter_bloc.dart';

class BlocShowCheckBox extends Cubit<Map<int,bool>>{
  BlocShowCheckBox():super({0:false});

  showCheckBox(Map<int,bool> isShow) => emit(isShow);
}