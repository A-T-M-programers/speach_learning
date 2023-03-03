import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speach_learning/Process_Class/PhraseItem.dart';

class BlocShowCheckBox extends Cubit<Map<int,bool>>{
  BlocShowCheckBox():super({0:false});

  showCheckBox(Map<int,bool> isShow) => emit(isShow);
}
class BlocUpdateShowListPhrase extends Cubit<List<PhraseItem>>{
  BlocUpdateShowListPhrase(List<PhraseItem> list):super(list);

  showListPhraseItem(List<PhraseItem> list) => emit(list);
}