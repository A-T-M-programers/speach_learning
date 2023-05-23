// // ignore_for_file: must_be_immutable
//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:speach_learning/PhraseUI/UI/AddPhrase.dart';
// import 'package:speach_learning/PhraseUI/bloc/BlocAddPhrase.dart';
// import 'package:speach_learning/PhraseUI/bloc/BlocShowCheckBox.dart';
// import 'package:speach_learning/Domain/Entity/Level.dart';
// import 'package:speach_learning/Read/Widget/SingleChildListTextView.dart';
//
// // ignore: must_be_immutable
// class PhraseManageList extends StatefulWidget {
//   PhraseManageList({Key? key, required this.level}) : super(key: key);
//   Level level;
//
//   @override
//   State<PhraseManageList> createState() => _PhraseManageListState();
// }
//
// class _PhraseManageListState extends State<PhraseManageList> {
//
//   Map<String, bool> listSelect = {};
//
//   @override
//   void dispose() {
//     listSelect = {};
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<BlocShowCheckBox, Map<String, bool>>(
//       buildWhen: (previos,next){
//         if(previos != next){
//           if (next.isNotEmpty) {
//             listSelect.addAll(next);
//             return true;
//           }
//           return false;
//         }else{
//           return false;
//         }
//       },
//         builder: (bc, state) {
//       return Row(
//         children: [
//           listSelect.values.contains(true)
//               ? Expanded(
//                   flex: 0,
//                   child: IconButton(
//                     onPressed: () {
//                       try {
//                         for(var select in listSelect.keys){
//                           if(listSelect[select]!){
//                             context.read<BlocPhraseManage>().phraseManage({"Delete":{"id-Phrase":select}});
//                             context.read<BlocShowCheckBox>().showCheckBox({select: false});
//                           }
//                         }
//                       } catch (e) {
//                         // ignore: avoid_print
//                         print("Error During Delete Phrase ===> " + e.toString());
//                       }
//                     },
//                     icon: const Icon(Icons.delete_rounded),
//                   ))
//               : 0.0.pw,
//           listSelect.values.contains(true) ? 10.pw : 0.0.pw,
//           listSelect.values.contains(true)
//               ? listSelect.values.where((element) => element == true).length ==1
//                   ? Expanded(
//                       flex: 0,
//                       child: IconButton(
//                         onPressed: () {
//                           try{
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (route) => MultiBlocProvider(
//                                         providers: [
//                                           BlocProvider<BlocOffsetSlideTransition>(
//                                             create: (BuildContext context) =>
//                                                 BlocOffsetSlideTransition(),
//                                           ),
//                                           BlocProvider<BlocAddPhrase>(
//                                             create: (BuildContext context) =>
//                                                 BlocAddPhrase(),
//                                           )
//                                         ],
//                                         child: AddPhrase(
//                                           level: widget.level,
//                                           idUpdate: listSelect.entries.firstWhere((element) => element.value == true).key,
//                                         ))));
//                           }catch(e){
//                             print("Error During Phrase Update in PhraseManageList Page ===>" + e.toString());
//                           }
//                           // Navigator.push(context,MaterialPageRoute(
//                           //     builder: (route) =>
//                           //         BlocProvider<Bloc_Add_Level>(
//                           //           create: (BuildContext bc) =>
//                           //               Bloc_Add_Level(),
//                           //           // ignore: prefer_const_constructors
//                           //           child: AddLevel(
//                           //             listLevel: listLevel,
//                           //             indexUpdate: listLevel.indexOf(isSelect.keys.firstWhere((element) => isSelect[element]!)),
//                           //           ),
//                           //         )) );
//                         },
//                         icon: const Icon(Icons.note_alt_rounded),
//                       ))
//                   : const SizedBox()
//               : const SizedBox(),
//           listSelect.values.contains(true) ? 10.pw : 0.0.pw,
//           Expanded(
//             flex: 0,
//             child: IconButton(
//               onPressed: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (route) => MultiBlocProvider(
//                                 providers: [
//                                   BlocProvider<BlocOffsetSlideTransition>(
//                                     create: (BuildContext context) =>
//                                         BlocOffsetSlideTransition(),
//                                   ),
//                                   BlocProvider<BlocAddPhrase>(
//                                     create: (BuildContext context) =>
//                                         BlocAddPhrase(),
//                                   )
//                                 ],
//                                 child: AddPhrase(
//                                   level: widget.level,
//                                 ))));
//               },
//               icon: const Icon(Icons.add_box_rounded),
//             ),
//           )
//         ],
//       );
//     });
//   }
// }
