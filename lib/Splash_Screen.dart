import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:speach_learning/log_in.dart';
import './Component21.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Splash_Screen extends StatelessWidget {
  double Width = 0.0, Hieght = 0.0;
  String arrow_right = "right";
  bool is_arrow_right = false;

  Splash_Screen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Width = MediaQuery.of(context).size.width;
    Hieght = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: const Color(0xffd4af37),
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              Pinned.fromPins(
                Pin(start: -1.1, end: 0.0),
                Pin(size: 261.0, start: 0.0),
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
                      Pin(start: 0.0, end: 0.1),
                      Pin(size: 62.0, start: 0.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xff888579),
                          border: Border.all(
                              width: 1.0, color: const Color(0xff888579)),
                        ),
                      ),
                    ),
                    get_svg_top_navbar(Width),
                  ],
                ),
              ),
              Pinned.fromPins(
                Pin(start: -61.0, end: -45.0),
                Pin(size: (Width * Hieght) * 0.0015, start: 29.0),
                child: Transform.rotate(
                  angle: 0.3491,
                  child: const Text(
                      'sl',
                      style: TextStyle(
                        fontFamily: 'Castellar',
                        fontSize: 484,
                        color: Colors.white38,
                      ),
                      softWrap: false,
                    ),
                ),
              ),
              Align(
                alignment: Alignment(-0.001, Width > Hieght ? -0.8 : -0.001),
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
                                  _svg_f8f66m,
                                  allowDrawingOutsideViewBox: true,
                                ),
                              ),
                            ),
                            Pinned.fromPins(
                              Pin(size: 15.7, middle: 0.3092),
                              Pin(start: 0.0, end: 0.0),
                              child: SvgPicture.string(
                                _svg_i282wz,
                                allowDrawingOutsideViewBox: true,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Pinned.fromPins(
                              Pin(size: 14.4, middle: 0.6743),
                              Pin(start: 7.6, end: 7.6),
                              child: SvgPicture.string(
                                _svg_suxa2,
                                allowDrawingOutsideViewBox: true,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Pinned.fromPins(
                              Pin(size: 12.2, end: 0.0),
                              Pin(start: 12.0, end: 12.0),
                              child: SvgPicture.string(
                                _svg_iq19o3,
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
                                  _svg_f8f66m,
                                  allowDrawingOutsideViewBox: true,
                                ),
                              ),
                            ),
                            Pinned.fromPins(
                              Pin(size: 15.7, middle: 0.3092),
                              Pin(start: 0.0, end: 0.0),
                              child: SvgPicture.string(
                                _svg_nns6y,
                                allowDrawingOutsideViewBox: true,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Pinned.fromPins(
                              Pin(size: 14.4, middle: 0.6743),
                              Pin(start: 9.0, end: 9.1),
                              child: SvgPicture.string(
                                _svg_suxa2,
                                allowDrawingOutsideViewBox: true,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Pinned.fromPins(
                              Pin(size: 12.2, end: 0.0),
                              Pin(start: 13.4, end: 13.4),
                              child: SvgPicture.string(
                                _svg_iq19o3,
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
              Align(
                alignment: Alignment(0.065, Width > Hieght ? -0.3 : 0.400),
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
                      Align(
                        alignment: Alignment(-0.246, 0.0),
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
                                    _svg_twc5vq,
                                    allowDrawingOutsideViewBox: true,
                                  ),
                                ),
                              ),
                              Pinned.fromPins(
                                Pin(size: 8.6, middle: 0.3435),
                                Pin(start: 0.0, end: 0.0),
                                child: SvgPicture.string(
                                  _svg_wc7499,
                                  allowDrawingOutsideViewBox: true,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Pinned.fromPins(
                                Pin(size: 7.3, middle: 0.7037),
                                Pin(start: 9.0, end: 8.7),
                                child: SvgPicture.string(
                                  _svg_sxh6oy,
                                  allowDrawingOutsideViewBox: true,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Align(
                                alignment: Alignment(1.0, -0.126),
                                child: SizedBox(
                                  width: 6.0,
                                  height: 23.0,
                                  child: SvgPicture.string(
                                    _svg_rdvfk5,
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
              ),
              Pinned.fromPins(
                Pin(start: 28.2, end: 28.2),
                Pin(size: 75.7, end: 10.1),
                child: SvgPicture.string(
                  _svg_t04il8,
                  allowDrawingOutsideViewBox: true,
                  fit: BoxFit.fill,
                ),
              ),
              Pinned.fromPins(
                  Pin(size: 46.0, start: 48.0),
                  Pin(size: 46.0, end: 25.0),
                  child: Draggable<String>(
                    axis: Axis.horizontal,
                    data: arrow_right,
                    child: Component21(icons: 0),
                    feedback: Component21(icons: 0),
                    childWhenDragging: SizedBox(),
                  )),
              Pinned.fromPins(
                    Pin(size: 46.0, end: 48.0),
                    Pin(size: 46.0, end: 28.0),
                    child:DragTarget<String>(
                      builder: (BuildContext context, List<dynamic> accepted,
                          List<dynamic> rejected) {
                        return Container(
                      width: 46.0,
                      height: 46.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                          border:
                              Border.all(color: Colors.white38, width: 1.0)),
                    );
              }, onAccept: (data) {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => log_in()),
                        (route) => false);
              },onWillAccept: (data){
                return data == arrow_right;
              },)),
              Pinned.fromPins(
                Pin(
                    start: Width > Hieght ? Width * 0.36 : Width * 0.2,
                    end: 37.0),
                Pin(size: 42.0, end: 106.0),
                child: Text(
                  'Speech Learning',
                  style: TextStyle(
                    fontFamily: 'Castellar',
                    fontSize: 35,
                    color: const Color(0xffdcdcdc),
                  ),
                  softWrap: false,
                ),
              ),
            ],
          ),
        ));
  }
}

Widget get_svg_top_navbar(double width) {
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
        ),
      ),
    )));
    length++;
  }
  return Row(
    children: list,
  );
}

const String _svg_p8cx =
    '<svg viewBox="-9.0 -2237.0 142.1 142.7" ><path transform="translate(-9.0, -2237.0)" d="M 71.05419158935547 0 C 110.2963409423828 0 142.1083831787109 30.21167373657227 142.1083831787109 67.47965240478516 C 142.1083831787109 104.7476425170898 80.732421875 163.8770599365234 71.05419158935547 134.9593048095703 C 61.3759765625 106.0415725708008 0 104.7476425170898 0 67.47965240478516 C 0 30.21167373657227 31.81204986572266 0 71.05419158935547 0 Z" fill="#888579" stroke="#888579" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_f8f66m =
    '<svg viewBox="156.7 425.3 10.4 26.5" ><path transform="translate(156.75, 425.26)" d="M 5.126118659973145 0 C 10.65900325775146 -0.040435791015625 10.27263736724854 5.927684307098389 10.27263736724854 13.23985290527344 C 10.27263736724854 20.5520191192627 11.35083675384521 26.3504638671875 5.126118659973145 26.47970581054688 C -1.098599910736084 26.60894775390625 -0.02040053531527519 20.5520191192627 -0.02040053531527519 13.23985290527344 C -0.02040053531527519 5.927684307098389 -0.4067660570144653 0.040435791015625 5.126118659973145 0 Z" fill="#ddffcc" fill-opacity="0.62" stroke="#ddffcc" stroke-width="1" stroke-opacity="0.0" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_i282wz =
    '<svg viewBox="181.0 411.0 15.7 55.0" ><path transform="translate(181.0, 411.01)" d="M 7.821887493133545 0.0009381046402268112 C 16.48709869384766 -0.386028379201889 15.65123081207275 12.30965709686279 15.65123081207275 27.49322891235352 C 15.65123081207275 42.67679977416992 15.82378578186035 54.84932708740234 7.821887493133545 54.98551940917969 C -0.180012121796608 55.12171173095703 -0.007457241881638765 42.67679977416992 -0.007457241881638765 27.49322891235352 C -0.007457241881638765 12.30965709686279 -0.843323290348053 0.3879046142101288 7.821887493133545 0.0009381046402268112 Z" fill="#ddffcc" fill-opacity="0.62" stroke="#ddffcc" stroke-width="1" stroke-opacity="0.0" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_suxa2 =
    '<svg viewBox="210.6 418.6 14.4 39.7" ><path transform="translate(210.55, 418.64)" d="M 7.208663940429688 0 C 14.41792678833008 0.289154052734375 14.41732788085938 8.730448722839355 14.41732788085938 19.5 C 14.41732788085938 30.26955032348633 14.41792678833008 39.72726440429688 7.208663940429688 39.72726440429688 C -0.0005988643388263881 39.72726440429688 -4.106213633003897e-12 30.26955032348633 -4.106213633003897e-12 19.5 C -4.106213633003897e-12 8.730448722839355 -0.0005988643388263881 -0.289154052734375 7.208663940429688 0 Z" fill="#ddffcc" fill-opacity="0.62" stroke="#ddffcc" stroke-width="1" stroke-opacity="0.0" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_iq19o3 =
    '<svg viewBox="238.8 423.0 12.2 31.0" ><path transform="translate(238.9, 422.99)" d="M 6.026150703430176 0 C 13.00847434997559 -0.15252685546875 12.05925273895264 6.939586639404297 12.05925273895264 15.5 C 12.05925273895264 24.0604133605957 12.49734306335449 31.27935791015625 6.026150703430176 31 C -0.4450419545173645 30.72064208984375 -0.00695186760276556 24.0604133605957 -0.00695186760276556 15.5 C -0.00695186760276556 6.939586639404297 -0.9561733603477478 0.15252685546875 6.026150703430176 0 Z" fill="#ddffcc" fill-opacity="0.62" stroke="#ddffcc" stroke-width="1" stroke-opacity="0.0" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_nns6y =
    '<svg viewBox="181.0 409.6 15.7 57.8" ><path transform="translate(181.0, 409.6)" d="M 7.821887493133545 0.00138256442733109 C 16.48709869384766 -0.4055387675762177 15.65123081207275 12.9448299407959 15.65123081207275 28.91137886047363 C 15.65123081207275 44.87792587280273 15.82378578186035 57.67815780639648 7.821887493133545 57.82137298583984 C -0.180012121796608 57.9645881652832 -0.007457241881638765 44.87792587280273 -0.007457241881638765 28.91137886047363 C -0.007457241881638765 12.9448299407959 -0.843323290348053 0.4083038866519928 7.821887493133545 0.00138256442733109 Z" fill="#ddffcc" fill-opacity="0.62" stroke="#ddffcc" stroke-width="1" stroke-opacity="0.0" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_twc5vq =
    '<svg viewBox="161.7 425.6 7.1 19.2" ><path transform="translate(161.75, 425.59)" d="M 3.453173637390137 -5.581384539254941e-05 C 7.212121963500977 -0.029443034902215 6.949631690979004 4.307963371276855 6.949631690979004 9.622173309326172 C 6.949631690979004 14.93638229370117 7.682141780853271 19.15047645568848 3.453173637390137 19.24440383911133 C -0.7757953405380249 19.33833312988281 -0.04328493028879166 14.93638229370117 -0.04328493028879166 9.622173309326172 C -0.04328493028879166 4.307963371276855 -0.3057751357555389 0.02933140657842159 3.453173637390137 -5.581384539254941e-05 Z" fill="#ddffcc" fill-opacity="0.55" stroke="#c0c7bc" stroke-width="1" stroke-opacity="0.0" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_wc7499 =
    '<svg viewBox="174.8 409.6 8.6 50.9" ><path transform="translate(174.79, 409.6)" d="M 4.287015438079834 0.0003033850807696581 C 9.050862312316895 -0.3581663072109222 8.591329574584961 11.40258884429932 8.591329574584961 25.46802139282227 C 8.591329574584961 39.53345108032227 8.68619441986084 50.80957412719727 4.287015438079834 50.93574142456055 C -0.1121651232242584 51.0619010925293 -0.01730014197528362 39.53345108032227 -0.01730014197528362 25.46802139282227 C -0.01730014197528362 11.40258884429932 -0.4768317341804504 0.3587730824947357 4.287015438079834 0.0003033850807696581 Z" fill="#ddffcc" fill-opacity="0.55" stroke="#c0c7bc" stroke-width="1" stroke-opacity="0.0" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_sxh6oy =
    '<svg viewBox="189.4 418.6 7.3 33.2" ><path transform="translate(189.41, 418.64)" d="M 3.671035766601562 -0.001117057166993618 C 7.342376708984375 0.2402599006891251 7.342071533203125 7.286794185638428 7.342071533203125 16.27688598632812 C 7.342071533203125 25.2669792175293 7.342376708984375 33.1619873046875 3.671035766601562 33.1619873046875 C -0.000304973655147478 33.1619873046875 -1.221538842299807e-11 25.2669792175293 -1.221538842299807e-11 16.27688598632812 C -1.221538842299807e-11 7.286794185638428 -0.000304973655147478 -0.2424940168857574 3.671035766601562 -0.001117057166993618 Z" fill="#ddffcc" fill-opacity="0.55" stroke="#c0c7bc" stroke-width="1" stroke-opacity="0.0" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_rdvfk5 =
    '<svg viewBox="202.8 421.8 5.7 23.1" ><path transform="translate(202.83, 421.78)" d="M 2.785412788391113 -0.0006189406849443913 C 6.04388952255249 -0.1140583530068398 5.600911140441895 5.160588264465332 5.600911140441895 11.52726078033447 C 5.600911140441895 17.89393043518066 5.805356979370117 23.26290702819824 2.785412788391113 23.05513763427734 C -0.2345317453145981 22.84737014770508 -0.03008601441979408 17.89393043518066 -0.03008601441979408 11.52726078033447 C -0.03008601441979408 5.160588264465332 -0.4730640649795532 0.112820491194725 2.785412788391113 -0.0006189406849443913 Z" fill="#ddffcc" fill-opacity="0.55" stroke="#c0c7bc" stroke-width="1" stroke-opacity="0.0" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_xqajra =
    '<svg viewBox="145.0 200.0 174.3 134.0" ><path transform="translate(145.0, 200.0)" d="M 68.5 0 C 106.3314971923828 0 137 29.99692153930664 137 67 C 137 81.57921600341797 121.1419982910156 123.2044677734375 174.262451171875 129.71923828125 C 161.23291015625 134.2294921875 91.42588806152344 134 68.5 134 C 30.66849899291992 134 0 104.0030822753906 0 67 C 0 29.99692153930664 30.66849899291992 0 68.5 0 Z" fill="#554616" fill-opacity="0.81" stroke="#554616" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_t04il8 =
    '<svg viewBox="28.2 840.1 371.7 75.7" ><path transform="translate(28.17, 839.7)" d="M 179.5 12.60638427734375 C 278.6351013183594 12.60638427734375 371.3125610351562 -27.627197265625 371.6506652832031 38.30181884765625 C 371.98876953125 104.2308349609375 278.6351013183594 63.99725341796875 179.5 63.99725341796875 C 80.36489105224609 63.99725341796875 0.2567634582519531 95.54144287109375 0 37 C -0.2567634582519531 -21.54144287109375 80.36489105224609 12.60638427734375 179.5 12.60638427734375 Z" fill="#888579" stroke="#888579" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
