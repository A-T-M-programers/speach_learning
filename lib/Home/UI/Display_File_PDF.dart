import 'dart:io';
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:speach_learning/AlertDialog.dart';
import 'package:speach_learning/Process_Class/Filter_Text.dart';
import 'package:speach_learning/Read/UI/BottomSheet.dart';
import 'package:speach_learning/Read/UI/read_page.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

// ignore: camel_case_types, must_be_immutable
class Display_File_PDF extends StatefulWidget {
  Display_File_PDF({Key? key, required this.file}) : super(key: key);

  File? file;

  @override
  State<Display_File_PDF> createState() => _Display_File_PDFState();
}

// ignore: camel_case_types
class _Display_File_PDFState extends State<Display_File_PDF> {
  int pageNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff888579),
        actions: [
          TextButton(
            child: const Text(
              "Select",
              style: TextStyle(color: Colors.white70),
            ),
            onPressed: () async {
              try {
                await AlertDialogShow.showAlertDialog(context);
                getFile().then((value){
                  print("value");
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (route) => read_page(text_read: value)));
                });
              } on SocketException catch (_) {
                bottomSheet
                    .showbottomsheet(context, {"Problem": "err_Network"});
                // ignore: avoid_print
                print('not connected');
              }
            },
          )
        ],
      ),
      body: PDFView(
        filePath: widget.file!.path,
        enableSwipe: true,
        // ignore: non_constant_identifier_names
        onPageChanged: (page_number, total) {
          setState(() {
            pageNumber = page_number!;
          });
        },
      ),
    );
  }

  Future<List<Map<String, String>>> getFile() async {
    final result = await compute(InternetAddress.lookup,'example.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      // ignore: avoid_print
      print('connected');
      PdfDocument document = await compute<List<int>,PdfDocument>((message) => PdfDocument(inputBytes: message),widget.file!.readAsBytesSync());
      //Extract the text from all the pages.
      String text = await compute<int?,String>((message) => PdfTextExtractor(document).extractText(startPageIndex: message),pageNumber);
      //Dispose the document.
      document.dispose();

      return await compute<String,List<Map<String,String>>>( (message) => getListWords(message),text);
    }
    return [];
  }

}
List<Map<String, String>> getListWords(String text) {
  List<String> listWordPDF = text.split(" ");
  List<Map<String, String>> wordsList = [];
  String word = "";
  for (int i = 0; i < listWordPDF.length; i++) {
    word = Filter_Text.substring(listWordPDF[i].trim());
    if (word != "") {
      wordsList.add({"Name": word, "type": "2"});
    }
  }
  wordsList[0]["type"] = "3";
  return wordsList;
}
