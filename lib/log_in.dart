import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:adobe_xd/blend_mask.dart';
import './Component21.dart';
import './Splash_Screen.dart';
import 'package:adobe_xd/page_link.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'home_page.dart';

class log_in extends StatelessWidget {
  Size size = Size(0.0, 0.0);
  String arrow_left = "right";
  bool is_arrow_left = false;

  log_in({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xffd4af37),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(start: -64.0, end: -11.2),
            Pin(size: 310.0, start: 0.0),
            child: Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(start: 64.0, end: 10.2),
                  Pin(size: 261.0, start: 0.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffd4af37),
                      border: Border.all(
                          width: 1.0, color: const Color(0xffd4af37)),
                    ),
                  ),
                ),
                Stack(
                    children: [
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(start: 0.0, size: size.height * 0.3),
                  child:Stack(children: [ Container(
                    decoration: BoxDecoration(
                      color: const Color(0xff888579),
                      border: Border.all(
                          width: 1.0, color: const Color(0xff888579)),
                    ),
                  )]),
                ),
                Container(
                  width: size.width,
                  margin: EdgeInsets.only(top:(size.height * 0.3)-70.0,left: 64.0),
                  child: get_svg_top_navbar(size.width)
                )
                ]),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(size: 122.0, middle: 0.55),
            Pin(size: 122.0, middle: 0.02),
            child: BlendMask(
              blendMode: BlendMode.multiply,
              child: Text(
                'sl',
                style: TextStyle(
                  fontFamily: 'Castellar',
                  fontSize: size.height * 0.15,
                  color: const Color(0xffe1e1e1),
                ),
                softWrap: false,
              ),
            ),
          ),
          Align(
            alignment: Alignment(-0.008, 0.255),
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
                              _svg_iqcu40,
                              allowDrawingOutsideViewBox: true,
                            ),
                          ),
                        ),
                        Pinned.fromPins(
                          Pin(size: 15.7, middle: 0.3092),
                          Pin(start: 0.0, end: 0.0),
                          child: SvgPicture.string(
                            _svg_j03yrj,
                            allowDrawingOutsideViewBox: true,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Pinned.fromPins(
                          Pin(size: 14.4, middle: 0.6743),
                          Pin(start: 7.6, end: 7.6),
                          child: SvgPicture.string(
                            _svg_u5x30k,
                            allowDrawingOutsideViewBox: true,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Pinned.fromPins(
                          Pin(size: 12.2, end: 0.0),
                          Pin(start: 12.0, end: 12.0),
                          child: SvgPicture.string(
                            _svg_f8qqmj,
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
                              _svg_iqcu40,
                              allowDrawingOutsideViewBox: true,
                            ),
                          ),
                        ),
                        Pinned.fromPins(
                          Pin(size: 15.7, middle: 0.3092),
                          Pin(start: 0.0, end: 0.0),
                          child: SvgPicture.string(
                            _svg_zeo9hk,
                            allowDrawingOutsideViewBox: true,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Pinned.fromPins(
                          Pin(size: 14.4, middle: 0.6743),
                          Pin(start: 9.0, end: 9.1),
                          child: SvgPicture.string(
                            _svg_u5x30k,
                            allowDrawingOutsideViewBox: true,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Pinned.fromPins(
                          Pin(size: 12.2, end: 0.0),
                          Pin(start: 13.4, end: 13.4),
                          child: SvgPicture.string(
                            _svg_f8qqmj,
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
            Pin(size: (size.width * size.height) * 0.00046, middle: size.height > size.width? 0.5754:0.9754),
            Pin(size: (size.width * size.height) * 0.00035, end: 97.0),
            child: Stack(
              children: <Widget>[
                SizedBox.expand(
                    child: SvgPicture.string(
                  _svg_u6vlep,
                  allowDrawingOutsideViewBox: true,
                  fit: BoxFit.fill,
                )),
                Align(
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
                            _svg_ho2t7q,
                            allowDrawingOutsideViewBox: true,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Pinned.fromPins(
                          Pin(size: 7.3, middle: 0.7037),
                          Pin(start: 9.0, end: 8.7),
                          child: SvgPicture.string(
                            _svg_e9cvnf,
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
                              _svg_sz4bdg,
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
            Pin(size: 75.7, end: 10.1),
            child: SvgPicture.string(
              _svg_t04il8,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 46.0, end: 47.0),
            Pin(size: 46.0, end: 25.0),
            child: Draggable(
              axis: Axis.horizontal,
              data:arrow_left,
              child: Component21(icons: 1),
              feedback: Component21(icons:1),
              childWhenDragging: SizedBox(),
            ),
          ),Pinned.fromPins(
              Pin(size: 46.0, start: 48.0),
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
                    MaterialPageRoute(builder: (context) => Splash_Screen()),
                        (route) => false);
              },onWillAccept: (data){
                return data == arrow_left;
              },)),
          Align(
            alignment: Alignment(0.14, -0.656),
            child: SizedBox(
              width: 161.0,
              height: 35.0,
              child: Text(
                'welcome',
                style: TextStyle(
                  fontFamily: 'Castellar',
                  fontSize: size.height * 0.04,
                  color: const Color(0xffdcdcdc),
                ),
                softWrap: false,
              ),
            ),
          ),
          Align(
            alignment: Alignment(0, -0.530),
            child: SizedBox(
              width: 138.0,
              height: 48.0,
              child: Text(
                'please press to\ncreate account\nor sign in',
                style: TextStyle(
                  fontFamily: 'Castellar',
                  fontSize: size.height * 0.017,
                  color: const Color(0xffdcdcdc),
                ),
                softWrap: false,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: size.height * 0.3, middle: 0.5),
            Pin(size: 36.0, middle: 0.09),
            child: BlendMask(
              blendMode: BlendMode.difference,
              child: Text(
                'speach learning',
                style: TextStyle(
                  fontFamily: 'Castellar',
                  fontSize: size.height * 0.04,
                  color: const Color(0xff673a3a),
                ),
                softWrap: false,
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: size.height * 0.4,start: 47.0,),
            Pin(size: 40.0, middle: size.height > size.width? 0.424:0.574),
            child: PageLink(
              links: [
                PageLinkInfo(
                  ease: Curves.linear,
                  duration: 0.3,
                  pageBuilder: () => home_page(),
                ),
              ],
              child: Stack(

                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xfff6df82),
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(
                          width: 1.0, color: const Color(0xc2707070)),
                    ),
                  ),
                  Align(
                    alignment: Alignment(0.0, 0.0),
                    child: SizedBox(
                      child: Text(
                        'Email',
                        style: TextStyle(
                          fontFamily: 'Cambria Math',
                          fontSize: size.height * 0.035,
                          color: const Color(0xff647793),
                        ),
                        softWrap: false,
                      ),
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 30.0, start: 16.0),
                    Pin(size: 24.0, middle: 0.5),
                    child: SvgPicture.string(
                      _svg_ql36a,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: size.height*0.4, start: 47.0,),
            Pin(size: 43.0, start:size.height> size.width? size.height * 0.5:size.height * 0.65),
            child: PageLink(
              links: [
                PageLinkInfo(
                  ease: Curves.linear,
                  duration: 0.3,
                  pageBuilder: () => home_page(),
                ),
              ],
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xfff6df82),
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(
                          width: 1.0, color: const Color(0xc2707070)),
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 34.9, start: 13.1),
                    Pin(start: 8.0, end: 7.3),
                    child: SvgPicture.string(
                      _svg_or9maf,
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Align(
                    alignment: Alignment(0.0, 0.0),
                    child: SizedBox(
                      child: Text(
                        'Facebook',
                        style: TextStyle(
                          fontFamily: 'Cambria Math',
                          fontSize: size.height * 0.03,
                          color: const Color(0xff647793),
                        ),
                        softWrap: false,
                      ),
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

const String _svg_iqcu40 =
    '<svg viewBox="156.7 425.3 10.4 26.5" ><path transform="translate(156.75, 425.26)" d="M 5.126118659973145 0 C 10.65900325775146 -0.040435791015625 10.27263736724854 5.927684307098389 10.27263736724854 13.23985290527344 C 10.27263736724854 20.5520191192627 11.35083675384521 26.3504638671875 5.126118659973145 26.47970581054688 C -1.098599910736084 26.60894775390625 -0.02040053531527519 20.5520191192627 -0.02040053531527519 13.23985290527344 C -0.02040053531527519 5.927684307098389 -0.4067660570144653 0.040435791015625 5.126118659973145 0 Z" fill="#ddffcc" fill-opacity="0.64" stroke="#ddffcc" stroke-width="1" stroke-opacity="0.0" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_j03yrj =
    '<svg viewBox="181.0 411.0 15.7 55.0" ><path transform="translate(181.0, 411.01)" d="M 7.821887493133545 0.0009381046402268112 C 16.48709869384766 -0.386028379201889 15.65123081207275 12.30965709686279 15.65123081207275 27.49322891235352 C 15.65123081207275 42.67679977416992 15.82378578186035 54.84932708740234 7.821887493133545 54.98551940917969 C -0.180012121796608 55.12171173095703 -0.007457241881638765 42.67679977416992 -0.007457241881638765 27.49322891235352 C -0.007457241881638765 12.30965709686279 -0.843323290348053 0.3879046142101288 7.821887493133545 0.0009381046402268112 Z" fill="#ddffcc" fill-opacity="0.64" stroke="#ddffcc" stroke-width="1" stroke-opacity="0.0" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_u5x30k =
    '<svg viewBox="210.6 418.6 14.4 39.7" ><path transform="translate(210.55, 418.64)" d="M 7.208663940429688 0 C 14.41792678833008 0.289154052734375 14.41732788085938 8.730448722839355 14.41732788085938 19.5 C 14.41732788085938 30.26955032348633 14.41792678833008 39.72726440429688 7.208663940429688 39.72726440429688 C -0.0005988643388263881 39.72726440429688 -4.106213633003897e-12 30.26955032348633 -4.106213633003897e-12 19.5 C -4.106213633003897e-12 8.730448722839355 -0.0005988643388263881 -0.289154052734375 7.208663940429688 0 Z" fill="#ddffcc" fill-opacity="0.64" stroke="#ddffcc" stroke-width="1" stroke-opacity="0.0" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_f8qqmj =
    '<svg viewBox="238.8 423.0 12.2 31.0" ><path transform="translate(238.9, 422.99)" d="M 6.026150703430176 0 C 13.00847434997559 -0.15252685546875 12.05925273895264 6.939586639404297 12.05925273895264 15.5 C 12.05925273895264 24.0604133605957 12.49734306335449 31.27935791015625 6.026150703430176 31 C -0.4450419545173645 30.72064208984375 -0.00695186760276556 24.0604133605957 -0.00695186760276556 15.5 C -0.00695186760276556 6.939586639404297 -0.9561733603477478 0.15252685546875 6.026150703430176 0 Z" fill="#ddffcc" fill-opacity="0.64" stroke="#ddffcc" stroke-width="1" stroke-opacity="0.0" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_zeo9hk =
    '<svg viewBox="181.0 409.6 15.7 57.8" ><path transform="translate(181.0, 409.6)" d="M 7.821887493133545 0.00138256442733109 C 16.48709869384766 -0.4055387675762177 15.65123081207275 12.9448299407959 15.65123081207275 28.91137886047363 C 15.65123081207275 44.87792587280273 15.82378578186035 57.67815780639648 7.821887493133545 57.82137298583984 C -0.180012121796608 57.9645881652832 -0.007457241881638765 44.87792587280273 -0.007457241881638765 28.91137886047363 C -0.007457241881638765 12.9448299407959 -0.843323290348053 0.4083038866519928 7.821887493133545 0.00138256442733109 Z" fill="#ddffcc" fill-opacity="0.64" stroke="#ddffcc" stroke-width="1" stroke-opacity="0.0" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_qgnl1v =
    '<svg viewBox="161.7 425.6 7.1 19.2" ><path transform="translate(161.75, 425.59)" d="M 3.453173637390137 -5.581384539254941e-05 C 7.212121963500977 -0.029443034902215 6.949631690979004 4.307963371276855 6.949631690979004 9.622173309326172 C 6.949631690979004 14.93638229370117 7.682141780853271 19.15047645568848 3.453173637390137 19.24440383911133 C -0.7757953405380249 19.33833312988281 -0.04328493028879166 14.93638229370117 -0.04328493028879166 9.622173309326172 C -0.04328493028879166 4.307963371276855 -0.3057751357555389 0.02933140657842159 3.453173637390137 -5.581384539254941e-05 Z" fill="#ddffcc" fill-opacity="0.49" stroke="#ddffcc" stroke-width="1" stroke-opacity="0.0" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ho2t7q =
    '<svg viewBox="174.8 409.6 8.6 50.9" ><path transform="translate(174.79, 409.6)" d="M 4.287015438079834 0.0003033850807696581 C 9.050862312316895 -0.3581663072109222 8.591329574584961 11.40258884429932 8.591329574584961 25.46802139282227 C 8.591329574584961 39.53345108032227 8.68619441986084 50.80957412719727 4.287015438079834 50.93574142456055 C -0.1121651232242584 51.0619010925293 -0.01730014197528362 39.53345108032227 -0.01730014197528362 25.46802139282227 C -0.01730014197528362 11.40258884429932 -0.4768317341804504 0.3587730824947357 4.287015438079834 0.0003033850807696581 Z" fill="#ddffcc" fill-opacity="0.49" stroke="#ddffcc" stroke-width="1" stroke-opacity="0.0" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_e9cvnf =
    '<svg viewBox="189.4 418.6 7.3 33.2" ><path transform="translate(189.41, 418.64)" d="M 3.671035766601562 -0.001117057166993618 C 7.342376708984375 0.2402599006891251 7.342071533203125 7.286794185638428 7.342071533203125 16.27688598632812 C 7.342071533203125 25.2669792175293 7.342376708984375 33.1619873046875 3.671035766601562 33.1619873046875 C -0.000304973655147478 33.1619873046875 -1.221538842299807e-11 25.2669792175293 -1.221538842299807e-11 16.27688598632812 C -1.221538842299807e-11 7.286794185638428 -0.000304973655147478 -0.2424940168857574 3.671035766601562 -0.001117057166993618 Z" fill="#ddffcc" fill-opacity="0.49" stroke="#ddffcc" stroke-width="1" stroke-opacity="0.0" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_sz4bdg =
    '<svg viewBox="202.8 421.8 5.7 23.1" ><path transform="translate(202.83, 421.78)" d="M 2.785412788391113 -0.0006189406849443913 C 6.04388952255249 -0.1140583530068398 5.600911140441895 5.160588264465332 5.600911140441895 11.52726078033447 C 5.600911140441895 17.89393043518066 5.805356979370117 23.26290702819824 2.785412788391113 23.05513763427734 C -0.2345317453145981 22.84737014770508 -0.03008601441979408 17.89393043518066 -0.03008601441979408 11.52726078033447 C -0.03008601441979408 5.160588264465332 -0.4730640649795532 0.112820491194725 2.785412788391113 -0.0006189406849443913 Z" fill="#ddffcc" fill-opacity="0.49" stroke="#ddffcc" stroke-width="1" stroke-opacity="0.0" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_u6vlep =
    '<svg viewBox="146.0 695.0 174.3 134.0" ><path transform="translate(146.0, 695.0)" d="M 68.5 0 C 106.3314971923828 0 137 29.99692153930664 137 67 C 137 81.57921600341797 121.1419982910156 123.2044677734375 174.262451171875 129.71923828125 C 161.23291015625 134.2294921875 91.42588806152344 134 68.5 134 C 30.66849899291992 134 0 104.0030822753906 0 67 C 0 29.99692153930664 30.66849899291992 0 68.5 0 Z" fill="#554616" stroke="#554616" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_t04il8 =
    '<svg viewBox="28.2 840.1 371.7 75.7" ><path transform="translate(28.17, 839.7)" d="M 179.5 12.60638427734375 C 278.6351013183594 12.60638427734375 371.3125610351562 -27.627197265625 371.6506652832031 38.30181884765625 C 371.98876953125 104.2308349609375 278.6351013183594 63.99725341796875 179.5 63.99725341796875 C 80.36489105224609 63.99725341796875 0.2567634582519531 95.54144287109375 0 37 C -0.2567634582519531 -21.54144287109375 80.36489105224609 12.60638427734375 179.5 12.60638427734375 Z" fill="#888579" stroke="#888579" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ql36a =
    '<svg viewBox="54.0 380.0 30.0 24.0" ><path transform="translate(51.0, 374.0)" d="M 30 6 L 6 6 C 4.349999904632568 6 3.015000104904175 7.349999904632568 3.015000104904175 9 L 3 27 C 3 28.64999961853027 4.349999904632568 30 6 30 L 30 30 C 31.64999961853027 30 33 28.64999961853027 33 27 L 33 9 C 33 7.349999904632568 31.64999961853027 6 30 6 Z M 30 12 L 18 19.5 L 6 12 L 6 9 L 18 16.5 L 30 9 L 30 12 Z" fill="#f14064" fill-opacity="0.72" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_or9maf =
    '<svg viewBox="51.1 467.0 34.9 34.7" ><path transform="translate(50.56, 466.44)" d="M 35.4375 18 C 35.4375 8.3671875 27.6328125 0.5625 18 0.5625 C 8.3671875 0.5625 0.5625 8.3671875 0.5625 18 C 0.5625 26.70328140258789 6.939140796661377 33.91734313964844 15.275390625 35.2265625 L 15.275390625 23.04070281982422 L 10.845703125 23.04070281982422 L 10.845703125 18 L 15.275390625 18 L 15.275390625 14.15812492370605 C 15.275390625 9.788203239440918 17.876953125 7.374374866485596 21.86156272888184 7.374374866485596 C 23.76984405517578 7.374374866485596 25.76531219482422 7.714687347412109 25.76531219482422 7.714687347412109 L 25.76531219482422 12.00374984741211 L 23.56593704223633 12.00374984741211 C 21.40031242370605 12.00374984741211 20.724609375 13.34812450408936 20.724609375 14.72695350646973 L 20.724609375 18 L 25.56070327758789 18 L 24.78726577758789 23.04070281982422 L 20.724609375 23.04070281982422 L 20.724609375 35.2265625 C 29.06085968017578 33.91734313964844 35.4375 26.70328140258789 35.4375 18 Z" fill="#480af8" fill-opacity="0.73" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
