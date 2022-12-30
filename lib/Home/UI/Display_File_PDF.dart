import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:speach_learning/Process_Class/Filter_Text.dart';
import 'package:speach_learning/Read/UI/BottomSheet.dart';
import 'package:speach_learning/Read/UI/read_page.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

import '../../Read/bloc/Bloc_Controler_Read.dart';

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
                final result = await InternetAddress.lookup('example.com');
                if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
                  // ignore: avoid_print
                  print('connected');
                  String word = "";
                  List<Map<String, String>> wordsList = [];
                  final PdfDocument document =
                      PdfDocument(inputBytes: widget.file!.readAsBytesSync());
                  //Extract the text from all the pages.
                  String text = PdfTextExtractor(document)
                      .extractText(startPageIndex: pageNumber);
                  //Dispose the document.
                  document.dispose();

                  List<String> listWordPDF = text.split(" ");
                  for (int i = 0; i < listWordPDF.length; i++) {
                    word = Filter_Text.substring(listWordPDF[i].trim());
                    if (word != "") {
                      wordsList.add({"Name": word, "type": "2"});
                    }
                  }
                  wordsList[0]["type"] = "3";
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (route) => BlocProvider(
                              create: (_) =>
                                  Bloc_Controler(),
                              child: read_page(text_read: wordsList))));
                }
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
}
