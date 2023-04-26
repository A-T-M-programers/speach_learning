import 'package:flutter/material.dart';

// import 'package:adobe_xd/pinned.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:speach_learning/AddLevel/BlocLevel/Bloc_Add_Level.dart';
// import 'package:speach_learning/AddLevel/UI/AddLevel.dart';
import 'package:speach_learning/Presentation/Home/component/all_sections_view_component.dart';
import 'package:speach_learning/Presentation/Home/component/on_click_button_profile.dart';
import 'package:speach_learning/Presentation/Home/component/view_domain_mark.dart';

// import 'package:speach_learning/Home/Bloc/BlocHome.dart';
// import 'package:speach_learning/Home/widget/ButtonLevel.dart';
import 'package:speach_learning/Presentation/Home/component/view_study_lang.dart';
import 'package:speach_learning/core/utils/enums.dart';

// import 'package:speach_learning/Read/UI/read_page.dart';
// import 'package:speach_learning/Read/Widget/SingleChildListTextView.dart';
// import 'package:speach_learning/Read/bloc/Bloc_Controler_Read.dart';
//
// import '../../PhraseUI/UI/add_page.dart';
// import '../controler/Get_File_PDF.dart';

// ignore: camel_case_types, must_be_immutable
class home_page extends StatelessWidget {
  home_page({Key? key, required this.idParticipant}) : super(key: key);


  // ignore: prefer_const_constructors
  Size size = Size(0.0, 0.0);
  final int idParticipant;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        leading: Column(
          children: [
            Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              height: 40,
              padding: const EdgeInsets.only(top: 4.0),
              margin: EdgeInsets.zero,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
              child: const Icon(
                Icons.bookmark_rounded,
                size: 40,
                shadows: [
                  BoxShadow(
                    color: Colors.black54,
                    blurRadius: 6.0,
                    blurStyle: BlurStyle.inner,
                  )
                ],
              ),
            ),
            const Expanded(child: ViewDomainMark()),
          ],
        ),
        actions: [
          Row(
            children: [
              const ViewStudyLang(),
              Container(
                height: 28.0,
                width: 28.0,
                margin: const EdgeInsets.only(right: 5.0, left: 5.0),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                  "assets/icon/United_States(US).png",
                ))),
              )
            ],
          )
        ],
      ),
      body: AllSectionsViewComponent(),
      bottomSheet: NavigationBar(height: 50.0, destinations: [
        ButtonBottomSheet(assetImage: "assets/icon/icon_box.png",bottomSheetOption: BottomSheetOption.empty,id: idParticipant,),
        ButtonBottomSheet(assetImage: "assets/icon/🦆 icon _continent_.png",bottomSheetOption: BottomSheetOption.empty,id: idParticipant),
        ButtonBottomSheet(assetImage: "assets/icon/🦆 icon _open quran_.png",bottomSheetOption: BottomSheetOption.empty,id: idParticipant),
        ButtonBottomSheet(assetImage: "assets/icon/🦆 icon _dollar coin_.png",bottomSheetOption: BottomSheetOption.empty,id: idParticipant),
        ButtonBottomSheet(assetImage: "assets/icon/🦆 icon _male_.png",bottomSheetOption: BottomSheetOption.profile,id: idParticipant),
      ]),
    );
  }
}

//
// // ignore: camel_case_types
// class home_page extends StatefulWidget {
//   // ignore: prefer_const_constructors_in_immutables
//   home_page({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   State<home_page> createState() => _home_pageState();
// }
//
// // ignore: camel_case_types
// class _home_pageState extends State<home_page> {
//   // ignore: prefer_const_constructors
//   Size size = Size(0.0, 0.0);
//
//   // ignore: non_constant_identifier_names
//   Get_File_PDF get_file_pdf = Get_File_PDF();
//
//   List<Level> listLevel = [];
//   List<PhraseItem> listPhraseItem = [];
//   double pressEveluation = 5;
//   Map<Level, bool> isSelect = {};
//   int countSelect = 0;
//
//   @override
//   void initState() {
//     super.initState();
//     isSelect = Map.fromIterables(
//         List.generate(listLevel.length, (index) => listLevel[index]),
//         List.generate(listLevel.length, (index) => false));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     size = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//       appBar: AppBar(
//           leading: const SizedBox(),
//           actions: [
//             BlocListener<BlocSelectLevel, Map<String, dynamic>>(
//                 listener: (bc, state) {
//                   if (state["id-Level"] != null && state["is-Select"] != null) {
//                     countSelect = 0;
//                     for (var element in isSelect.keys) {
//                       if (element.id == state["id-Level"]) {
//                         isSelect[element] = state["is-Select"];
//                       }
//                       countSelect =
//                           isSelect[element]! ? countSelect + 1 : countSelect;
//                     }
//                     setState(() {});
//                   }
//                 },
//                 child: isSelect.containsValue(true)
//                     ? Row(
//                         children: [
//                           Expanded(
//                               flex: 0,
//                               child: IconButton(
//                                 onPressed: () {
//                                   try {
//                                     for (var element in isSelect.keys) {
//                                       if (isSelect[element]!) {
//                                         context.read<BlocSelectLevel>().changeUnSelect({"id-Level":element.id,"Un-Select":false});
//                                         listLevel.removeAt(listLevel.indexOf(element));
//                                       }
//                                     }
//                                     isSelect.removeWhere((key, value) => value);
//                                     setState(() {});
//                                   }catch(e){
//                                     // ignore: avoid_print
//                                     print(e);
//                                   }
//                                 },
//                                 icon: const Icon(Icons.delete_rounded),
//                               )),
//                           20.pw,
//                           countSelect <= 1
//                               ? Expanded(
//                                   flex: 0,
//                                   child: IconButton(
//                                     onPressed: () {
//                                       Navigator.push(context,MaterialPageRoute(
//                                           builder: (route) =>
//                                               BlocProvider<Bloc_Add_Level>(
//                                                 create: (BuildContext bc) =>
//                                                     Bloc_Add_Level(),
//                                                 // ignore: prefer_const_constructors
//                                                 child: AddLevel(
//                                                   listLevel: listLevel,
//                                                   indexUpdate: listLevel.indexOf(isSelect.keys.firstWhere((element) => isSelect[element]!)),
//                                                 ),
//                                               )) );
//                                     },
//                                     icon: const Icon(Icons.note_alt_rounded),
//                                   ))
//                               : const SizedBox(),
//                           20.pw
//                         ],
//                       )
//                     : const SizedBox()),
//           ],
//           centerTitle: true,
//           title: SizedBox(
//               width: 50,
//               height: 50,
//               child: Stack(children: [
//                 Pinned.fromPins(
//                   Pin(size: 45.0, start: 0.0),
//                   Pin(size: 40.0, start: 0.0),
//                   child: SvgPicture.string(
//                     _svg_oxph2,
//                     allowDrawingOutsideViewBox: true,
//                     fit: BoxFit.fill,
//                   ),
//                 ),
//                 // appeared level user on top layer
//                 //*
//                 Pinned.fromPins(
//                   Pin(size: 45.0, middle: 0.2),
//                   Pin(size: 40.0, middle: 1.8),
//                   child: Text.rich(
//                     // ignore: prefer_const_constructors
//                     TextSpan(
//                       text: '${User.level}',
//                       style: const TextStyle(
//                         fontFamily: 'PMingLiU-ExtB',
//                         fontSize: 11,
//                         color: Color(0xff707070),
//                       ),
//                     ),
//                     textHeightBehavior: const TextHeightBehavior(
//                         applyHeightToFirstAscent: false),
//                     textAlign: TextAlign.center,
//                     softWrap: false,
//                   ),
//                 )
//               ]))),
//       body: SafeArea(
//           child: Stack(
//         children: <Widget>[
//           Padding(
//               // ignore: prefer_const_constructors
//               padding: EdgeInsets.fromLTRB(26.0, 25.0, 10.0, 0.0),
//               child: SingleChildScrollView(
//                 primary: false,
//                 child: BlocListener<Bloc_CheckLevel, Map<String, String>>(
//                   listener: (bc, state) {
//                     bool checkSkipped = false;
//                     int nextIndexLevel = 0;
//                     if (state["id-Word"] != null) {
//                       for (var level in listLevel) {
//                         nextIndexLevel++;
//                         checkSkipped = false;
//                         if (level.listPhraseItem
//                             .any((element) => element.uprb.type == "4")) {
//                           checkSkipped = true;
//                         } else {
//                           checkSkipped = false;
//                         }
//                         for (var phrase in level.listPhraseItem) {
//                           for (var word in phrase.listWord) {
//                             if (word.id == state["id-Word"]) {
//                               if (level.listPhraseItem.last == phrase &&
//                                   phrase.listWord.last == word) {
//                                 User.setLevel(phrase.level + 1);
//                                 if (checkSkipped) {
//                                   level.setType("skip");
//                                 } else {
//                                   level.setType("complete");
//                                 }
//                                 if (nextIndexLevel < listLevel.length) {
//                                   if (listLevel[nextIndexLevel].type == "") {
//                                     listLevel[nextIndexLevel].setType("start");
//                                     listLevel[nextIndexLevel]
//                                         .listPhraseItem
//                                         .first
//                                         .uprb
//                                         .setType("1");
//                                     listLevel[nextIndexLevel]
//                                         .listPhraseItem
//                                         .first
//                                         .listWord
//                                         .first
//                                         .uwrb
//                                         .setType("3");
//                                   }
//                                 }
//                               }
//                             }
//                           }
//                         }
//                       }
//                     }
//                     setState(() {});
//                   },
//                   child: Wrap(
//                     alignment: WrapAlignment.center,
//                     spacing: 20,
//                     runSpacing: 20,
//                     children: listLevel.map((itemData) {
//                       return BlocBuilder<BlocSelectLevel, Map<String, dynamic>>(
//                           builder: (bc, state) {
//                         return BlocBuilder<BlocManageLevel,Map<String,dynamic>>(
//                             buildWhen: (previos,next){
//                               try{
//                                 if(next.containsKey("Add")){
//
//                                   return true;
//                                 }else{
//                                   return false;
//                                 }
//                               }catch(e){
//                                 print("Error in blocManageLevel in Page home_page ===>" + e.toString());
//                                 return false;
//                               }
//                             },
//                             builder: (bc,state)=> ButtonLevel(
//                           level: itemData,
//                         ));
//                       });
//                     }).toList(),
//                   ),
//                 ),
//               )),
//           Pinned.fromPins(
//             Pin(start: 0.0, end: 0.0),
//             Pin(size: 86.0, end: -1.0),
//             child: Stack(
//               children: <Widget>[
//                 Align(
//                   alignment: Alignment.bottomRight,
//                   child: SizedBox(
//                     width: size.width * 0.495,
//                     height: 61.0,
//                     child: ElevatedButton(
//                       style: ButtonStyle(
//                         // ignore: prefer_const_constructors
//                         textStyle: MaterialStateProperty.all(
//                             const TextStyle(fontWeight: FontWeight.normal)),
//                         backgroundColor:
//                             MaterialStateProperty.all(Colors.transparent),
//                         // ignore: prefer_const_constructors
//                         padding: MaterialStateProperty.all(EdgeInsets.all(0.0)),
//                         foregroundColor:
//                             MaterialStateProperty.all(Colors.transparent),
//                         shadowColor:
//                             MaterialStateProperty.all(Colors.transparent),
//                         shape: MaterialStateProperty.all(RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(20.0))),
//                       ),
//                       onPressed: () {
//                         try {
//                           AlertDialogShow.showAlertDialog(context);
//                           // ignore: prefer_const_constructors
//                           Future.delayed(Duration(seconds: 1), () {
//                             Navigator.pop(context);
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (route) =>
//                                         profile_page(Level: User.level)));
//                           });
//                         } catch (e, s) {
//                           // ignore: avoid_print
//                           print(s);
//                         }
//                       },
//                       child: Stack(
//                         children: <Widget>[
//                           Container(
//                             decoration: BoxDecoration(
//                               color: const Color(0xffd4af37),
//                               borderRadius: const BorderRadius.only(
//                                 topRight: Radius.circular(20.0),
//                               ),
//                               border: Border.all(
//                                   width: 1.0, color: const Color(0xffd4af37)),
//                             ),
//                           ),
//                           Align(
//                             // ignore: prefer_const_constructors
//                             alignment: Alignment(-0.054, 0.0),
//                             child: SizedBox(
//                               width: 27.0,
//                               height: 27.0,
//                               child: Stack(
//                                 children: <Widget>[
//                                   SizedBox.expand(
//                                       child: SvgPicture.string(
//                                     _svg_hznry0,
//                                     allowDrawingOutsideViewBox: true,
//                                     fit: BoxFit.fill,
//                                   )),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//
//                 // Add Page Button
//                 //*
//                 Align(
//                   alignment: Alignment.bottomLeft,
//                   child: SizedBox(
//                     width: size.width * 0.495,
//                     height: 61.0,
//                     child: ElevatedButton(
//                       style: ButtonStyle(
//                         // ignore: prefer_const_constructors
//                         textStyle: MaterialStateProperty.all(
//                             const TextStyle(fontWeight: FontWeight.normal)),
//                         backgroundColor:
//                             MaterialStateProperty.all(Colors.transparent),
//                         // ignore: prefer_const_constructors
//                         padding: MaterialStateProperty.all(EdgeInsets.all(0.0)),
//                         foregroundColor:
//                             MaterialStateProperty.all(Colors.transparent),
//                         shadowColor:
//                             MaterialStateProperty.all(Colors.transparent),
//                         shape: MaterialStateProperty.all(RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(20.0))),
//                       ),
//                       onPressed: () {
//                         try {
//                           AlertDialogShow.showAlertDialog(context);
//                           // ignore: prefer_const_constructors
//                           Future.delayed(Duration(seconds: 1), () {
//                             Navigator.pop(context);
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (route) => add_page(
//                                           level: listLevel
//                                               .firstWhere((element) =>
//                                                   element.type == "start"),
//                                         )));
//                           });
//                         } catch (e, s) {
//                           // ignore: avoid_print
//                           print(s);
//                         }
//                       },
//                       child: Stack(
//                         children: <Widget>[
//                           Container(
//                             decoration: BoxDecoration(
//                               color: const Color(0xffd4af37),
//                               borderRadius: const BorderRadius.only(
//                                 topLeft: Radius.circular(20.0),
//                               ),
//                               border: Border.all(
//                                   width: 1.0, color: const Color(0xffd4af37)),
//                             ),
//                           ),
//                           Align(
//                             // ignore: prefer_const_constructors
//                             alignment: Alignment(-0.054, -0.029),
//                             child: User.typeUser == TypeUser.Admin
//                                 ? const Icon(
//                                     Icons.add,
//                                     color: Colors.white,
//                                     size: 35.0,
//                                   )
//                                 : const Icon(
//                                     Icons.library_books,
//                                     color: Colors.white,
//                                     size: 35.0,
//                                   ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 //*/
//
//                 // if user == admin appeared + to add book
//                 // else user == study user transfer to read page
//                 //*
//                 Align(
//                   alignment: Alignment.topCenter,
//                   child: SizedBox(
//                     width: 50.0,
//                     height: 50.0,
//                     child: Stack(
//                       children: <Widget>[
//                         Container(
//                           decoration: BoxDecoration(
//                             color:
//                                 Theme.of(context).appBarTheme.backgroundColor,
//                             borderRadius: const BorderRadius.all(
//                                 Radius.elliptical(9999.0, 9999.0)),
//                             border: Border.all(
//                                 width: 6.0,
//                                 color:
//                                     Theme.of(context).scaffoldBackgroundColor,
//                                 strokeAlign: StrokeAlign.outside),
//                           ),
//                         ),
//                         Center(
//                           child: IconButton(
//                             padding: const EdgeInsets.all(0.0),
//                             iconSize: 40,
//                             color:
//                                 Theme.of(context).appBarTheme.iconTheme!.color,
//                             onPressed: () async {
//                               if (User.typeUser == TypeUser.Admin) {
//                                 try {
//                                   // File? file = await get_file_pdf.pickFile();
//                                   // if (file != null) {
//                                   //   setState(() {
//                                   //     listLevel.add({
//                                   //       "Name": file.path
//                                   //           .split("/")
//                                   //           .last
//                                   //           .replaceFirst(".pdf", ""),
//                                   //       "Path": file.path
//                                   //     });
//                                   //   });
//                                   //   Navigator.push(context, MaterialPageRoute(builder: (route) => Display_File_PDF(file: file,)));
//                                   // }
//                                   // ignore: prefer_const_constructors
//                                   Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (route) =>
//                                               BlocProvider<Bloc_Add_Level>(
//                                                 create: (BuildContext bc) =>
//                                                     Bloc_Add_Level(),
//                                                 // ignore: prefer_const_constructors
//                                                 child: AddLevel(
//                                                   listLevel: listLevel,
//                                                 ),
//                                               )));
//                                 } catch (e, s) {
//                                   // ignore: avoid_print
//                                   print(s);
//                                 }
//                               } else {
//                                 try {
//                                   listPhraseItem = listLevel
//                                       .firstWhere(
//                                           (element) => element.type == "start")
//                                       .listPhraseItem;
//                                   // ignore: prefer_const_literals_to_create_immutables
//                                   if (listPhraseItem.isNotEmpty &&
//                                       listPhraseItem.contains(
//                                           listPhraseItem.firstWhere((element) =>
//                                               element.uprb.type == "1"))) {
//                                     Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                             builder: (route) =>
//                                                 read_page(listPhrase: [
//                                                   listPhraseItem.firstWhere(
//                                                       (element) =>
//                                                           element.uprb.type ==
//                                                           "1")
//                                                 ])));
//                                   }
//                                 } catch (e) {
//                                   // ignore: avoid_print
//                                   print(e);
//                                 }
//                               }
//                             },
//                             icon: User.typeUser == TypeUser.Admin
//                                 ? const Icon(
//                                     Icons.add,
//                                   )
//                                 : const Icon(
//                                     Icons.electric_bolt_rounded,
//                                     size: 25.0,
//                                   ),
//                             tooltip: "Add File",
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 //*/
//               ],
//             ),
//           ),
//           //*/
//         ],
//       )),
//     );
//   }
// }
//
// // ignore: constant_identifier_names
// const String _svg_hznry0 =
//     '<svg viewBox="0.0 0.0 27.0 27.0" ><path transform="translate(-4.5, -4.5)" d="M 29.25 31.5 C 29.25 31.5 31.5 31.5 31.5 29.25 C 31.5 27 29.25 20.25 18 20.25 C 6.75 20.25 4.5 27 4.5 29.25 C 4.5 31.5 6.75 31.5 6.75 31.5 L 29.25 31.5 Z M 6.76099967956543 29.37599945068359 L 6.76099967956543 29.37100028991699 L 6.76099967956543 29.37599945068359 Z M 6.798999786376953 29.25 L 29.19999885559082 29.25 C 29.21070671081543 29.24861335754395 29.22137641906738 29.24694633483887 29.23199844360352 29.24499893188477 L 29.24999809265137 29.2400016784668 C 29.24799728393555 28.68700218200684 28.90399742126465 27.0210018157959 27.37799835205078 25.49600219726562 C 25.9109992980957 24.03000068664551 23.14999961853027 22.5 18 22.5 C 12.84799957275391 22.5 10.0890007019043 24.03000068664551 8.621999740600586 25.49699974060059 C 7.095999717712402 27.02299880981445 6.75499963760376 28.6870002746582 6.75 29.24099922180176 C 6.766301155090332 29.24417114257812 6.782635688781738 29.24717140197754 6.798999786376953 29.25 Z M 29.24099922180176 29.37599945068359 L 29.24099922180176 29.37100028991699 L 29.24099922180176 29.37599945068359 Z M 18 15.75 C 20.48528099060059 15.75 22.5 13.73528099060059 22.5 11.25 C 22.5 8.764719009399414 20.48528099060059 6.75 18 6.75 C 15.51471900939941 6.75 13.5 8.764719009399414 13.5 11.25 C 13.5 13.73528099060059 15.51471900939941 15.75 18 15.75 Z M 24.75 11.25 C 24.75 14.9779224395752 21.7279224395752 18 18 18 C 14.2720775604248 18 11.25 14.9779224395752 11.25 11.25 C 11.25 7.522077560424805 14.2720775604248 4.5 18 4.5 C 21.7279224395752 4.5 24.75 7.522078037261963 24.75 11.25 Z" fill="#fbefef" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// // ignore: constant_identifier_names
// const String _svg_oxph2 =
//     '<svg viewBox="139.3 8.5 45.0 36.0" ><path transform="translate(139.3, 8.5)" d="M 37.125 31.5 L 7.875 31.5 C 7.256249904632568 31.5 6.75 32.00624847412109 6.75 32.625 L 6.75 34.875 C 6.75 35.49375152587891 7.256249904632568 36 7.875 36 L 37.125 36 C 37.74375152587891 36 38.25 35.49375152587891 38.25 34.875 L 38.25 32.625 C 38.25 32.00624847412109 37.74375152587891 31.5 37.125 31.5 Z M 41.625 9 C 39.76171875 9 38.25 10.51171875 38.25 12.375 C 38.25 12.87421894073486 38.36249923706055 13.33828163146973 38.55937576293945 13.76718711853027 L 33.46875 16.81875038146973 C 32.38593673706055 17.46562576293945 30.98671913146973 17.10000038146973 30.36093711853027 16.00312614440918 L 24.63046836853027 5.9765625 C 25.3828125 5.357812404632568 25.875 4.4296875 25.875 3.375 C 25.875 1.51171875 24.36328125 0 22.5 0 C 20.63671875 0 19.125 1.51171875 19.125 3.375 C 19.125 4.4296875 19.6171875 5.357812404632568 20.36953163146973 5.9765625 L 14.63906288146973 16.00312423706055 C 14.01328182220459 17.09999847412109 12.60703182220459 17.46562385559082 11.53125 16.81874847412109 L 6.447656154632568 13.76718616485596 C 6.637499809265137 13.34531116485596 6.757030963897705 12.87421703338623 6.757030963897705 12.37499904632568 C 6.757030963897705 10.51171779632568 5.245312213897705 8.999999046325684 3.382030963897705 8.999999046325684 C 1.518749713897705 8.999999046325684 0 10.51171875 0 12.375 C 0 14.23828125 1.51171875 15.75 3.375 15.75 C 3.557812452316284 15.75 3.740624904632568 15.72187519073486 3.916406154632568 15.69375038146973 L 9 29.25 L 36 29.25 L 41.08359527587891 15.69375038146973 C 41.25937652587891 15.72187519073486 41.44218826293945 15.75 41.625 15.75 C 43.48828125 15.75 45 14.23828125 45 12.375 C 45 10.51171875 43.48828125 9 41.625 9 Z" fill="#d9df30" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
