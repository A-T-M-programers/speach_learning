// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:speach_learning/PhraseUI/Widget/AddPhrase/APTextControler.dart';
// import 'package:speach_learning/Process_Class/Level.dart';
// import 'package:speach_learning/Read/Widget/SingleChildListTextView.dart';
//
// // ignore: must_be_immutable
// class AddPhrase extends StatefulWidget {
//   AddPhrase({Key? key , required this.level,this.indexUpdate}) : super(key: key);
//
//   final Level level ;
//   int? indexUpdate ;
//
//   @override
//   State<AddPhrase> createState() => _AddPhraseState();
// }
//
// class _AddPhraseState extends State<AddPhrase> {
//   // ignore: prefer_const_constructors
//   Size size = Size(0.0,0.0);
//   late String content = "",trans = "";
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     size = MediaQuery.of(context).size;
//     return Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           // ignore: prefer_const_constructors
//           title: Text(widget.indexUpdate != null ? "updatephrase" : "addphrase").tr(),
//         ),
//         body: Container(
//           // ignore: prefer_const_constructors
//           margin: EdgeInsets.only(top: 20.0,left: 20.0,right: 20.0),
//           height: size.height,
//           child: Column(
//             children: [
//               APTextControler(label: "content",hintText: "addcontenthere",updateText: widget.indexUpdate != null ? widget.listLevel[widget.indexUpdate!].content : null,),
//               20.ph,
//               APTextControler(label: "trans",hintText: "addtranshere",updateText: widget.indexUpdate != null ? widget.listLevel[widget.indexUpdate!].transContent : null),
//             ],
//           ),
//         ),
//         floatingActionButton: BlocListener<Bloc_Add_Level,Map<String,String>>(
//           listener: (bc,state){
//             if(state["content"] != null){
//               content = state["content"]!;
//             }else if(state["trans"] != null){
//               trans = state["trans"]!;
//             }
//           },
//           child: FloatingActionButton(
//             onPressed: () {
//               try {
//                 if(widget.indexUpdate != null) {
//                   if (trans.trim().isNotEmpty && content.trim().isNotEmpty) {
//                     widget.level.listPhraseItem[widget.indexUpdate!].setContent(content);
//                     widget.level.listPhraseItem[widget.indexUpdate!].setTransContent(trans);
//                     // ignore: avoid_print
//                     print("Update Level : ${widget.indexUpdate}");
//                   }
//                 }else {
//                   if (trans.trim().isNotEmpty && content.trim().isNotEmpty) {
//                     level = Level(data: {
//                       "id": "${widget.listLevel.length}",
//                       "id-Lan": "0",
//                       "Content": content,
//                       "Trans-Content": trans,
//                       "Index": widget.listLevel.length,
//                       "Type": "start",
//                       "Phrase-Count": 0,
//                       "List-Phrase-Item": <PhraseItem>[]
//                     });
//                     widget.listLevel.add(level);
//                     // ignore: avoid_print
//                     print("Add Level : ${widget.listLevel.length}");
//                   }
//                 }
//               }catch(e){
//                 // ignore: avoid_print
//                 print("Error ===> $e");
//               }
//             },
//             child: Icon( widget.indexUpdate != null ? Icons.note_alt_rounded : Icons.add,size: 35.0,color: Theme.of(context).textTheme.headline2!.color,),
//             backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
//           ),
//         ));
//   }
// }
