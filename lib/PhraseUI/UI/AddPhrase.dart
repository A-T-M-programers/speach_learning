import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speach_learning/PhraseUI/Widget/AddPhrase/CardAddWord.dart';
import 'package:speach_learning/PhraseUI/Widget/AddPhrase/DropDown.dart';
import 'package:speach_learning/PhraseUI/bloc/BlocAddPhrase.dart';
import 'package:speach_learning/PhraseUI/bloc/BlocShowCheckBox.dart';
import 'package:speach_learning/Process_Class/Level.dart';
import 'package:speach_learning/Process_Class/PhraseItem.dart';
import 'package:speach_learning/Process_Class/Word.dart';
import 'package:speach_learning/Process_Class/WordOrPhraseType.dart';
import 'package:speach_learning/Read/Widget/SingleChildListTextView.dart';

// ignore: must_be_immutable
class AddPhrase extends StatefulWidget {
  AddPhrase({Key? key, required this.level, this.idUpdate}) : super(key: key);

  final Level level;

  String? idUpdate;

  @override
  State<AddPhrase> createState() => _AddPhraseState();
}

class _AddPhraseState extends State<AddPhrase>
    with SingleTickerProviderStateMixin {
  // ignore: prefer_const_constructors
  Size size = Size(0.0, 0.0);
  late String idTypePhrase = "";
  late List<WordOrPhraseType> listTypeWord;
  late List<WordOrPhraseType> listPhraseType;
  List<String> listWordInsidePhrase = [], listFullTranslate = [], idTypeWordList = [];
  int wordCount = 0;
  List<Map<String,dynamic>> updateList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.idUpdate != null) {
      PhraseItem phraseItem = widget.level.listPhraseItem
          .firstWhere((element) => element.iD == widget.idUpdate);
      wordCount = phraseItem.listWord.length - 1;
      idTypePhrase = phraseItem.type.id;
      for (var word in phraseItem.listWord) {
        listWordInsidePhrase.add(word.content);
        listFullTranslate.add(word.trans);
        idTypeWordList.add(word.type.id);
      }
    } else {
      listFullTranslate.add("");
      listWordInsidePhrase.add("");
      idTypeWordList.add("");
    }
    listTypeWord = [
      WordOrPhraseType(
          data: {"id": "0", "Content": "H-Question", "Trans": "كلمة سؤال"}),
      WordOrPhraseType(
          data: {"id": "1", "Content": "Verb-Be", "Trans": "فعل كون"}),
      WordOrPhraseType(
          data: {"id": "2", "Content": "Pronoun", "Trans": "ضمير"}),
      WordOrPhraseType(data: {"id": "3", "Content": "Noun", "Trans": "اسم"})
    ];
    listPhraseType = [
      WordOrPhraseType(
          data: {"id": "0", "Content": "Question", "Trans": "سؤال"}),
      WordOrPhraseType(
          data: {"id": "1", "Content": "Normal", "Trans": "بسيطة"}),
    ];
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          // ignore: prefer_const_constructors
          title:
              Text(widget.idUpdate != null ? "updatephrase" : "addphrase").tr(),
          actions: [
            DropDownCustom(
              listDropDown: listPhraseType,
              nameThis: "Type-Phrase",
              idSelected: widget.idUpdate != null
                  ? widget.level.listPhraseItem
                      .firstWhere((element) => element.iD == widget.idUpdate)
                      .type
                      .id
                  : null,
            ),
            15.pw
          ],
        ),
        body: Center(
            child: Container(
          // ignore: prefer_const_constructors
          margin: EdgeInsets.only(top: 20.0),
          width: size.width * 0.95,
          height: size.height,
          child: SingleChildScrollView(
              child: Column(
            children: [
              BlocBuilder<BlocAddPhrase, Map>(
                  buildWhen: (previos, next) {
                    try {
                      if (previos != next) {
                        if (next.containsKey("Add")) {
                          if (next["Add"] != null) {
                            updateList.add({"Add": {"Index-Word": listWordInsidePhrase.length - 1}});
                            print(updateList);
                            return true;
                          }
                        } else if (next.containsKey("Delete")) {
                          if (next["Delete"] != null && wordCount > 0) {
                            if (updateList.any((element) {
                              if(element.containsKey("Add")){
                                if(element["Add"]["Index-Word"] == next["Delete"]["Index-Word-Delete"]!) {
                                  updateList.removeWhere((deleteWord) => deleteWord == element);
                                  return true;
                                }else{
                                  return false;
                                }
                              }else{
                                return false;
                              }
                            })) {

                            }else {
                              updateList.add({"Delete": {"Index-Word": next["Delete"]["Index-Word-Delete"]!}});
                            }
                            return deleteWord(next["Delete"]["Index-Word-Delete"]!);
                          }
                        } else if (next.containsKey("Select-Type")) {
                          if (next["Select-Type"].containsKey("Type-Word") &&
                              next["Select-Type"].containsKey("Index-Item")) {
                            if (next["Select-Type"]["Type-Word"] != null) {
                              idTypeWordList[next["Select-Type"]["Index-Item"]] =
                              next["Select-Type"]["Type-Word"];
                              if (updateList.any((element) =>
                                  element.containsKey("Select-Type"))) {
                                if (updateList.any((element) =>
                                    element["Select-Type"].containsKey(
                                        "Type-Word"))) {
                                  if (!updateList.any((element) =>
                                  element["Select-Type"]["Index-Item"] ==
                                      next["Select-Type"]["Index-Item"] &&
                                      element["Select-Type"]["Type-Word"] ==
                                          next["Select-Type"]["Type-Word"])) {
                                    updateList.removeWhere((element) =>
                                    element["Select-Type"]["Index-Item"] ==
                                        next["Select-Type"]["Index-Item"]);
                                    updateList.add(
                                        {"Select-Type": next["Select-Type"]});
                                  }
                                } else {
                                  updateList.add(
                                      {"Select-Type": next["Select-Type"]});
                                }
                              } else {
                                updateList.add(
                                    {"Select-Type": next["Select-Type"]});
                              }
                              print(updateList);
                              return true;
                            }
                          } else if (next["Select-Type"].containsKey(
                              "Type-Phrase")) {
                            if (next["Select-Type"]["Type-Phrase"] != null) {
                              idTypePhrase = next["Select-Type"]["Type-Phrase"];
                              if (updateList.any((element) =>
                                  element.containsKey("Select-Type"))) {
                                if (updateList.any((element) =>
                                    element["Select-Type"].containsKey(
                                        "Type-Phrase"))) {
                                  updateList.removeWhere((element) =>
                                  element["Select-Type"]["Type-Phrase"] !=
                                      null);
                                  updateList.add(
                                      {"Select-Type": next["Select-Type"]});
                                } else {
                                  updateList.add(
                                      {"Select-Type": next["Select-Type"]});
                                }
                              } else {
                                updateList.add(
                                    {"Select-Type": next["Select-Type"]});
                              }
                              print(updateList);
                              return true;
                            }
                          }
                        }
                        return false;
                      } else {
                        return false;
                      }
                    }catch(e){
                      print("Error in blocBuilder manage in AddPhrase Page ===> " + e.toString());
                      return false;
                    }
                  },
                  builder: (bc, state) => ListView.builder(
                      controller: ScrollController(),
                      itemCount: wordCount + 1,
                      shrinkWrap: true,
                      itemBuilder: (bc, index) {
                        return CardAddWord(
                          listTypeWord: listTypeWord,
                          indexWord: index,
                          content: listWordInsidePhrase,
                          trans: listFullTranslate,
                          idTypeWord: idTypeWordList[index],
                        );
                      })),
              20.ph,
              ElevatedButton.icon(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).appBarTheme.backgroundColor)),
                onPressed: () {
                  bool confirmAddword = addWord();
                  if (confirmAddword) {
                    print("Word Add");
                  } else {

                  }
                },
                label: Text(
                  "addword",
                  style: TextStyle(
                      color: Theme.of(context).textTheme.headline1!.color),
                ).tr(),
                icon: const Icon(Icons.add_comment_outlined),
              )
            ],
          )),
        )),
        floatingActionButton: BlocListener<BlocAddPhrase, Map>(
          listener: (bc, state) {},
          child: FloatingActionButton(
            onPressed: () {
              try {
                if (listWordInsidePhrase[0].isNotEmpty && widget.idUpdate == null) {
                  bool checkAdd = addPhrase();
                  if(checkAdd){
                    context.read<BlocUpdateShowListPhrase>().showListPhraseItem(widget.level.listPhraseItem);
                    print("Add Phrase");
                    Navigator.pop(context);
                  }
                } else if (widget.idUpdate != null && updateList.isNotEmpty) {
                  bool checkUpdate = updatePhrase();
                  if(checkUpdate){
                    context.read<BlocUpdateShowListPhrase>().showListPhraseItem(widget.level.listPhraseItem);
                    print("Update Phrase");
                    Navigator.pop(context);
                  }
                }
              } catch (e) {
                // ignore: avoid_print
                print("Error ===> $e");
              }
            },
            child: Icon(
              widget.idUpdate != null ? Icons.note_alt_rounded : Icons.add,
              size: 35.0,
              color: Theme.of(context).textTheme.headline2!.color,
            ),
            backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          ),
        ));
  }

  bool addWord() {
    try {
      wordCount++;
      listWordInsidePhrase.add("");
      listFullTranslate.add("");
      idTypeWordList.add(listTypeWord.first.id);
      context.read<BlocAddPhrase>().changeState({"Add": {}});
      return true;
    } catch (e) {
      // ignore: avoid_print
      print("Error in addWord Methode in AddPhrase Page ===>" + e.toString());
      return false;
    }
  }

  bool deleteWord(int index) {
    try {
      listWordInsidePhrase.removeAt(index);
      listFullTranslate.removeAt(index);
      idTypeWordList.removeAt(index);
      wordCount = wordCount - 1;
      return true;
    } catch (e) {
      // ignore: avoid_print
      print(
          "Error in deleteWord Methode in AddPhrase Page ===>" + e.toString());
      return false;
    }
  }

  String getStringList(List<String> data, int index) {
    String newString = "";
    for (int i = 0; i <= index; i++) {
      if (data[i].isNotEmpty) {
        newString += data[i] + " ";
      } else {
        newString += "";
      }
    }
    return newString;
  }

  bool addPhrase() {
    try {
      List<Word> list = [];
      List<PWRB> listPwrb = [];
      int randomPhrase = Random().nextInt(100);
      for (int i = 0; i < listWordInsidePhrase.length; i++) {
        int randomWord = Random().nextInt(1000);
        list.add(Word(data: {
          "id": randomWord.toString(),
          "Content": listWordInsidePhrase[i],
          "Trans": listFullTranslate[i],
          "Index": randomWord,
          "PhraseNumber": 5,
          "Type": listTypeWord.firstWhere(
              (element) => element.id == idTypeWordList[i],
              orElse: () => listTypeWord.first),
          "Word-In-Phrase": getStringList(listWordInsidePhrase, i),
          "Trans-In-Phrase": getStringList(listFullTranslate, i),
          "UWRB": UWRB(data: {"Type": "2"})
        }));
        listPwrb.add(PWRB(data: {
          "id-Phrase": randomPhrase.toString(),
          "id-Word": randomWord.toString(),
          "Index": i
        }));
      }
      PhraseItem phraseItem = PhraseItem(data: {
        "id": randomPhrase.toString(),
        "Type": listPhraseType.firstWhere(
            (element) => element.id == idTypePhrase,
            orElse: () => listPhraseType.first),
        "Index": widget.level.listPhraseItem.length,
        "Word-Count": list.length,
        "id-Level": widget.level.id,
        "Level": widget.level.index,
        "List-Word": list,
        "List-PWRB": listPwrb,
        "UPRB": UPRB(data: {"Type": "1"})
      });
      widget.level.listPhraseItem.add(phraseItem);
      context
          .read<BlocUpdateShowListPhrase>()
          .showListPhraseItem(widget.level.listPhraseItem);
      Navigator.pop(context);
      return true;
    } catch (e) {
      "Error in addPhrase Methode in Add Phrase Page ===>" + e.toString();
      return false;
    }
  }
  bool updatePhrase(){
    try{
      updateList = sortUpdateList(updateList);
      print(updateList);
      int indexWhere = widget.level.listPhraseItem.indexWhere((element) => element.iD == widget.idUpdate);
      PhraseItem phraseItem = widget.level.listPhraseItem[indexWhere];
        for(var executeManage in updateList){
          print(updateList);
          if(executeManage.containsKey("Add")) {
            if(listWordInsidePhrase[executeManage["Add"]["Index-Word"]].isNotEmpty) {
              int randomWord = Random().nextInt(1000);
              phraseItem.listWord.add(Word(data: {
                "id": randomWord.toString(),
                "Content": listWordInsidePhrase[executeManage["Add"]["Index-Word"]],
                "Trans": listFullTranslate[executeManage["Add"]["Index-Word"]],
                "Index": randomWord,
                "PhraseNumber": phraseItem.index,
                "Type": listTypeWord.firstWhere((element) =>
                element.id ==
                    idTypeWordList[executeManage["Add"]["Index-Word"]],
                    orElse: () => listTypeWord.first),
                "Word-In-Phrase": getStringList(
                    listWordInsidePhrase, executeManage["Add"]["Index-Word"]),
                "Trans-In-Phrase": getStringList(
                    listFullTranslate, executeManage["Add"]["Index-Word"]),
                "UWRB": UWRB(data: {"Type": "2"})
              }));
              phraseItem.listPWRB.add(PWRB(data: {
                "id-Phrase": phraseItem.iD,
                "id-Word": randomWord.toString(),
                "Index": executeManage["Add"]["Index-Word"]
              }));
              phraseItem.setCount(phraseItem.count + 1);
            }
          }else if(executeManage.containsKey("Delete")){
            phraseItem.listPWRB.removeWhere((element) => element.iDWord == executeManage["Delete"]["Index-Word"]);
            phraseItem.listWord.removeWhere((element) => element.id == executeManage["Delete"]["Index-Word"]);
          }else if(executeManage.containsKey("Select-Type")){
            if(executeManage["Select-Type"].containsKey("Type-Word")){
              Word word = phraseItem.listWord.removeAt(executeManage["Select-Type"]["Index-Item"]);
              word.setType(listTypeWord.firstWhere((element) => element.id == executeManage["Select-Type"]["Type-Word"]));
              phraseItem.listWord.insert(executeManage["Select-Type"]["Index-Item"], word);
            }else{
              phraseItem.setType(listPhraseType.firstWhere((element) => element.id == executeManage["Select-Type"]["Type-Phrase"]));
            }
          }
          widget.level.listPhraseItem.removeAt(indexWhere);
          widget.level.listPhraseItem.insert(indexWhere, phraseItem);
      }
      return true;
    }on Exception catch(e){
      // ignore: avoid_print
      print("Error in updatePhrase Methode in AddPhrase Page ===>" + Error.safeToString(e));
      return false;
    }
  }
  List<Map<String,dynamic>> sortUpdateList(List<Map<String,dynamic>> data){
    int indexDelete = 0;
    int indexSelected = 0;
    for(int i = 0; i < data.length ; i++){
      if(data[i].containsKey("Add")){
        if(i > indexSelected || i > indexDelete){
          if(indexSelected > indexDelete) {
            Map<String, dynamic> temp = data[i];
            data[i] = data[indexDelete];
            data[indexDelete] = temp;
            indexDelete = i;
          }else{
            Map<String, dynamic> temp = data[i];
            data[i] = data[indexSelected];
            data[indexSelected] = temp;
            indexSelected = i;
          }
        }else {
          continue;
        }
      }else if(data[i].containsKey("Select-Type")){
        if(i > indexDelete){
          Map<String,dynamic> temp = data[i];
          data[i] = data[indexDelete];
          data[indexDelete] = temp;
          indexSelected = indexDelete;
          indexDelete = i;
        }else{
          indexSelected = i;
          continue;
        }
      } else{
        indexDelete = i;
      }
    }
    return data;
  }
}
