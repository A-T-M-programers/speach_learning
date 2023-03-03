import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speach_learning/LogIn/UI/log_in.dart';
import 'ButtonDrage.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../bloc/blocSplashScreen.dart';

// ignore: camel_case_types
class Splash_Screen extends StatefulWidget {
  const Splash_Screen({Key? key}) : super(key: key);

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

// ignore: camel_case_types
class _Splash_ScreenState extends State<Splash_Screen> {
  // ignore: non_constant_identifier_names
  double Width = 0.0, Hieght = 0.0;

  // ignore: non_constant_identifier_names
  String arrow_right = "right";

  // ignore: non_constant_identifier_names
  bool is_arrow_right = false;

  // ignore: non_constant_identifier_names
  late Button_Draage button_draage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    button_draage = Button_Draage(icons: 0);
  }

  @override
  Widget build(BuildContext context) {
    Width = MediaQuery.of(context).size.width;
    Hieght = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              Pinned.fromPins(
                Pin(start: -1.1, end: 0.0),
                Pin(size: Hieght, start: 0.0),
                child: Stack(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffd4af37),
                        border: Border.all(
                            width: 1.0, color: const Color(0xffd4af37)),
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(start: 0.0, end: 0.0),
                      Pin(size: Hieght * 0.18, start: 0.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).appBarTheme.backgroundColor,
                          border: Border.all(
                              width: 1.0, color: Theme.of(context).appBarTheme.backgroundColor!),
                        ),
                      ),
                    ),
                    Container(
                      width: Width,
                      margin: EdgeInsets.only(top: (Hieght * 0.18) - 70.0),
                      child: get_svg_top_navbar(Width, context),
                    )
                  ],
                ),
              ),
              Pinned.fromPins(
                context.locale == Locale('en')? Pin(start: Width > Hieght? Width * 0.1 : Width * 0.17, end: -45.0):Pin(start: -45.0, end:Width > Hieght? Width * 0.1 : Width * 0.17),
                Pin(size: Hieght * 0.5, middle: Hieght >= Width ? 0.28 : 0.9),
                child: Transform.rotate(
                  angle: 0.3491,
                  child: Text(
                    'sl',
                    style: TextStyle(
                      fontFamily: 'Castellar',
                      fontSize: Hieght * 0.45,
                      color: Colors.white38,
                    ),
                    softWrap: false,
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0.09, Width > Hieght ? 0.2 : 0.600),
                child: SizedBox(
                  width: (Width * Hieght) * 0.0005,
                  height: (Width * Hieght) * 0.0004,
                  child: Stack(
                    children: <Widget>[
                      SizedBox.expand(
                          child: SvgPicture.string(
                        _svg_xqajra,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      )),
                      Center(
                          child: SizedBox(
                        width: (Width * Hieght) * 0.0005,
                        height: (Width * Hieght) * 0.0004,
                        child: Stack(
                          children: <Widget>[
                            Pinned.fromPins(
                              Pin(size: (Width * Hieght) * 0.00025, middle: 0.85),
                              Pin(start: 1.4, end: 1.4),
                              child: Stack(
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: SizedBox(
                                      width: 5.0,
                                      height: 26.0,
                                      child: SvgPicture.string(
                                        _svg_f8f66m,
                                        allowDrawingOutsideViewBox: true,
                                      ),
                                    ),
                                  ),
                                  Pinned.fromPins(
                                    Pin(size: 7.0, middle: 0.12),
                                    Pin(start: 30.0, end: 30.0),
                                    child: SvgPicture.string(
                                      _svg_f8f66m,
                                      allowDrawingOutsideViewBox: true,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Pinned.fromPins(
                                    Pin(size: 7.0, middle: 0.26),
                                    Pin(start: 40.0, end: 40.0),
                                    child: SvgPicture.string(
                                      _svg_f8f66m,
                                      allowDrawingOutsideViewBox: true,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Pinned.fromPins(
                                    Pin(size: 7.0, middle: 0.4),
                                    Pin(start: 45.0, end: 45.0),
                                    child: SvgPicture.string(
                                      _svg_f8f66m,
                                      allowDrawingOutsideViewBox: true,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Pinned.fromPins(
                              Pin(size: (Width * Hieght) * 0.00025, middle: 0.33),
                              Pin(start: 0.0, end: 0.0),
                              child: Stack(
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: SizedBox(
                                      width: 5.0,
                                      height: 26.0,
                                      child: SvgPicture.string(
                                        _svg_f8f66m,
                                        allowDrawingOutsideViewBox: true,
                                      ),
                                    ),
                                  ),
                                  Pinned.fromPins(
                                    Pin(size: 7.0, middle: 0.12),
                                    Pin(start: 30.0, end: 30.0),
                                    child: SvgPicture.string(
                                      _svg_f8f66m,
                                      allowDrawingOutsideViewBox: true,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Pinned.fromPins(
                                    Pin(size: 7.0, middle: 0.27),
                                    Pin(start: 40.0, end: 40.0),
                                    child: SvgPicture.string(
                                      _svg_f8f66m,
                                      allowDrawingOutsideViewBox: true,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Pinned.fromPins(
                                    Pin(size: 7.0, middle: 0.42),
                                    Pin(start: 45.0, end: 45.0),
                                    child: SvgPicture.string(
                                      _svg_f8f66m,
                                      allowDrawingOutsideViewBox: true,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ))
                    ],
                  ),
                ),
              ),
              Pinned.fromPins(
                Pin(start: 28.2, end: 28.2),
                Pin(size: 78.7, end: 10.1),
                child: SvgPicture.string(
                  _svg_t04il8,
                  allowDrawingOutsideViewBox: true,
                  fit: BoxFit.fill,
                ),
              ),
               Pinned.fromPins(
                  Pin(size: 50.0, start: 40.0),
                  Pin(size: 50.0, end: 26.0),
                      child: Draggable<String>(
                    onDragStarted: () {
                      context.read<blocSplashScreen>().changSize(54.0);
                    },
                    onDragEnd: (val) {
                      context.read<blocSplashScreen>().changSize(40.0);
                    },
                    axis: Axis.horizontal,
                    data: arrow_right,
                    child:  button_draage.build(),
                    feedback:  button_draage.build(),
                    childWhenDragging: const SizedBox(),
                  )),
              Pinned.fromPins(
                  Pin(size: Width * 0.4, end: 0.0),
                  Pin(size: 46.0, end: 28.0),
                  child: DragTarget<String>(
                    builder: (BuildContext context, List<dynamic> accepted,
                        List<dynamic> rejected) {
                      return Container(
                        height: 46.0,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        ),
                      );
                    },
                    onAccept: (data) {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => log_in()),
                          (route) => false);
                    },
                    onWillAccept: (data) {
                      return data == arrow_right;
                    },
                  )),
              Pinned.fromPins(
                context.locale == Locale('en')? Pin(start: Width > Hieght ? Width * 0.36 : Width * 0.2, end: 37.0):Pin(start: 37.0, end: Width > Hieght ? Width * 0.36 : Width * 0.2),
                Pin(size: 42.0, start: 20.0),
                child: const Text(
                  'Speech Learning',
                  style: TextStyle(
                    fontFamily: 'Castellar',
                    fontSize: 32,
                    color: Color(0xffdcdcdc),
                  ),
                  softWrap: false,
                ),
              ),
            ],
          ),
        ));
  }
}

// ignore: non_constant_identifier_names
Widget get_svg_top_navbar(double width,BuildContext context) {
  int length = 0;
  List<Widget> list = [];
  while (width > length * 142.0) {
    list.add(Expanded(
        child: Align(
      alignment: Alignment.topCenter,
      child: SizedBox(
        width: 142.0,
        height: 143.0,
        child: SvgPicture.string(
          _svg_p8cx,
          allowDrawingOutsideViewBox: true,
          fit: BoxFit.fill,
          color: Theme.of(context).appBarTheme.backgroundColor,
        ),
      ),
    )));
    length++;
  }
  return Row(
    children: list,
  );
}

// ignore: constant_identifier_names
const String _svg_p8cx =
    '<svg viewBox="-9.0 -2237.0 142.1 142.7" ><path transform="translate(-9.0, -2237.0)" d="M 71.05419158935547 0 C 110.2963409423828 0 142.1083831787109 30.21167373657227 142.1083831787109 67.47965240478516 C 142.1083831787109 104.7476425170898 80.732421875 163.8770599365234 71.05419158935547 134.9593048095703 C 61.3759765625 106.0415725708008 0 104.7476425170898 0 67.47965240478516 C 0 30.21167373657227 31.81204986572266 0 71.05419158935547 0 Z" fill="#888579" stroke="#888579" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// ignore: constant_identifier_names
const String _svg_f8f66m =
    '<svg viewBox="156.7 425.3 10.4 26.5" ><path transform="translate(156.75, 425.26)" d="M 5.126118659973145 0 C 10.65900325775146 -0.040435791015625 10.27263736724854 5.927684307098389 10.27263736724854 13.23985290527344 C 10.27263736724854 20.5520191192627 11.35083675384521 26.3504638671875 5.126118659973145 26.47970581054688 C -1.098599910736084 26.60894775390625 -0.02040053531527519 20.5520191192627 -0.02040053531527519 13.23985290527344 C -0.02040053531527519 5.927684307098389 -0.4067660570144653 0.040435791015625 5.126118659973145 0 Z" fill="#ddffcc" fill-opacity="0.62" stroke="#ddffcc" stroke-width="1" stroke-opacity="0.0" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// ignore: constant_identifier_names
const String _svg_xqajra =
    '<svg viewBox="145.0 200.0 174.3 134.0" ><path transform="translate(145.0, 200.0)" d="M 68.5 0 C 106.3314971923828 0 137 29.99692153930664 137 67 C 137 81.57921600341797 121.1419982910156 123.2044677734375 174.262451171875 129.71923828125 C 161.23291015625 134.2294921875 91.42588806152344 134 68.5 134 C 30.66849899291992 134 0 104.0030822753906 0 67 C 0 29.99692153930664 30.66849899291992 0 68.5 0 Z" fill="#554616" fill-opacity="0.81" stroke="#554616" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// ignore: constant_identifier_names
const String _svg_t04il8 =
    '<svg viewBox="28.2 840.1 371.7 75.7" ><path transform="translate(28.17, 839.7)" d="M 179.5 12.60638427734375 C 278.6351013183594 12.60638427734375 371.3125610351562 -27.627197265625 371.6506652832031 38.30181884765625 C 371.98876953125 104.2308349609375 278.6351013183594 63.99725341796875 179.5 63.99725341796875 C 80.36489105224609 63.99725341796875 0.2567634582519531 95.54144287109375 0 37 C -0.2567634582519531 -21.54144287109375 80.36489105224609 12.60638427734375 179.5 12.60638427734375 Z" fill="#888579" stroke="#888579" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
