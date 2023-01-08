import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:adobe_xd/blend_mask.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speach_learning/AlertDialog.dart';
import '../../SplashScreen/UI/ButtonDrage.dart';
import '../../SplashScreen/UI/Splash_Screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../Home/UI/home_page.dart';
import '../../SplashScreen/bloc/blocSplashScreen.dart';

// ignore: camel_case_types
class log_in extends StatefulWidget {
  const log_in({Key? key}) : super(key: key);

  @override
  State<log_in> createState() => _log_inState();
}

// ignore: camel_case_types
class _log_inState extends State<log_in> {
  // ignore: prefer_const_constructors
  Size size = Size(0.0, 0.0);

  // ignore: non_constant_identifier_names
  String arrow_left = "right";

  // ignore: non_constant_identifier_names
  bool is_arrow_left = false;

  // ignore: non_constant_identifier_names
  late Button_Draage button_draage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    button_draage = Button_Draage(icons: 1);
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xffd4af37),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(size: 310.0, start: 0.0),
            child: Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(size: 261.0, start: 0.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffd4af37),
                      border: Border.all(
                          width: 1.0, color: const Color(0xffd4af37)),
                    ),
                  ),
                ),
                Stack(children: [
                  Pinned.fromPins(
                    Pin(start: 0.0, end: 0.0),
                    Pin(start: 0.0, size: size.height * 0.3),
                    child: Stack(children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          border: Border.all(
                              width: 1.0, color: Theme.of(context).cardColor),
                        ),
                      )
                    ]),
                  ),
                  Container(
                    width: size.width,
                    margin: EdgeInsets.only(top: (size.height * 0.3) - 70.0),
                    child: get_svg_top_navbar(size.width, context),
                  )
                ]),
              ],
            ),
          ),
          Pinned.fromPins(
              Pin(size: size.height * 0.3, middle: 0.5),
              Pin(size: 122.0, start: 10.0),
              child: Stack(children: [
                BlendMask(
                    blendMode: BlendMode.difference,
                    child: Center(
                      heightFactor: 3.5,
                      child: Text(
                        'speach learning',
                        style: TextStyle(
                          fontFamily: 'Castellar',
                          fontSize: size.height * 0.037,
                          color: Theme.of(context).textTheme.headline4!.color,
                        ),
                        softWrap: false,
                      ),
                    )),
                Center(
                  heightFactor: 1,
                    child: Text(
                  'SL',
                  style: TextStyle(
                    fontFamily: 'Castellar',
                    fontSize: size.height * 0.14,
                    color: Theme.of(context).textTheme.headline3!.color,
                  ),
                  softWrap: false,
                ))
              ])),
          Align(
            // ignore: prefer_const_constructors
            alignment: Alignment(-0.008, 0.285),
            child: SizedBox(
              width: 210.0,
              height: 58.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromPins(
                    Pin(size: 94.3, end: 0.0),
                    Pin(start: 1.4, end: 1.4),
                    child: Stack(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: SizedBox(
                            width: 10.0,
                            height: 26.0,
                            child: SvgPicture.string(
                              _svg_qgnl1v,
                              allowDrawingOutsideViewBox: true,
                            ),
                          ),
                        ),
                        Pinned.fromPins(
                          Pin(size: 15.7, middle: 0.3092),
                          Pin(start: 0.0, end: 0.0),
                          child: SvgPicture.string(
                            _svg_qgnl1v,
                            allowDrawingOutsideViewBox: true,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Pinned.fromPins(
                          Pin(size: 14.4, middle: 0.6743),
                          Pin(start: 7.6, end: 7.6),
                          child: SvgPicture.string(
                            _svg_qgnl1v,
                            allowDrawingOutsideViewBox: true,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Pinned.fromPins(
                          Pin(size: 12.2, end: 0.0),
                          Pin(start: 12.0, end: 12.0),
                          child: SvgPicture.string(
                            _svg_qgnl1v,
                            allowDrawingOutsideViewBox: true,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 94.3, start: 0.0),
                    Pin(start: 0.0, end: 0.0),
                    child: Stack(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: SizedBox(
                            width: 10.0,
                            height: 26.0,
                            child: SvgPicture.string(
                              _svg_qgnl1v,
                              allowDrawingOutsideViewBox: true,
                            ),
                          ),
                        ),
                        Pinned.fromPins(
                          Pin(size: 15.7, middle: 0.3092),
                          Pin(start: 0.0, end: 0.0),
                          child: SvgPicture.string(
                            _svg_qgnl1v,
                            allowDrawingOutsideViewBox: true,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Pinned.fromPins(
                          Pin(size: 14.4, middle: 0.6743),
                          Pin(start: 9.0, end: 9.1),
                          child: SvgPicture.string(
                            _svg_qgnl1v,
                            allowDrawingOutsideViewBox: true,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Pinned.fromPins(
                          Pin(size: 12.2, end: 0.0),
                          Pin(start: 13.4, end: 13.4),
                          child: SvgPicture.string(
                            _svg_qgnl1v,
                            allowDrawingOutsideViewBox: true,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(
                size: (size.width * size.height) * 0.00046,
                middle: size.height > size.width ? 0.5554 : 0.9754),
            Pin(size: (size.width * size.height) * 0.00035, end: 97.0),
            child: Stack(
              children: <Widget>[
                SizedBox.expand(
                    child: SvgPicture.string(
                  _svg_xqajra,
                  allowDrawingOutsideViewBox: true,
                  fit: BoxFit.fill,
                )),
                Align(
                  // ignore: prefer_const_constructors
                  alignment: Alignment(-0.262, 0.0),
                  child: SizedBox(
                    width: 47.0,
                    height: 51.0,
                    child: Stack(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: SizedBox(
                            width: 7.0,
                            height: 19.0,
                            child: SvgPicture.string(
                              _svg_qgnl1v,
                              allowDrawingOutsideViewBox: true,
                            ),
                          ),
                        ),
                        Pinned.fromPins(
                          Pin(size: 8.6, middle: 0.3435),
                          Pin(start: 0.0, end: 0.0),
                          child: SvgPicture.string(
                            _svg_qgnl1v,
                            allowDrawingOutsideViewBox: true,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Pinned.fromPins(
                          Pin(size: 7.3, middle: 0.7037),
                          Pin(start: 9.0, end: 8.7),
                          child: SvgPicture.string(
                            _svg_qgnl1v,
                            allowDrawingOutsideViewBox: true,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Align(
                          // ignore: prefer_const_constructors
                          alignment: Alignment(1.0, -0.126),
                          child: SizedBox(
                            width: 6.0,
                            height: 23.0,
                            child: SvgPicture.string(
                              _svg_qgnl1v,
                              allowDrawingOutsideViewBox: true,
                            ),
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
            Pin(start: 28.2, end: 28.2),
            Pin(size: 78.7, end: 10.1),
            child: SvgPicture.string(
              _svg_t04il8,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 50.0, end: 40.0),
            Pin(size: 50.0, end: 26.0),
            child: Draggable(
              onDragStarted: () {
                this.context.read<blocSplashScreen>().changSize(54.0);
              },
              onDragEnd: (val) {
                this.context.read<blocSplashScreen>().changSize(40.0);
              },
              axis: Axis.horizontal,
              data: arrow_left,
              child: button_draage.build(),
              feedback: button_draage.build(),
              childWhenDragging: const SizedBox(),
            ),
          ),
          Pinned.fromPins(Pin(size: size.width * 0.4, start: 0.0),
              Pin(size: 46.0, end: 28.0),
              child: DragTarget<String>(
                builder: (BuildContext context, List<dynamic> accepted,
                    List<dynamic> rejected) {
                  return Container(
                    width: 46.0,
                    height: 46.0,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    ),
                  );
                },
                onAccept: (data) {
                  Navigator.pushAndRemoveUntil(
                      context,
                      // ignore: prefer_const_constructors
                      MaterialPageRoute(builder: (context) => Splash_Screen()),
                      (route) => false);
                },
                onWillAccept: (data) {
                  return data == arrow_left;
                },
              )),
          Align(
            // ignore: prefer_const_constructors
            alignment: context.locale == Locale('en') ? Alignment(0.14, -0.626) : Alignment(-0.17, -0.656),
            child: SizedBox(
              width: 131.0,
              height: 45.0,
              child: Text(
                'welcome',
                style: TextStyle(
                  fontFamily: 'Castellar',
                  fontSize: size.height * 0.04,
                  color: const Color(0xffdcdcdc),
                ),
                softWrap: false,
              ).tr(),
            ),
          ),
          Align(
            // ignore: prefer_const_constructors
            alignment: context.locale == Locale('en') ? Alignment(0, -0.510) : Alignment(0, -0.490),
            child: SizedBox(
              width: 105.0,
              height: 68.0,
              child: Text(
                'pleasepress',
                style: TextStyle(
                  height: 1.0,
                  fontFamily: 'Castellar',
                  fontSize: (size.height + size.width) * 0.011,
                  color: const Color(0xffdcdcdc),
                ),
                softWrap: true,
                textAlign: TextAlign.center,
              ).tr(),
            ),
          ),
          Pinned.fromPins(
            Pin(
              size: size.height * 0.4,
              start: 47.0,
            ),
            Pin(size: 40.0, middle: size.height > size.width ? 0.454 : 0.574),
            child: ElevatedButton(
              style: ButtonStyle(
                // ignore: prefer_const_constructors
                textStyle: MaterialStateProperty.all(
                    TextStyle(fontWeight: FontWeight.normal)),
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
                // ignore: prefer_const_constructors
                padding: MaterialStateProperty.all(EdgeInsets.all(0.0)),
                foregroundColor: MaterialStateProperty.all(Colors.transparent),
                shadowColor: MaterialStateProperty.all(Colors.transparent),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0))),
              ),
              onPressed: () {
                try {
                  AlertDialogShow.showAlertDialog(context);
                  // ignore: prefer_const_constructors
                  Future.delayed(Duration(seconds: 1), () {
                    Navigator.pop(context);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (route) => home_page()));
                  });
                } catch (e, s) {
                  print(s);
                }
              },
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        color: const Color(0xfff6df82),
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(
                            width: 1.0, color: const Color(0xfff6df82)),
                        boxShadow: const [
                          BoxShadow(
                              color: Color(0xfff6df82),
                              blurRadius: 10,
                              spreadRadius: 1)
                        ]),
                  ),
                  Align(
                    // ignore: prefer_const_constructors
                    alignment: Alignment(0.0, 0.0),
                    child: SizedBox(
                      child: Text(
                        'email',
                        style: TextStyle(
                          fontFamily: 'Cambria Math',
                          fontSize: size.height * 0.03,
                          color: const Color(0xff647793),
                        ),
                        softWrap: false,
                      ).tr(),
                    ),
                  ),
                  Pinned.fromPins(Pin(size: 24.0, start: 16.0),
                      Pin(size: 24.0, middle: 0.5),
                      child: CustomPaint(
                          painter: GoogleLogoPainter(),
                          size: const Size.square(0.0))),
                ],
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(
              size: size.height * 0.4,
              start: 47.0,
            ),
            Pin(
                size: 43.0,
                start: size.height > size.width
                    ? size.height * 0.5
                    : size.height * 0.65),
            child: ElevatedButton(
              style: ButtonStyle(
                textStyle: MaterialStateProperty.all(
                    TextStyle(fontWeight: FontWeight.normal)),
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
                padding: MaterialStateProperty.all(EdgeInsets.all(0.0)),
                foregroundColor: MaterialStateProperty.all(Colors.transparent),
                shadowColor: MaterialStateProperty.all(Colors.transparent),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0))),
              ),
              onPressed: () {
                try {
                  AlertDialogShow.showAlertDialog(context);
                  // ignore: prefer_const_constructors
                  Future.delayed(Duration(seconds: 1), () {
                    Navigator.pop(context);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (route) => home_page()));
                  });
                } catch (e, s) {
                  print(s);
                }
              },
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        color: const Color(0xfff6df82),
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(
                            width: 1.0, color: const Color(0xfff6df82)),
                        boxShadow: const [
                          BoxShadow(
                              color: Color(0xfff6df82),
                              blurRadius: 10,
                              spreadRadius: 1)
                        ]),
                  ),
                  Pinned.fromPins(
                      Pin(size: 28.9, start: 10.0), Pin(start: 0.0, end: 0.0),
                      child: const Icon(
                        Icons.facebook_rounded,
                        size: 35,
                        color: Colors.blue,
                      )),
                  Align(
                    // ignore: prefer_const_constructors
                    alignment: Alignment(0.0, 0.0),
                    child: SizedBox(
                      child: Text(
                        'facebook',
                        style: TextStyle(
                          fontFamily: 'Cambria Math',
                          fontSize: size.height * 0.03,
                          color: const Color(0xff647793),
                        ),
                        softWrap: false,
                      ).tr(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GoogleLogoPainter extends CustomPainter {
  @override
  // ignore: avoid_renaming_method_parameters
  bool shouldRepaint(_) => true;

  @override
  void paint(Canvas canvas, Size size) {
    final length = size.width;
    final verticalOffset = (size.height / 2) - (length / 2);
    final bounds = Offset(0, verticalOffset) & Size.square(length);
    final center = bounds.center;
    final arcThickness = size.width / 4.5;
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = arcThickness;

    void drawArc(double startAngle, double sweepAngle, Color color) {
      final _paint = paint..color = color;
      canvas.drawArc(bounds, startAngle, sweepAngle, false, _paint);
    }

    drawArc(3.5, 1.9, Colors.red);
    drawArc(2.5, 1.0, Colors.amber);
    drawArc(0.9, 1.6, Colors.green.shade600);
    drawArc(-0.18, 1.1, Colors.blue.shade600);

    canvas.drawRect(
      Rect.fromLTRB(
        center.dx,
        center.dy - (arcThickness / 2),
        bounds.centerRight.dx + (arcThickness / 2) - 4,
        bounds.centerRight.dy + (arcThickness / 2),
      ),
      paint
        ..color = Colors.blue.shade600
        ..style = PaintingStyle.fill
        ..strokeWidth = 0,
    );
  }
}

// ignore: constant_identifier_names
const String _svg_qgnl1v =
    '<svg viewBox="161.7 425.6 7.1 19.2" ><path transform="translate(161.75, 425.59)" d="M 3.453173637390137 -5.581384539254941e-05 C 7.212121963500977 -0.029443034902215 6.949631690979004 4.307963371276855 6.949631690979004 9.622173309326172 C 6.949631690979004 14.93638229370117 7.682141780853271 19.15047645568848 3.453173637390137 19.24440383911133 C -0.7757953405380249 19.33833312988281 -0.04328493028879166 14.93638229370117 -0.04328493028879166 9.622173309326172 C -0.04328493028879166 4.307963371276855 -0.3057751357555389 0.02933140657842159 3.453173637390137 -5.581384539254941e-05 Z" fill="#ddffcc" fill-opacity="0.49" stroke="#ddffcc" stroke-width="1" stroke-opacity="0.0" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// ignore: constant_identifier_names
const String _svg_xqajra =
    '<svg viewBox="145.0 200.0 174.3 134.0" ><path transform="translate(145.0, 200.0)" d="M 68.5 0 C 106.3314971923828 0 137 29.99692153930664 137 67 C 137 81.57921600341797 121.1419982910156 123.2044677734375 174.262451171875 129.71923828125 C 161.23291015625 134.2294921875 91.42588806152344 134 68.5 134 C 30.66849899291992 134 0 104.0030822753906 0 67 C 0 29.99692153930664 30.66849899291992 0 68.5 0 Z" fill="#554616" fill-opacity="0.81" stroke="#554616" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// ignore: constant_identifier_names
const String _svg_t04il8 =
    '<svg viewBox="28.2 840.1 371.7 75.7" ><path transform="translate(28.17, 839.7)" d="M 179.5 12.60638427734375 C 278.6351013183594 12.60638427734375 371.3125610351562 -27.627197265625 371.6506652832031 38.30181884765625 C 371.98876953125 104.2308349609375 278.6351013183594 63.99725341796875 179.5 63.99725341796875 C 80.36489105224609 63.99725341796875 0.2567634582519531 95.54144287109375 0 37 C -0.2567634582519531 -21.54144287109375 80.36489105224609 12.60638427734375 179.5 12.60638427734375 Z" fill="#888579" stroke="#888579" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
