import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import './home_page.dart';
import 'package:adobe_xd/page_link.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'Splash_Screen.dart';

class profile_page extends StatelessWidget {
  Size size = Size(0.0, 0.0);
  profile_page({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xffeeece4),
      body: SingleChildScrollView(
          child: Container(
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
                  Pin(size: size.height * 0.3, start: 0.0),
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
                    margin: EdgeInsets.only(top:(size.height * 0.3)-70.0,left: 64.0),
                    child: get_svg_top_navbar(size.width)
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(start: -5.0, end: -3.0),
            Pin(size: 59.0, start: 0.0),
            child: Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(size: 18.0, start: 21.0),
                  Pin(size: 15.8, middle: 0.5576),
                  child: PageLink(
                    links: [
                      PageLinkInfo(
                        transition: LinkTransition.Fade,
                        ease: Curves.easeOut,
                        duration: 0.3,
                        pageBuilder: () => home_page(),
                      ),
                    ],
                    child: Stack(
                      children: <Widget>[
                        Pinned.fromPins(
                          Pin(size: 9.0, start: 0.0),
                          Pin(start: 0.0, end: 0.0),
                          child: SvgPicture.string(
                            _svg_pdme76,
                            allowDrawingOutsideViewBox: true,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Pinned.fromPins(
                          Pin(start: 1.1, end: 0.0),
                          Pin(size: 2.3, middle: 0.5),
                          child: SvgPicture.string(
                            _svg_sira0z,
                            allowDrawingOutsideViewBox: true,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0.011, 0.154),
                  child: SizedBox(
                    width: 78.0,
                    height: 31.0,
                    child: Text(
                      'profile',
                      style: TextStyle(
                        fontFamily: 'PMingLiU-ExtB',
                        fontSize: (size.height+size.width) * 0.02,
                        color: const Color(0xffdbd6d6),
                      ),
                      softWrap: false,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(size: size.height * 0.15, middle:size.height > size.width? 0.5017:0.0517),
            Pin(size: size.height * 0.15, start: size.height * 0.15),
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
                            BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
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
                    icon: Icon(Icons.add_photo_alternate),
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
                  child: Text(
                    'Language ',
                    style: TextStyle(
                      fontFamily: 'PMingLiU-ExtB',
                      fontSize: 18,
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
                            borderRadius: BorderRadius.all(
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
                  alignment: Alignment(-1.0, 0.647),
                  child: Container(
                    width: 3.0,
                    height: 3.0,
                    decoration: BoxDecoration(
                      color: const Color(0xff707070),
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                      border: Border.all(
                          width: 1.0, color: const Color(0xff707070)),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 14.0, end: 6.5),
                  Pin(size: 14.0, start: 2.5),
                  child: Text(
                    'on',
                    style: TextStyle(
                      fontFamily: 'Courier New',
                      fontSize: 12,
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
                  child: Text(
                    'Dark Mode',
                    style: TextStyle(
                      fontFamily: 'PMingLiU-ExtB',
                      fontSize: 18,
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
                              borderRadius: BorderRadius.all(
                                  Radius.elliptical(9999.0, 9999.0)),
                              border: Border.all(
                                  width: 1.0, color: const Color(0xff707070)),
                            ),
                          ),
                        ),
                        Pinned.fromPins(
                          Pin(size: 18.0, start: 3.5),
                          Pin(size: 11.0, end: 1.5),
                          child: Text(
                            'OFF',
                            style: TextStyle(
                              fontFamily: 'Courier New',
                              fontSize: 10,
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
                  alignment: Alignment(-1.0, 0.647),
                  child: Container(
                    width: 3.0,
                    height: 3.0,
                    decoration: BoxDecoration(
                      color: const Color(0xff707070),
                      borderRadius:
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
                              borderRadius: BorderRadius.all(
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
                              borderRadius: BorderRadius.all(
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
                              borderRadius: BorderRadius.all(
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
                  child: Text(
                    'Volume',
                    style: TextStyle(
                      fontFamily: 'PMingLiU-ExtB',
                      fontSize: 18,
                      color: const Color(0xff4b4949),
                    ),
                    softWrap: false,
                  ),
                ),
                Align(
                  alignment: Alignment(-1.0, 0.647),
                  child: Container(
                    width: 3.0,
                    height: 3.0,
                    decoration: BoxDecoration(
                      color: const Color(0xff707070),
                      borderRadius:
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
            Pin(start: 20.0, end: 48.0),
            Pin(size: 20.0, middle: 0.7105),
            child: Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(size: 43.0, start: 9.0),
                  Pin(start: 0.0, end: 0.0),
                  child: Text(
                    'Level',
                    style: TextStyle(
                      fontFamily: 'PMingLiU-ExtB',
                      fontSize: 18,
                      color: const Color(0xff4b4949),
                    ),
                    softWrap: false,
                  ),
                ),
                Align(
                  alignment: Alignment(-1.0, 0.647),
                  child: Container(
                    width: 3.0,
                    height: 3.0,
                    decoration: BoxDecoration(
                      color: const Color(0xff707070),
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                      border: Border.all(
                          width: 1.0, color: const Color(0xff707070)),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 8.0, end: 0.0),
                  Pin(size: 16.0, start: 1.0),
                  child: Text(
                    '0',
                    style: TextStyle(
                      fontFamily: 'PMingLiU-ExtB',
                      fontSize: 16,
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

const String _svg_pdme76 =
    '<svg viewBox="9.0 10.1 9.0 15.8" ><path  d="M 17.67200088500977 10.45400047302246 C 17.88359451293945 10.66506004333496 18.00251197814941 10.95163917541504 18.00251197814941 11.25050067901611 C 18.00251197814941 11.54936218261719 17.88359451293945 11.83594131469727 17.67200088500977 12.04700088500977 L 11.71599960327148 18 L 17.67199897766113 23.95400047302246 C 18.11189270019531 24.39389610290527 18.11189270019531 25.10710716247559 17.6719970703125 25.54700088500977 C 17.23210334777832 25.98689651489258 16.51889228820801 25.98689651489258 16.0789966583252 25.54700088500977 L 9.328998565673828 18.79700088500977 C 9.117405891418457 18.58593940734863 8.998488426208496 18.29936027526855 8.998488426208496 18.0004997253418 C 8.998488426208496 17.70163917541504 9.117404937744141 17.41506004333496 9.328998565673828 17.20400047302246 L 16.07899856567383 10.45400047302246 C 16.29006004333496 10.24240684509277 16.57663917541504 10.12348937988281 16.8754997253418 10.12348937988281 C 17.17436027526855 10.12348937988281 17.46094131469727 10.24240684509277 17.67200088500977 10.45400047302246 Z" fill="#f9f1f1" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_sira0z =
    '<svg viewBox="10.1 16.9 16.9 2.3" ><path  d="M 10.125 18 C 10.125 17.3786792755127 10.62868022918701 16.875 11.25 16.875 L 25.875 16.875 C 26.4963207244873 16.875 27 17.3786792755127 27 18 C 27 18.6213207244873 26.4963207244873 19.125 25.875 19.125 L 11.25 19.125 C 10.6286792755127 19.125 10.125 18.6213207244873 10.125 18 Z" fill="#f9f1f1" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ggww97 =
    '<svg viewBox="21.0 83.1 90.9 41.6" ><path  d="M 111.9527435302734 102.8237762451172 C 106.0490264892578 93.31797790527344 93.05935668945312 83.125 66.5 83.125 C 39.94064331054688 83.125 26.95836067199707 93.30689239501953 21.04724884033203 102.8274688720703 C 32.0787239074707 116.655632019043 48.81072235107422 124.7027053833008 66.5 124.6875 C 84.18928527832031 124.7027053833008 100.9212875366211 116.6556243896484 111.952751159668 102.8274688720703 Z" fill="#e6e4e4" stroke="none" stroke-width="3.694444417953491" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_l =
    '<svg viewBox="41.6 24.9 49.9 49.9" ><path  d="M 66.5 74.8125 C 80.27259826660156 74.8125 91.4375 63.64760208129883 91.4375 49.875 C 91.4375 36.10239791870117 80.27259826660156 24.9375 66.5 24.9375 C 52.72739791870117 24.9375 41.5625 36.10239791870117 41.5625 49.875 C 41.5625 63.64760208129883 52.72739791870117 74.8125 66.5 74.8125 Z" fill="#cecdcd" stroke="none" stroke-width="3.694444417953491" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ocwynj =
    '<svg viewBox="0.0 0.0 133.0 133.0" ><path  d="M 66.5 8.3125 C 34.36392974853516 8.3125 8.3125 34.36393356323242 8.3125 66.5 C 8.3125 98.63607025146484 34.36393356323242 124.6875 66.5 124.6875 C 98.63607025146484 124.6875 124.6875 98.63607025146484 124.6875 66.5 C 124.6875 34.36392974853516 98.63607025146484 8.3125 66.5 8.3125 Z M 0 66.5 C 0 29.77306175231934 29.7730655670166 0 66.5 0 C 103.226936340332 0 133 29.7730655670166 133 66.5 C 133 103.226936340332 103.2269287109375 133 66.5 133 C 29.77306175231934 133 0 103.2269287109375 0 66.5 Z" fill="#ffffff" fill-opacity="0.0" stroke="#9e9d9d" stroke-width="3.694444417953491" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ddu0 =
    '<svg viewBox="167.5 607.5 225.0 1.0" ><path transform="translate(167.5, 607.5)" d="M 0 0 L 225 0" fill="none" stroke="#848d47" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
