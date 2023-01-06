import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:adobe_xd/page_link.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../SplashScreen/UI/Splash_Screen.dart';

// ignore: camel_case_types, must_be_immutable
class profile_page extends StatelessWidget {
  // ignore: prefer_const_constructors
  Size size = Size(0.0, 0.0);
  profile_page({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xffeeece4),
        appBar: AppBar(
          backgroundColor: const Color(0xff888579),
          title: const Text("Profile"),
          centerTitle: true,
        ),
      body: SingleChildScrollView(
          child: SizedBox(
          height: size.height,
          child:Stack(
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
                      color: const Color(0x00ffffff),
                      border: Border.all(
                          width: 1.0, color: const Color(0x00ffffff)),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 64.0, end: 10.2),
                  Pin(size: size.height * 0.25, start: 0.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xff888579),
                      border: Border.all(
                          width: 1.0, color: const Color(0xff888579)),
                    ),
                  ),
                ),
                Container(
                    width: size.width,
                    margin: EdgeInsets.only(top:(size.height * 0.25)-70.0,left: 64.0),
                    child: get_svg_top_navbar(size.width)
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(size: size.height * 0.15, middle:size.height > size.width? 0.5017:0.0517),
            Pin(size: size.height * 0.15, start: size.height * 0.05),
            child: Stack(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Pinned.fromPins(
                          Pin(start: 21.0, end: 21.0),
                          Pin(size: 41.6, end: 8.3),
                          child: SvgPicture.string(
                            _svg_ggww97,
                            allowDrawingOutsideViewBox: true,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Align(
                          // ignore: prefer_const_constructors
                          alignment: Alignment(0.0, -0.4),
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: SvgPicture.string(
                              _svg_l,
                              allowDrawingOutsideViewBox: true,
                            ),
                          ),
                        ),
                        SizedBox.expand(
                            child: SvgPicture.string(
                          _svg_ocwynj,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        )),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xfffff8f8),
                        borderRadius:
                            const BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                        border: Border.all(
                            width: 1.0, color: const Color(0xffffffff)),
                      ),
                    ),
                  ],
                ),
                Pinned.fromPins(
                  Pin(size: size.height * 0.04, start: 0.0),
                  Pin(size: size.height * 0.04, end: 6.5),
                  child: IconButton(
                    onPressed: (){},
                    icon: const Icon(Icons.add_photo_alternate),
                    color: Colors.lime,
                    iconSize: size.height * 0.04,
                  )
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(start: 20.0, end: 31.0),
            Pin(size: 20.0, middle: 0.5249),
            child: Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(size: 79.0, start: 9.0),
                  Pin(start: 0.0, end: 0.0),
                  // ignore: prefer_const_constructors
                  child: Text(
                    'Language ',
                    // ignore: prefer_const_constructors
                    style: TextStyle(
                      fontFamily: 'PMingLiU-ExtB',
                      fontSize: 16,
                      color: const Color(0xff4b4949),
                    ),
                    softWrap: false,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 36.0, end: 0.0),
                  Pin(size: 15.0, end: 2.0),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xff707070),
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                              width: 1.0, color: const Color(0xff707070)),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 11.0, start: 3.0),
                        Pin(start: 2.0, end: 2.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffd3ec80),
                            borderRadius: const BorderRadius.all(
                                Radius.elliptical(9999.0, 9999.0)),
                            border: Border.all(
                                width: 1.0, color: const Color(0xff707070)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  // ignore: prefer_const_constructors
                  alignment: Alignment(-1.0, 0.647),
                  child: Container(
                    width: 3.0,
                    height: 3.0,
                    decoration: BoxDecoration(
                      color: const Color(0xff707070),
                      borderRadius:
                          // ignore: prefer_const_constructors
                          BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                      border: Border.all(
                          width: 1.0, color: const Color(0xff707070)),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 14.0, end: 6.5),
                  Pin(size: 14.0, start: 2.5),
                  // ignore: prefer_const_constructors
                  child: Text(
                    'on',
                    // ignore: prefer_const_constructors
                    style: TextStyle(
                      fontFamily: 'Courier New',
                      fontSize: 10,
                      color: const Color(0xffe1dcdc),
                    ),
                    softWrap: false,
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(start: 20.0, end: 31.0),
            Pin(size: 20.0, middle: 0.6132),
            child: Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(size: 87.0, start: 9.0),
                  Pin(start: 0.0, end: 0.0),
                  // ignore: prefer_const_constructors
                  child: Text(
                    'Dark Mode',
                    // ignore: prefer_const_constructors
                    style: TextStyle(
                      fontFamily: 'PMingLiU-ExtB',
                      fontSize: 16,
                      color: const Color(0xff4b4949),
                    ),
                    softWrap: false,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 36.0, end: 0.0),
                  Pin(size: 15.0, end: 2.0),
                  child: PageLink(
                    links: [
                      PageLinkInfo(
                        transition: LinkTransition.Fade,
                        ease: Curves.easeOut,
                        duration: 0.3,
                        pageBuilder: () => {},
                      ),
                    ],
                    child: Stack(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffffffff),
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                                width: 1.0, color: const Color(0xff707070)),
                          ),
                        ),
                        Pinned.fromPins(
                          Pin(size: 11.0, end: 2.0),
                          Pin(start: 2.0, end: 2.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xffd3ec80),
                              borderRadius: const BorderRadius.all(
                                  Radius.elliptical(9999.0, 9999.0)),
                              border: Border.all(
                                  width: 1.0, color: const Color(0xff707070)),
                            ),
                          ),
                        ),
                        Pinned.fromPins(
                          Pin(size: 18.0, start: 3.5),
                          Pin(size: 11.0, end: 1.5),
                          // ignore: prefer_const_constructors
                          child: Text(
                            'OFF',
                            // ignore: prefer_const_constructors
                            style: TextStyle(
                              fontFamily: 'Courier New',
                              fontSize: 8,
                              color: const Color(0xff9e9393),
                            ),
                            softWrap: false,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  // ignore: prefer_const_constructors
                  alignment: Alignment(-1.0, 0.647),
                  child: Container(
                    width: 3.0,
                    height: 3.0,
                    decoration: BoxDecoration(
                      color: const Color(0xff707070),
                      borderRadius:
                          // ignore: prefer_const_constructors
                          BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                      border: Border.all(
                          width: 1.0, color: const Color(0xff707070)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(start: 20.0, end: 30.0),
            Pin(size: 20.0, middle: 0.8089),
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    width: 234.0,
                    height: 12.0,
                    child: Stack(
                      children: <Widget>[
                        Pinned.fromPins(
                          Pin(start: 3.5, end: 5.5),
                          Pin(size: 1.0, middle: 0.5909),
                          child: SvgPicture.string(
                            _svg_ddu0,
                            allowDrawingOutsideViewBox: true,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Pinned.fromPins(
                          Pin(size: 8.0, start: 0.0),
                          Pin(start: 2.0, end: 2.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xff848d47),
                              borderRadius: const BorderRadius.all(
                                  Radius.elliptical(9999.0, 9999.0)),
                              border: Border.all(
                                  width: 1.0, color: const Color(0xff848d47)),
                            ),
                          ),
                        ),
                        Pinned.fromPins(
                          Pin(size: 8.0, end: 0.0),
                          Pin(start: 2.0, end: 2.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xff848d47),
                              borderRadius: const BorderRadius.all(
                                  Radius.elliptical(9999.0, 9999.0)),
                              border: Border.all(
                                  width: 1.0, color: const Color(0xff848d47)),
                            ),
                          ),
                        ),
                        Pinned.fromPins(
                          Pin(size: 12.0, start: 8.0),
                          Pin(start: 0.0, end: 0.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xffffffff),
                              borderRadius: const BorderRadius.all(
                                  Radius.elliptical(9999.0, 9999.0)),
                              border: Border.all(
                                  width: 1.0, color: const Color(0xff707070)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 61.0, start: 9.0),
                  Pin(start: 0.0, end: 0.0),
                  // ignore: prefer_const_constructors
                  child: Text(
                    'Volume',
                    // ignore: prefer_const_constructors
                    style: TextStyle(
                      fontFamily: 'PMingLiU-ExtB',
                      fontSize: 16,
                      color: const Color(0xff4b4949),
                    ),
                    softWrap: false,
                  ),
                ),
                Align(
                  // ignore: prefer_const_constructors
                  alignment: Alignment(-1.0, 0.647),
                  child: Container(
                    width: 3.0,
                    height: 3.0,
                    decoration: BoxDecoration(
                      color: const Color(0xff707070),
                      borderRadius:
                          const BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                      border: Border.all(
                          width: 1.0, color: const Color(0xff707070)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(start: 20.0, end: 48.0),
            Pin(size: 20.0, middle: 0.7105),
            child: Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(size: 43.0, start: 9.0),
                  Pin(start: 0.0, end: 0.0),
                  // ignore: prefer_const_constructors
                  child: Text(
                    'Level',
                    // ignore: prefer_const_constructors
                    style: TextStyle(
                      fontFamily: 'PMingLiU-ExtB',
                      fontSize: 16,
                      color: const Color(0xff4b4949),
                    ),
                    softWrap: false,
                  ),
                ),
                Align(
                  // ignore: prefer_const_constructors
                  alignment: Alignment(-1.0, 0.647),
                  child: Container(
                    width: 3.0,
                    height: 3.0,
                    decoration: BoxDecoration(
                      color: const Color(0xff707070),
                      borderRadius:
                          const BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                      border: Border.all(
                          width: 1.0, color: const Color(0xff707070)),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 8.0, end: 0.0),
                  Pin(size: 16.0, start: 1.0),
                  // ignore: prefer_const_constructors
                  child: Text(
                    '0',
                    // ignore: prefer_const_constructors
                    style: TextStyle(
                      fontFamily: 'PMingLiU-ExtB',
                      fontSize: 14,
                      color: const Color(0xff707070),
                    ),
                    textAlign: TextAlign.center,
                    softWrap: false,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    )));
  }
}

// ignore: constant_identifier_names
const String _svg_ggww97 =
    '<svg viewBox="21.0 83.1 90.9 41.6" ><path  d="M 111.9527435302734 102.8237762451172 C 106.0490264892578 93.31797790527344 93.05935668945312 83.125 66.5 83.125 C 39.94064331054688 83.125 26.95836067199707 93.30689239501953 21.04724884033203 102.8274688720703 C 32.0787239074707 116.655632019043 48.81072235107422 124.7027053833008 66.5 124.6875 C 84.18928527832031 124.7027053833008 100.9212875366211 116.6556243896484 111.952751159668 102.8274688720703 Z" fill="#e6e4e4" stroke="none" stroke-width="3.694444417953491" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// ignore: constant_identifier_names
const String _svg_l =
    '<svg viewBox="41.6 24.9 49.9 49.9" ><path  d="M 66.5 74.8125 C 80.27259826660156 74.8125 91.4375 63.64760208129883 91.4375 49.875 C 91.4375 36.10239791870117 80.27259826660156 24.9375 66.5 24.9375 C 52.72739791870117 24.9375 41.5625 36.10239791870117 41.5625 49.875 C 41.5625 63.64760208129883 52.72739791870117 74.8125 66.5 74.8125 Z" fill="#cecdcd" stroke="none" stroke-width="3.694444417953491" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// ignore: constant_identifier_names
const String _svg_ocwynj =
    '<svg viewBox="0.0 0.0 133.0 133.0" ><path  d="M 66.5 8.3125 C 34.36392974853516 8.3125 8.3125 34.36393356323242 8.3125 66.5 C 8.3125 98.63607025146484 34.36393356323242 124.6875 66.5 124.6875 C 98.63607025146484 124.6875 124.6875 98.63607025146484 124.6875 66.5 C 124.6875 34.36392974853516 98.63607025146484 8.3125 66.5 8.3125 Z M 0 66.5 C 0 29.77306175231934 29.7730655670166 0 66.5 0 C 103.226936340332 0 133 29.7730655670166 133 66.5 C 133 103.226936340332 103.2269287109375 133 66.5 133 C 29.77306175231934 133 0 103.2269287109375 0 66.5 Z" fill="#ffffff" fill-opacity="0.0" stroke="#9e9d9d" stroke-width="3.694444417953491" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// ignore: constant_identifier_names
const String _svg_ddu0 =
    '<svg viewBox="167.5 607.5 225.0 1.0" ><path transform="translate(167.5, 607.5)" d="M 0 0 L 225 0" fill="none" stroke="#848d47" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
