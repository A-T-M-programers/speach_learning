// import 'dart:io';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_pdfview/flutter_pdfview.dart';
// import 'package:speach_learning/AlertDialog.dart';
// import 'package:speach_learning/Process_Class/PhraseItem.dart';
// import 'package:speach_learning/Domain/Entity/Participants.dart';
// import 'package:speach_learning/Process_Class/Word.dart';
// import 'package:speach_learning/Read/Widget/BottomSheet.dart';
// import 'package:speach_learning/Read/UI/read_page.dart';
// import 'package:syncfusion_flutter_pdf/pdf.dart';
//
// // ignore: camel_case_types, must_be_immutable
// class Display_File_PDF extends StatefulWidget {
//   Display_File_PDF({Key? key, required this.file}) : super(key: key);
//
//   File? file;
//
//   @override
//   State<Display_File_PDF> createState() => _Display_File_PDFState();
// }
//
// // ignore: camel_case_types
// class _Display_File_PDFState extends State<Display_File_PDF> {
//   int pageNumber = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color(0xff888579),
//         actions: [
//           TextButton(
//             child: const Text(
//               "Select",
//               style: TextStyle(color: Colors.white70),
//             ),
//             onPressed: () async {
//               try {
//                 await AlertDialogShow.showAlertDialog(context);
//                 getFile().then((value){
//                   // ignore: avoid_print
//                   print("value");
//                   Navigator.pop(context);
//                   Navigator.push(context, MaterialPageRoute(builder: (route) => read_page(listPhrase: value)));
//                 });
//               } on SocketException catch (_) {
//                 bottomSheet.showbottomsheet(context, {"Problem": "err_Network"});
//                 // ignore: avoid_print
//                 print('not connected');
//               }
//             },
//           )
//         ],
//       ),
//       body: PDFView(
//         filePath: widget.file!.path,
//         enableSwipe: true,
//         // ignore: non_constant_identifier_names
//         onPageChanged: (page_number, total) {
//           setState(() {
//             pageNumber = page_number!;
//           });
//         },
//       ),
//     );
//   }
//
//   Future<List<PhraseItem>> getFile() async {
//     final result = await compute(InternetAddress.lookup,'example.com');
//     if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
//       // ignore: avoid_print
//       print('connected');
//       PdfDocument document = await compute<List<int>,PdfDocument>((message) => PdfDocument(inputBytes: message),widget.file!.readAsBytesSync());
//       //Extract the text from all the pages.
//       String text = await compute<int?,String>((message) => PdfTextExtractor(document).extractText(startPageIndex: message),pageNumber);
//       //Dispose the document.
//       document.dispose();
//
//       return await compute<String,List<PhraseItem>>( (message) => getListWords(message),text);
//     }
//     return [];
//   }
//
// }
// List<PhraseItem> getListWords(String text) {
//   List<String> listPhrasePDF = text.replaceAll('.',',').replaceAll('?', ',').split(',');
//   List<PhraseItem> listPhraseItem = List.generate(listPhrasePDF.length,
//           (index) => PhraseItem(data:
//           {
//             "id":"$index",
//             "Type":"Normal",
//             "Index":index,
//             "Word-Count":listPhrasePDF[index].split(RegExp(r'(\w+)')).length,
//             "List-Word":List.generate(listPhrasePDF[index].split(RegExp(r'(\w+)')).length,
//                     (indexword) => Word(data:
//                     {
//                       "id":"$indexword",
//                       "Content":listPhrasePDF[index].split(RegExp(r'(\w+)'))[indexword].trim(),
//                       "Trans":"",
//                       "Index":indexword,
//                       "PhraseNumber":index,
//                       "Type":"Pronoun",
//                       "Word-In-Phrase":"",
//                       "Trans-In-Phrase":"",
//                       "UWRB":UWRB(data: {"id-User":Participants.id,"Type":"2"})
//                     })),
//             "List-PWRB":List.generate(listPhrasePDF[index].split(RegExp(r'(\w+)')).length,
//                     (indexword) => PWRB(data: {
//                       "id-Phrase":"$index",
//                       "id-Word":"$indexword",
//                       "Index":indexword
//                     })),
//           "UPRB":UPRB(data: {"id-Phrase":"$index","Type":"0"})
//           }));
//   return listPhraseItem;
// }
