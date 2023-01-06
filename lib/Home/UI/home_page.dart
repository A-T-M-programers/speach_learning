import 'dart:io';

import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:speach_learning/AlertDialog.dart';
import 'package:speach_learning/Profile/UI/profile_page.dart';

import '../../AddText/UI/add_page.dart';
import '../Controle/Get_File_PDF.dart';
import 'Display_File_PDF.dart';

// ignore: camel_case_types
class home_page extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  home_page({
    Key? key,
  }) : super(key: key);

  @override
  State<home_page> createState() => _home_pageState();
}

// ignore: camel_case_types
class _home_pageState extends State<home_page> {
  // ignore: prefer_const_constructors
  Size size = Size(0.0, 0.0);

  TextEditingController search = TextEditingController();

  // ignore: non_constant_identifier_names
  Get_File_PDF get_file_pdf = Get_File_PDF();

  List<Map<String, String>> books = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
          child: Stack(
        children: <Widget>[
          Padding(
            // ignore: prefer_const_constructors
            padding: EdgeInsets.fromLTRB(26.0, 83.0, 10.0, 0.0),
            child: SingleChildScrollView(
              primary: false,
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 20,
                runSpacing: 20,
                children: books.map((itemData) {
                  return SizedBox(
                    width: 110.0,
                    height: 160.0,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        // ignore: prefer_const_constructors
                        textStyle: MaterialStateProperty.all(
                            TextStyle(fontWeight: FontWeight.normal)),
                        backgroundColor:
                        MaterialStateProperty.all(Colors.transparent),
                        // ignore: prefer_const_constructors
                        padding: MaterialStateProperty.all(EdgeInsets.all(0.0)),
                        foregroundColor:
                        MaterialStateProperty.all(Colors.transparent),
                        shadowColor:
                        MaterialStateProperty.all(Colors.transparent),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0))),
                      ),
                      onPressed: () {
                        try {
                          AlertDialogShow.showAlertDialog(context);
                          // ignore: prefer_const_constructors
                          Future.delayed(Duration(seconds: 1), () {
                            Navigator.pop(context);
                            Navigator.push(context, MaterialPageRoute(builder: (route) => Display_File_PDF(file: File(itemData["Path"]!))));
                          });
                        } catch (e, s) {
                          print(s);
                        }
                      },
                      child: Stack(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              border: Border.all(
                                  width: 1.0, color: const Color(0xffe2e0d5)),
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(start: 6.0, end: 6.7),
                            Pin(size: 107.0, start: 9.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xffffffff),
                                border: Border.all(
                                    width: 1.0, color: const Color(0x00707070)),
                              ),
                              child: PDFView(
                                filePath: itemData["Path"],
                                enableSwipe: false,
                                defaultPage: 0,
                              ),
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(size: 80.0, middle: 0.5),
                            Pin(size: 30.0, end: 05.0),
                            child: Text(
                              itemData["Name"]!,
                              style: TextStyle(
                                fontFamily: 'Sakkal Majalla',
                                fontSize: 10,
                                color: Theme.of(context).textTheme.headline2!.color,
                                fontWeight: FontWeight.w700,
                              ),
                              softWrap: true,
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(start: 5.9, end: 6.9),
                            Pin(size: 97.0, start: 9.0),
                            child: Container(
                              decoration: BoxDecoration(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(size: 53.0, start: 0.0),
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).appBarTheme.backgroundColor,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 124.0, end: 19.5),
                  Pin(size: 28.5, middle: 0.5306),
                  child: TextFormField(
                    style: TextStyle(color: Theme.of(context).textTheme.headline1!.color),
                    enabled: true,
                    controller: search,
                    decoration: InputDecoration(
                        icon: Icon(Icons.search,color: Theme.of(context).appBarTheme.iconTheme!.color,),
                        hintText: "Search",
                        hintStyle: TextStyle(color: Theme.of(context).textTheme.headline1!.color),),
                    onChanged: (value) {},
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(size: 86.0, end: -1.0),
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.bottomRight,
                  child: SizedBox(
                    width: size.width * 0.495,
                    height: 61.0,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        // ignore: prefer_const_constructors
                        textStyle: MaterialStateProperty.all(
                            TextStyle(fontWeight: FontWeight.normal)),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.transparent),
                        // ignore: prefer_const_constructors
                        padding: MaterialStateProperty.all(EdgeInsets.all(0.0)),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.transparent),
                        shadowColor:
                            MaterialStateProperty.all(Colors.transparent),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0))),
                      ),
                      onPressed: () {
                        try {
                          AlertDialogShow.showAlertDialog(context);
                          // ignore: prefer_const_constructors
                          Future.delayed(Duration(seconds: 1), () {
                            Navigator.pop(context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (route) => profile_page()));
                          });
                        } catch (e, s) {
                          print(s);
                        }
                      },
                      child: Stack(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xffd4af37),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20.0),
                              ),
                              border: Border.all(
                                  width: 1.0, color: const Color(0xffd4af37)),
                            ),
                          ),
                          Align(
                            alignment: Alignment(-0.054, 0.0),
                            child: SizedBox(
                              width: 27.0,
                              height: 27.0,
                              child: Stack(
                                children: <Widget>[
                                  SizedBox.expand(
                                      child: SvgPicture.string(
                                    _svg_hznry0,
                                    allowDrawingOutsideViewBox: true,
                                    fit: BoxFit.fill,
                                  )),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: SizedBox(
                    width: size.width * 0.495,
                    height: 61.0,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        // ignore: prefer_const_constructors
                        textStyle: MaterialStateProperty.all(
                            TextStyle(fontWeight: FontWeight.normal)),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.transparent),
                        // ignore: prefer_const_constructors
                        padding: MaterialStateProperty.all(EdgeInsets.all(0.0)),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.transparent),
                        shadowColor:
                            MaterialStateProperty.all(Colors.transparent),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0))),
                      ),
                      onPressed: () {
                        try {
                          AlertDialogShow.showAlertDialog(context);
                          // ignore: prefer_const_constructors
                          Future.delayed(Duration(seconds: 1), () {
                            Navigator.pop(context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (route) => add_page()));
                          });
                        } catch (e, s) {
                          print(s);
                        }
                      },
                      child: Stack(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xffd4af37),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                              ),
                              border: Border.all(
                                  width: 1.0, color: const Color(0xffd4af37)),
                            ),
                          ),
                          Align(
                            alignment: Alignment(-0.054, -0.029),
                            child: SizedBox(
                              width: 26.0,
                              height: 26.0,
                              child: SvgPicture.string(
                                _svg_yb3s61,
                                allowDrawingOutsideViewBox: true,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius: const BorderRadius.all(
                                Radius.elliptical(9999.0, 9999.0)),
                            border: Border.all(
                                width: 6.0,
                                color: Theme.of(context).scaffoldBackgroundColor,
                                strokeAlign: StrokeAlign.outside),
                          ),
                        ),
                        Center(
                          child: IconButton(
                            padding: const EdgeInsets.all(0.0),
                            iconSize: 40,
                            color: Theme.of(context).appBarTheme.iconTheme!.color,
                            onPressed: () async {
                              try {
                                File? file = await get_file_pdf.pickFile();
                                if (file != null) {
                                  setState(() {
                                    books.add({
                                      "Name": file.path
                                          .split("/")
                                          .last
                                          .replaceFirst(".pdf", ""),
                                      "Path": file.path
                                    });
                                  });
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (route) => Display_File_PDF(
                                                file: file,
                                              )));
                                }
                              } catch (e, s) {
                                print(s);
                              }
                            },
                            icon: const Icon(
                              Icons.add,
                            ),
                            tooltip: "Add File",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(size: 45.0, start: 20.0),
            Pin(size: 36.0, start: 8.5),
            child: SvgPicture.string(
              _svg_oxph2,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 20.0, start: 33.0),
            Pin(size: 14.0, start: 25.0),
            child: Text.rich(
              TextSpan(
                style: TextStyle(
                  fontFamily: 'PMingLiU-ExtB',
                  fontSize: 11,
                  color: const Color(0xff707070),
                ),
                children: [
                  TextSpan(
                    text: '999',
                    style: TextStyle(
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.center,
              softWrap: false,
            ),
          ),
        ],
      )),
    );
  }
}

const String _svg_hznry0 =
    '<svg viewBox="0.0 0.0 27.0 27.0" ><path transform="translate(-4.5, -4.5)" d="M 29.25 31.5 C 29.25 31.5 31.5 31.5 31.5 29.25 C 31.5 27 29.25 20.25 18 20.25 C 6.75 20.25 4.5 27 4.5 29.25 C 4.5 31.5 6.75 31.5 6.75 31.5 L 29.25 31.5 Z M 6.76099967956543 29.37599945068359 L 6.76099967956543 29.37100028991699 L 6.76099967956543 29.37599945068359 Z M 6.798999786376953 29.25 L 29.19999885559082 29.25 C 29.21070671081543 29.24861335754395 29.22137641906738 29.24694633483887 29.23199844360352 29.24499893188477 L 29.24999809265137 29.2400016784668 C 29.24799728393555 28.68700218200684 28.90399742126465 27.0210018157959 27.37799835205078 25.49600219726562 C 25.9109992980957 24.03000068664551 23.14999961853027 22.5 18 22.5 C 12.84799957275391 22.5 10.0890007019043 24.03000068664551 8.621999740600586 25.49699974060059 C 7.095999717712402 27.02299880981445 6.75499963760376 28.6870002746582 6.75 29.24099922180176 C 6.766301155090332 29.24417114257812 6.782635688781738 29.24717140197754 6.798999786376953 29.25 Z M 29.24099922180176 29.37599945068359 L 29.24099922180176 29.37100028991699 L 29.24099922180176 29.37599945068359 Z M 18 15.75 C 20.48528099060059 15.75 22.5 13.73528099060059 22.5 11.25 C 22.5 8.764719009399414 20.48528099060059 6.75 18 6.75 C 15.51471900939941 6.75 13.5 8.764719009399414 13.5 11.25 C 13.5 13.73528099060059 15.51471900939941 15.75 18 15.75 Z M 24.75 11.25 C 24.75 14.9779224395752 21.7279224395752 18 18 18 C 14.2720775604248 18 11.25 14.9779224395752 11.25 11.25 C 11.25 7.522077560424805 14.2720775604248 4.5 18 4.5 C 21.7279224395752 4.5 24.75 7.522078037261963 24.75 11.25 Z" fill="#fbefef" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_yb3s61 =
    '<svg viewBox="87.5 902.9 26.0 26.0" ><path transform="translate(82.52, 897.94)" d="M 30 17 L 19 17 L 19 6 C 19 5.447715282440186 18.55228424072266 5 18 5 C 17.44771575927734 5 17 5.447715282440186 17 6 L 17 17 L 6 17 C 5.447715282440186 17 5 17.44771575927734 5 18 C 4.990014553070068 18.2629508972168 5.094343185424805 18.5173511505127 5.286075115203857 18.69757843017578 C 5.477806568145752 18.8778076171875 5.738167762756348 18.96621704101562 5.999999523162842 18.94000244140625 L 17 18.94000053405762 L 17 30 C 17 30.55228424072266 17.44771575927734 31 18 31 C 18.55228424072266 31 19 30.55228424072266 19 30 L 19 19 L 30 19 C 30.55228424072266 19 31 18.55228424072266 31 18 C 31 17.44771575927734 30.55228424072266 17 30 17 Z" fill="#fbf9f9" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_oxph2 =
    '<svg viewBox="139.3 8.5 45.0 36.0" ><path transform="translate(139.3, 8.5)" d="M 37.125 31.5 L 7.875 31.5 C 7.256249904632568 31.5 6.75 32.00624847412109 6.75 32.625 L 6.75 34.875 C 6.75 35.49375152587891 7.256249904632568 36 7.875 36 L 37.125 36 C 37.74375152587891 36 38.25 35.49375152587891 38.25 34.875 L 38.25 32.625 C 38.25 32.00624847412109 37.74375152587891 31.5 37.125 31.5 Z M 41.625 9 C 39.76171875 9 38.25 10.51171875 38.25 12.375 C 38.25 12.87421894073486 38.36249923706055 13.33828163146973 38.55937576293945 13.76718711853027 L 33.46875 16.81875038146973 C 32.38593673706055 17.46562576293945 30.98671913146973 17.10000038146973 30.36093711853027 16.00312614440918 L 24.63046836853027 5.9765625 C 25.3828125 5.357812404632568 25.875 4.4296875 25.875 3.375 C 25.875 1.51171875 24.36328125 0 22.5 0 C 20.63671875 0 19.125 1.51171875 19.125 3.375 C 19.125 4.4296875 19.6171875 5.357812404632568 20.36953163146973 5.9765625 L 14.63906288146973 16.00312423706055 C 14.01328182220459 17.09999847412109 12.60703182220459 17.46562385559082 11.53125 16.81874847412109 L 6.447656154632568 13.76718616485596 C 6.637499809265137 13.34531116485596 6.757030963897705 12.87421703338623 6.757030963897705 12.37499904632568 C 6.757030963897705 10.51171779632568 5.245312213897705 8.999999046325684 3.382030963897705 8.999999046325684 C 1.518749713897705 8.999999046325684 0 10.51171875 0 12.375 C 0 14.23828125 1.51171875 15.75 3.375 15.75 C 3.557812452316284 15.75 3.740624904632568 15.72187519073486 3.916406154632568 15.69375038146973 L 9 29.25 L 36 29.25 L 41.08359527587891 15.69375038146973 C 41.25937652587891 15.72187519073486 41.44218826293945 15.75 41.625 15.75 C 43.48828125 15.75 45 14.23828125 45 12.375 C 45 10.51171875 43.48828125 9 41.625 9 Z" fill="#d9df30" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
