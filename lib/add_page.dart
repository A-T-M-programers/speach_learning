import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:speach_learning/read_page.dart';
import './home_page.dart';
import 'package:adobe_xd/page_link.dart';
import 'package:flutter_svg/flutter_svg.dart';

class add_page extends StatelessWidget {
  add_page({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffeeece4),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(start: -64.0, end: -11.2),
            Pin(size: 310.0, start: 0.0),
            child: Stack(
              children: <Widget>[
                Stack(
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
                      Pin(size: 200.0, start: 0.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xff888579),
                          border: Border.all(
                              width: 1.0, color: const Color(0xff888579)),
                        ),
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(size: 232.5, start: 0.0),
                      Pin(start: 10.0, end: 0.0),
                      child: SvgPicture.string(
                        _svg_ql4fpw,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(size: 206.9, middle: 0.5202),
                      Pin(start: 10.0, end: 0.0),
                      child: SvgPicture.string(
                        _svg_gwwr,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(size: 198.5, end: 0.0),
                      Pin(start: 10.0, end: 0.0),
                      child: SvgPicture.string(
                        _svg_ag1ssr,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
                Pinned.fromPins(
                  Pin(start: 64.0, end: 11.2),
                  Pin(size: 53.0, start: 0.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xff888579),
                      border: Border.all(
                          width: 1.0, color: const Color(0xff707070)),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 18.0, start: 80.0),
                  Pin(size: 15.8, start: 19.0),
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
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(start: 48.5, end: 48.5),
            Pin(size: 35.5, start: 117.0),
            child: Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(size: 1.0, end: -1.0),
                  child: SvgPicture.string(
                    _svg_sr63,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 111.0, start: 31.5),
                  Pin(size: 27.0, start: 0.0),
                  child: Text(
                    'Enter Text ….',
                    style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontSize: 20,
                      color: const Color(0xffeed3d3),
                    ),
                    softWrap: false,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment(0.003, -0.02),
            child: SizedBox(
              width: 95.0,
              height: 110.0,
              child: PageLink(
                links: [
                  PageLinkInfo(
                    transition: LinkTransition.Fade,
                    ease: Curves.easeOut,
                    duration: 0.3,
                    pageBuilder: () =>{},
                  ),
                ],
                child: Stack(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffeeece4),
                        borderRadius: BorderRadius.circular(17.0),
                        border: Border.all(
                            width: 1.0, color: const Color(0xff707070)),
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(size: 57.0, middle: 0.5),
                      Pin(size: 20.0, end: 8.0),
                      child: Text(
                        'add file',
                        style: TextStyle(
                          fontFamily: 'PMingLiU-ExtB',
                          fontSize: 20,
                          color: const Color(0xff707070),
                        ),
                        softWrap: false,
                      ),
                    ),
                    Align(
                      alignment: Alignment(-0.015, 0.0),
                      child: SizedBox(
                        width: 30.0,
                        height: 30.0,
                        child: SvgPicture.string(
                          _svg_oy7ww,
                          allowDrawingOutsideViewBox: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 72.8, end: 39.2),
            Pin(size: 60.1, end: 57.9),
            child: PageLink(
              links: [
                PageLinkInfo(
                  transition: LinkTransition.Fade,
                  ease: Curves.easeOut,
                  duration: 0.3,
                  pageBuilder: () => read_page(),
                ),
              ],
              child: Stack(
                children: <Widget>[
                  SizedBox.expand(
                      child: SvgPicture.string(
                    _svg_gowi32,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  )),
                  Align(
                    alignment: Alignment(-0.258, 0.0),
                    child: SizedBox(
                      width: 26.0,
                      height: 17.0,
                      child: Stack(
                        children: <Widget>[
                          Pinned.fromPins(
                            Pin(size: 4.1, start: 0.0),
                            Pin(start: 2.5, end: 2.5),
                            child: SvgPicture.string(
                              _svg_blxhzz,
                              allowDrawingOutsideViewBox: true,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(size: 4.5, middle: 0.3249),
                            Pin(start: 0.0, end: 0.0),
                            child: SvgPicture.string(
                              _svg_d3yaw,
                              allowDrawingOutsideViewBox: true,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(size: 4.6, middle: 0.6689),
                            Pin(start: 3.3, end: 3.3),
                            child: SvgPicture.string(
                              _svg_xbzq4,
                              allowDrawingOutsideViewBox: true,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(size: 4.2, end: 0.0),
                            Pin(start: 2.5, end: 2.5),
                            child: SvgPicture.string(
                              _svg_gy3ddt,
                              allowDrawingOutsideViewBox: true,
                              fit: BoxFit.fill,
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
        ],
      ),
    );
  }
}

const String _svg_ql4fpw =
    '<svg viewBox="-73.0 -2227.0 232.5 300.0" ><path transform="translate(-73.0, -2227.0)" d="M 116.2445068359375 0 C 180.444580078125 0 232.489013671875 63.53021240234375 232.489013671875 141.898681640625 C 232.489013671875 220.2671813964844 132.0780792236328 344.606689453125 116.2445068359375 283.79736328125 C 100.4109649658203 222.9880981445312 0 220.2671813964844 0 141.898681640625 C 0 63.53021240234375 52.0444450378418 0 116.2445068359375 0 Z" fill="#888579" stroke="#888579" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_gwwr =
    '<svg viewBox="81.1 -2227.0 206.9 300.0" ><path transform="translate(81.11, -2227.0)" d="M 103.4497375488281 0 C 160.5834503173828 0 206.8994750976562 63.96303176879883 206.8994750976562 142.8654174804688 C 206.8994750976562 221.7677917480469 119.2037734985352 341.3616943359375 103.4497375488281 285.7308349609375 C 87.69570159912109 230.0999755859375 0 221.7677917480469 0 142.8654174804688 C 0 63.96303176879883 46.3160285949707 0 103.4497375488281 0 Z" fill="#888579" stroke="#888579" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ag1ssr =
    '<svg viewBox="231.7 -2227.0 198.5 300.0" ><path transform="translate(231.69, -2227.0)" d="M 99.24234008789062 0 C 154.0523681640625 0 198.4846801757812 63.53021621704102 198.4846801757812 141.8986968994141 C 198.4846801757812 220.2671813964844 110.1236801147461 344.606689453125 99.24234008789062 283.7973937988281 C 88.36099243164062 222.9880981445312 0 220.2671813964844 0 141.8986968994141 C 0 63.53021621704102 44.43231582641602 0 99.24234008789062 0 Z" fill="#888579" stroke="#888579" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_pdme76 =
    '<svg viewBox="9.0 10.1 9.0 15.8" ><path  d="M 17.67200088500977 10.45400047302246 C 17.88359451293945 10.66506004333496 18.00251197814941 10.95163917541504 18.00251197814941 11.25050067901611 C 18.00251197814941 11.54936218261719 17.88359451293945 11.83594131469727 17.67200088500977 12.04700088500977 L 11.71599960327148 18 L 17.67199897766113 23.95400047302246 C 18.11189270019531 24.39389610290527 18.11189270019531 25.10710716247559 17.6719970703125 25.54700088500977 C 17.23210334777832 25.98689651489258 16.51889228820801 25.98689651489258 16.0789966583252 25.54700088500977 L 9.328998565673828 18.79700088500977 C 9.117405891418457 18.58593940734863 8.998488426208496 18.29936027526855 8.998488426208496 18.0004997253418 C 8.998488426208496 17.70163917541504 9.117404937744141 17.41506004333496 9.328998565673828 17.20400047302246 L 16.07899856567383 10.45400047302246 C 16.29006004333496 10.24240684509277 16.57663917541504 10.12348937988281 16.8754997253418 10.12348937988281 C 17.17436027526855 10.12348937988281 17.46094131469727 10.24240684509277 17.67200088500977 10.45400047302246 Z" fill="#f9f1f1" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_sira0z =
    '<svg viewBox="10.1 16.9 16.9 2.3" ><path  d="M 10.125 18 C 10.125 17.3786792755127 10.62868022918701 16.875 11.25 16.875 L 25.875 16.875 C 26.4963207244873 16.875 27 17.3786792755127 27 18 C 27 18.6213207244873 26.4963207244873 19.125 25.875 19.125 L 11.25 19.125 C 10.6286792755127 19.125 10.125 18.6213207244873 10.125 18 Z" fill="#f9f1f1" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_sr63 =
    '<svg viewBox="48.5 152.5 331.0 1.0" ><path transform="translate(48.5, 152.5)" d="M 331 0 L 0 0" fill="none" stroke="#ccbbbb" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_oy7ww =
    '<svg viewBox="199.0 248.0 30.0 30.0" ><path transform="translate(196.0, 245.0)" d="M 6 9 L 3 9 L 3 30 C 3 31.64999961853027 4.349999904632568 33 6 33 L 27 33 L 27 30 L 6 30 L 6 9 Z M 30 3 L 12 3 C 10.35000038146973 3 9 4.349999904632568 9 6 L 9 24 C 9 25.64999961853027 10.35000038146973 27 12 27 L 30 27 C 31.64999961853027 27 33 25.64999961853027 33 24 L 33 6 C 33 4.349999904632568 31.64999961853027 3 30 3 Z M 28.5 16.5 L 22.5 16.5 L 22.5 22.5 L 19.5 22.5 L 19.5 16.5 L 13.5 16.5 L 13.5 13.5 L 19.5 13.5 L 19.5 7.5 L 22.5 7.5 L 22.5 13.5 L 28.5 13.5 L 28.5 16.5 Z" fill="#79882b" fill-opacity="0.83" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_blxhzz =
    '<svg viewBox="0.0 2.5 4.1 12.5" ><path transform="translate(0.09, 2.48)" d="M 1.967854619026184 -0.0001080089714378119 C 4.151819705963135 -0.01916300319135189 3.999311685562134 2.793258428573608 3.999311685562134 6.239049911499023 C 3.999311685562134 9.684841156005859 4.424903392791748 12.41730499267578 1.967854619026184 12.47820949554443 C -0.4891944229602814 12.53911399841309 -0.06360273808240891 9.684841156005859 -0.06360273808240891 6.239049911499023 C -0.06360273808240891 2.793258428573608 -0.2161106616258621 0.01894698292016983 1.967854619026184 -0.0001080089714378119 Z" fill="#ddffcc" fill-opacity="0.49" stroke="#ddffcc" stroke-width="1" stroke-opacity="0.0" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_d3yaw =
    '<svg viewBox="7.1 0.0 4.5 17.5" ><path transform="translate(7.16, 0.01)" d="M 2.213550567626953 -0.004938301164656878 C 4.688959121704102 -0.1280732154846191 4.450174808502197 3.911765336990356 4.450174808502197 8.743264198303223 C 4.450174808502197 13.57476234436035 4.499468326568604 17.44812774658203 2.213550567626953 17.4914665222168 C -0.0723678320646286 17.53480339050293 -0.02307373285293579 13.57476234436035 -0.02307373285293579 8.743264198303223 C -0.02307373285293579 3.911765336990356 -0.2618572413921356 0.1181966289877892 2.213550567626953 -0.004938301164656878 Z" fill="#ddffcc" fill-opacity="0.49" stroke="#ddffcc" stroke-width="1" stroke-opacity="0.0" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_xbzq4 =
    '<svg viewBox="14.6 3.3 4.6 10.8" ><path transform="translate(14.63, 3.34)" d="M 2.280761480331421 -0.004920233972370625 C 4.561712741851807 0.07387544214725494 4.5615234375 2.374162912368774 4.5615234375 5.308910846710205 C 4.5615234375 8.243658065795898 4.561712741851807 10.8209228515625 2.280761480331421 10.8209228515625 C -0.0001896563189802691 10.8209228515625 -1.80592692800019e-07 8.243658065795898 -1.80592692800019e-07 5.308910846710205 C -1.80592692800019e-07 2.374162912368774 -0.0001896563189802691 -0.08371590822935104 2.280761480331421 -0.004920233972370625 Z" fill="#ddffcc" fill-opacity="0.49" stroke="#ddffcc" stroke-width="1" stroke-opacity="0.0" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_gy3ddt =
    '<svg viewBox="22.2 2.5 4.2 12.4" ><path transform="translate(22.26, 2.54)" d="M 2.064984321594238 -0.001448087394237518 C 4.495635032653809 -0.06252509355545044 4.165196895599365 2.777401685714722 4.165196895599365 6.205286979675293 C 4.165196895599365 9.633169174194336 4.317702770233154 12.52388477325439 2.064984321594238 12.41201877593994 C -0.1877345144748688 12.30015563964844 -0.03522882610559464 9.633169174194336 -0.03522882610559464 6.205286979675293 C -0.03522882610559464 2.777401685714722 -0.3656669855117798 0.059628926217556 2.064984321594238 -0.001448087394237518 Z" fill="#ddffcc" fill-opacity="0.49" stroke="#ddffcc" stroke-width="1" stroke-opacity="0.0" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_gowi32 =
    '<svg viewBox="146.0 695.0 72.8 60.1" ><path transform="translate(146.0, 695.0)" d="M 28.61854362487793 0 C 44.42412567138672 0 57.23708724975586 13.46099185943604 57.23708724975586 30.06596755981445 C 57.23708724975586 36.60832977294922 50.61178970336914 55.28749084472656 72.804931640625 58.21096038818359 C 67.361328125 60.23491668701172 38.19672775268555 60.13193511962891 28.61854362487793 60.13193511962891 C 12.81296062469482 60.13193511962891 0 46.67094802856445 0 30.06596755981445 C 0 13.46099185943604 12.81296062469482 0 28.61854362487793 0 Z" fill="#554616" stroke="#554616" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
