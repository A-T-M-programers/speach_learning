import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speach_learning/Process_Class/PhraseItem.dart';

class BlocShowCheckBox extends Cubit<Map<String,bool>>{
  BlocShowCheckBox():super({"":false});

  showCheckBox(Map<String,bool> isShow) => emit(isShow);
}
class BlocUpdateShowListPhrase extends Cubit<List<PhraseItem>>{
  BlocUpdateShowListPhrase(List<PhraseItem> list):super(list);

  showListPhraseItem(List<PhraseItem> list) => emit(list);
}
class BlocPhraseManage extends Cubit<Map>{
  BlocPhraseManage():super({});

  phraseManage(Map data) => emit(data);
}