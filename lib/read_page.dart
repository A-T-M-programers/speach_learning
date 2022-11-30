import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import './home_page.dart';
import 'package:adobe_xd/page_link.dart';
import 'package:flutter_svg/flutter_svg.dart';

class read_page extends StatelessWidget {
  read_page({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffeeece4),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(size: 53.0, start: 0.0),
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xff888579),
                    border:
                        Border.all(width: 1.0, color: const Color(0xff707070)),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 18.0, start: 16.0),
                  Pin(size: 15.8, middle: 0.5101),
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
            Pin(size: 45.0, start: 26.0),
            Pin(size: 45.0, end: 62.0),
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffd4af37),
                    borderRadius:
                        BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                    border:
                        Border.all(width: 1.0, color: const Color(0xffd4af37)),
                  ),
                ),
                Center(
                  child: SizedBox(
                    width: 20.0,
                    height: 32.0,
                    child: Stack(
                      children: <Widget>[
                        Pinned.fromPins(
                          Pin(start: 0.0, end: 0.0),
                          Pin(size: 18.0, end: 0.0),
                          child: SvgPicture.string(
                            _svg_yxi9aw,
                            allowDrawingOutsideViewBox: true,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Pinned.fromPins(
                          Pin(start: 4.5, end: 4.5),
                          Pin(size: 22.5, start: 0.0),
                          child: SvgPicture.string(
                            _svg_hmg344,
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
            Pin(start: 48.5, end: 19.6),
            Pin(size: 134.0, middle: 0.7058),
            child: Stack(
              children: <Widget>[
                SizedBox.expand(
                    child: SvgPicture.string(
                  _svg_quqi4l,
                  allowDrawingOutsideViewBox: true,
                  fit: BoxFit.fill,
                )),
                Pinned.fromPins(
                  Pin(size: 252.7, start: 15.8),
                  Pin(size: 57.8, middle: 0.5197),
                  child: Stack(
                    children: <Widget>[
                      Pinned.fromPins(
                        Pin(size: 86.9, end: 30.2),
                        Pin(start: 1.4, end: 1.4),
                        child: Stack(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.centerLeft,
                              child: SizedBox(
                                width: 5.0,
                                height: 26.0,
                                child: SvgPicture.string(
                                  _svg_vpejl,
                                  allowDrawingOutsideViewBox: true,
                                ),
                              ),
                            ),
                            Pinned.fromPins(
                              Pin(size: 5.0, middle: 0.2932),
                              Pin(start: 0.0, end: 0.0),
                              child: SvgPicture.string(
                                _svg_qzld1c,
                                allowDrawingOutsideViewBox: true,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Pinned.fromPins(
                              Pin(size: 5.0, middle: 0.6544),
                              Pin(start: 7.6, end: 7.6),
                              child: SvgPicture.string(
                                _svg_e1n,
                                allowDrawingOutsideViewBox: true,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Pinned.fromPins(
                              Pin(size: 5.0, end: 0.0),
                              Pin(start: 12.0, end: 12.0),
                              child: SvgPicture.string(
                                _svg_r,
                                allowDrawingOutsideViewBox: true,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Pinned.fromPins(
                              Pin(size: 5.0, middle: 0.4857),
                              Pin(start: 6.3, end: 6.3),
                              child: SvgPicture.string(
                                _svg_n63ehj,
                                allowDrawingOutsideViewBox: true,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Pinned.fromPins(
                              Pin(size: 5.0, end: 13.0),
                              Pin(start: 12.0, end: 12.0),
                              child: SvgPicture.string(
                                _svg_kmxy86,
                                allowDrawingOutsideViewBox: true,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Pinned.fromPins(
                              Pin(size: 5.0, start: 10.6),
                              Pin(start: 7.6, end: 7.6),
                              child: SvgPicture.string(
                                _svg_a3mbhj,
                                allowDrawingOutsideViewBox: true,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 128.6, start: 0.0),
                        Pin(start: 0.0, end: 0.0),
                        child: Stack(
                          children: <Widget>[
                            Align(
                              alignment: Alignment(-0.417, 0.0),
                              child: SizedBox(
                                width: 5.0,
                                height: 26.0,
                                child: SvgPicture.string(
                                  _svg_qzb68s,
                                  allowDrawingOutsideViewBox: true,
                                ),
                              ),
                            ),
                            Pinned.fromPins(
                              Pin(size: 5.0, middle: 0.5124),
                              Pin(start: 0.0, end: 0.0),
                              child: SvgPicture.string(
                                _svg_lll14,
                                allowDrawingOutsideViewBox: true,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Pinned.fromPins(
                              Pin(size: 5.0, middle: 0.7761),
                              Pin(start: 9.0, end: 9.1),
                              child: SvgPicture.string(
                                _svg_c9dprh,
                                allowDrawingOutsideViewBox: true,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Pinned.fromPins(
                              Pin(size: 5.0, end: 12.4),
                              Pin(start: 13.4, end: 13.4),
                              child: SvgPicture.string(
                                _svg_vabqt5,
                                allowDrawingOutsideViewBox: true,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: SizedBox(
                                width: 5.0,
                                height: 28.0,
                                child: SvgPicture.string(
                                  _svg_pd3j1x,
                                  allowDrawingOutsideViewBox: true,
                                ),
                              ),
                            ),
                            Pinned.fromPins(
                              Pin(size: 5.0, middle: 0.6417),
                              Pin(start: 6.8, end: 6.8),
                              child: SvgPicture.string(
                                _svg_hsj7n,
                                allowDrawingOutsideViewBox: true,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Pinned.fromPins(
                              Pin(size: 5.0, middle: 0.3876),
                              Pin(start: 9.0, end: 9.1),
                              child: SvgPicture.string(
                                _svg_t4wqfv,
                                allowDrawingOutsideViewBox: true,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: SizedBox(
                                width: 3.0,
                                height: 4.0,
                                child: SvgPicture.string(
                                  _svg_x0e,
                                  allowDrawingOutsideViewBox: true,
                                ),
                              ),
                            ),
                            Pinned.fromPins(
                              Pin(size: 2.7, start: 8.0),
                              Pin(size: 3.7, middle: 0.5072),
                              child: SvgPicture.string(
                                _svg_p7w7xa,
                                allowDrawingOutsideViewBox: true,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Pinned.fromPins(
                              Pin(size: 2.7, start: 16.0),
                              Pin(size: 3.7, middle: 0.5072),
                              child: SvgPicture.string(
                                _svg_pujj4y,
                                allowDrawingOutsideViewBox: true,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Align(
                              alignment: Alignment(-0.555, 0.012),
                              child: SizedBox(
                                width: 3.0,
                                height: 8.0,
                                child: SvgPicture.string(
                                  _svg_jv7gpw,
                                  allowDrawingOutsideViewBox: true,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 2.7, end: 16.0),
                        Pin(size: 3.7, middle: 0.5072),
                        child: SvgPicture.string(
                          _svg_wgn8pu,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 2.7, end: 8.0),
                        Pin(size: 3.7, middle: 0.5072),
                        child: SvgPicture.string(
                          _svg_ilsice,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: SizedBox(
                          width: 3.0,
                          height: 4.0,
                          child: SvgPicture.string(
                            _svg_rhtq72,
                            allowDrawingOutsideViewBox: true,
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 2.7, end: 23.0),
                        Pin(size: 8.4, middle: 0.5),
                        child: SvgPicture.string(
                          _svg_gu2d0f,
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
          Pinned.fromPins(
            Pin(start: 44.0, end: 44.0),
            Pin(size: 38.0, start: 111.0),
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffeeece4),
                    border:
                        Border.all(width: 1.0, color: const Color(0xff707070)),
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 3.0, end: 9.0),
                  Pin(size: 20.0, start: 4.0),
                  child: Text.rich(
                    TextSpan(
                      style: TextStyle(
                        fontFamily: 'PMingLiU-ExtB',
                        fontSize: 20,
                        color: const Color(0xff52f900),
                        shadows: [
                          Shadow(
                            color: const Color(0x29000000),
                            offset: Offset(0, 2),
                            blurRadius: 6,
                          )
                        ],
                      ),
                      children: [
                        TextSpan(
                          text: 'Hello',
                        ),
                        TextSpan(
                          text: ' ',
                          style: TextStyle(
                            color: const Color(0xff707070),
                          ),
                        ),
                        TextSpan(
                          text: 'world',
                          style: TextStyle(
                            color: const Color(0xffff0000),
                          ),
                        ),
                        TextSpan(
                          text: ', this app has a beautiful voice ',
                          style: TextStyle(
                            color: const Color(0xff707070),
                          ),
                        ),
                      ],
                    ),
                    textHeightBehavior:
                        TextHeightBehavior(applyHeightToFirstAscent: false),
                    textAlign: TextAlign.center,
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 41.0, start: 5.5),
                  Pin(size: 1.0, middle: 0.7432),
                  child: SvgPicture.string(
                    _svg_azu4co,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  ),
                ),
                Align(
                  alignment: Alignment(-0.629, 0.486),
                  child: SizedBox(
                    width: 41.0,
                    height: 1.0,
                    child: SvgPicture.string(
                      _svg_j,
                      allowDrawingOutsideViewBox: true,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(-0.317, 0.486),
                  child: SizedBox(
                    width: 28.0,
                    height: 1.0,
                    child: SvgPicture.string(
                      _svg_e1r2rk,
                      allowDrawingOutsideViewBox: true,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(-0.099, 0.486),
                  child: SizedBox(
                    width: 26.0,
                    height: 1.0,
                    child: SvgPicture.string(
                      _svg_al3ham,
                      allowDrawingOutsideViewBox: true,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0.092, 0.486),
                  child: SizedBox(
                    width: 26.0,
                    height: 1.0,
                    child: SvgPicture.string(
                      _svg_hn9tby,
                      allowDrawingOutsideViewBox: true,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0.221, 0.486),
                  child: SizedBox(
                    width: 10.0,
                    height: 1.0,
                    child: SvgPicture.string(
                      _svg_n2mm9y,
                      allowDrawingOutsideViewBox: true,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0.575, 0.486),
                  child: SizedBox(
                    width: 65.0,
                    height: 1.0,
                    child: SvgPicture.string(
                      _svg_l51gy,
                      allowDrawingOutsideViewBox: true,
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 38.0, end: 11.5),
                  Pin(size: 1.0, middle: 0.7432),
                  child: SvgPicture.string(
                    _svg_whal6s,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_pdme76 =
    '<svg viewBox="9.0 10.1 9.0 15.8" ><path  d="M 17.67200088500977 10.45400047302246 C 17.88359451293945 10.66506004333496 18.00251197814941 10.95163917541504 18.00251197814941 11.25050067901611 C 18.00251197814941 11.54936218261719 17.88359451293945 11.83594131469727 17.67200088500977 12.04700088500977 L 11.71599960327148 18 L 17.67199897766113 23.95400047302246 C 18.11189270019531 24.39389610290527 18.11189270019531 25.10710716247559 17.6719970703125 25.54700088500977 C 17.23210334777832 25.98689651489258 16.51889228820801 25.98689651489258 16.0789966583252 25.54700088500977 L 9.328998565673828 18.79700088500977 C 9.117405891418457 18.58593940734863 8.998488426208496 18.29936027526855 8.998488426208496 18.0004997253418 C 8.998488426208496 17.70163917541504 9.117404937744141 17.41506004333496 9.328998565673828 17.20400047302246 L 16.07899856567383 10.45400047302246 C 16.29006004333496 10.24240684509277 16.57663917541504 10.12348937988281 16.8754997253418 10.12348937988281 C 17.17436027526855 10.12348937988281 17.46094131469727 10.24240684509277 17.67200088500977 10.45400047302246 Z" fill="#f9f1f1" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_sira0z =
    '<svg viewBox="10.1 16.9 16.9 2.3" ><path  d="M 10.125 18 C 10.125 17.3786792755127 10.62868022918701 16.875 11.25 16.875 L 25.875 16.875 C 26.4963207244873 16.875 27 17.3786792755127 27 18 C 27 18.6213207244873 26.4963207244873 19.125 25.875 19.125 L 11.25 19.125 C 10.6286792755127 19.125 10.125 18.6213207244873 10.125 18 Z" fill="#f9f1f1" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_yxi9aw =
    '<svg viewBox="7.9 15.8 20.3 18.0" ><path  d="M 25.875 15.75 L 25.875 19.125 C 25.875 23.4742431640625 22.3492431640625 27 18 27 C 13.6507568359375 27 10.125 23.4742431640625 10.125 19.125 L 10.125 15.75 L 7.875 15.75 L 7.875 19.125 C 7.877700805664062 24.27951812744141 11.75240325927734 28.60927963256836 16.87500190734863 29.18200302124023 L 16.875 31.5 L 12.375 31.5 L 12.375 33.75 L 23.625 33.75 L 23.625 31.5 L 19.125 31.5 L 19.125 29.1830005645752 C 24.24797821044922 28.61023330688477 28.1228084564209 24.2798957824707 28.125 19.125 L 28.125 15.75 L 25.875 15.75 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_hmg344 =
    '<svg viewBox="12.4 2.3 11.3 22.5" ><path  d="M 18 24.75 C 21.10660362243652 24.75 23.62500190734863 22.23160171508789 23.62500190734863 19.12499809265137 L 23.625 7.875 C 23.62500190734863 4.768398284912109 21.10660362243652 2.25 18.00000190734863 2.25 C 14.89340019226074 2.25 12.37500190734863 4.768398284912109 12.37500190734863 7.875000476837158 L 12.375 19.125 C 12.375 22.23160171508789 14.89339828491211 24.75 18 24.75 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_vpejl =
    '<svg viewBox="157.0 425.3 5.0 26.5" ><path transform="translate(157.06, 425.26)" d="M 2.408223152160645 0 C 5.059140205383301 -0.040435791015625 4.874024868011475 5.927684307098389 4.874024868011475 13.23985290527344 C 4.874024868011475 20.5520191192627 5.390612602233887 26.3504638671875 2.408223152160645 26.47970581054688 C -0.5741664171218872 26.60894775390625 -0.05757910385727882 20.5520191192627 -0.05757910385727882 13.23985290527344 C -0.05757910385727882 5.927684307098389 -0.2426947057247162 0.040435791015625 2.408223152160645 0 Z" fill="#ddffcc" fill-opacity="0.64" stroke="#ddffcc" stroke-width="1" stroke-opacity="0.0" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_qzld1c =
    '<svg viewBox="181.0 411.0 5.0 55.0" ><path transform="translate(181.0, 411.01)" d="M 2.470680952072144 0.0009381046402268112 C 5.229878425598145 -0.386028379201889 4.963719844818115 12.30965709686279 4.963719844818115 27.49322891235352 C 4.963719844818115 42.67679977416992 5.018664836883545 54.84932708740234 2.470680952072144 54.98551940917969 C -0.07730309665203094 55.12171173095703 -0.0223577506840229 42.67679977416992 -0.0223577506840229 27.49322891235352 C -0.0223577506840229 12.30965709686279 -0.2885161936283112 0.3879046142101288 2.470680952072144 0.0009381046402268112 Z" fill="#ddffcc" fill-opacity="0.64" stroke="#ddffcc" stroke-width="1" stroke-opacity="0.0" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_e1n =
    '<svg viewBox="210.6 418.6 5.0 39.7" ><path transform="translate(210.55, 418.64)" d="M 2.5 0 C 5.000207901000977 0.289154052734375 5 8.730448722839355 5 19.5 C 5 30.26955032348633 5.000207901000977 39.72726440429688 2.5 39.72726440429688 C -0.0002076891105389223 39.72726440429688 -1.489970993806544e-11 30.26955032348633 -1.489970993806544e-11 19.5 C -1.489970993806544e-11 8.730448722839355 -0.0002076891105389223 -0.289154052734375 2.5 0 Z" fill="#ddffcc" fill-opacity="0.64" stroke="#ddffcc" stroke-width="1" stroke-opacity="0.0" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_r =
    '<svg viewBox="238.8 423.0 5.0 31.0" ><path transform="translate(238.9, 422.99)" d="M 2.449671030044556 0 C 5.322355270385742 -0.15252685546875 4.931824207305908 6.939586639404297 4.931824207305908 15.5 C 4.931824207305908 24.0604133605957 5.112064361572266 31.27935791015625 2.449671030044556 31 C -0.2127228081226349 30.72064208984375 -0.03248272836208344 24.0604133605957 -0.03248272836208344 15.5 C -0.03248272836208344 6.939586639404297 -0.4230137467384338 0.15252685546875 2.449671030044556 0 Z" fill="#ddffcc" fill-opacity="0.64" stroke="#ddffcc" stroke-width="1" stroke-opacity="0.0" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_n63ehj =
    '<svg viewBox="196.7 417.3 5.0 42.4" ><path transform="translate(196.74, 417.28)" d="M 2.5 0.0004608138406183571 C 5.000207901000977 0.3093101978302002 5 9.32557201385498 5 20.82867813110352 C 5 32.33178329467773 5.000207901000977 42.43369674682617 2.5 42.43369674682617 C -0.0002076891105389223 42.43369674682617 -1.489970993806544e-11 32.33178329467773 -1.489970993806544e-11 20.82867813110352 C -1.489970993806544e-11 9.32557201385498 -0.0002076891105389223 -0.3083885908126831 2.5 0.0004608138406183571 Z" fill="#ddffcc" fill-opacity="0.64" stroke="#ddffcc" stroke-width="1" stroke-opacity="0.0" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_kmxy86 =
    '<svg viewBox="225.8 423.0 5.0 31.0" ><path transform="translate(225.9, 422.99)" d="M 2.449671030044556 0 C 5.3223557472229 -0.15252685546875 4.931824207305908 6.939586639404297 4.931824207305908 15.5 C 4.931824207305908 24.0604133605957 5.112064838409424 31.27935791015625 2.449671030044556 31 C -0.2127228081226349 30.72064208984375 -0.03248272836208344 24.0604133605957 -0.03248272836208344 15.5 C -0.03248272836208344 6.939586639404297 -0.4230137765407562 0.15252685546875 2.449671030044556 0 Z" fill="#ddffcc" fill-opacity="0.64" stroke="#ddffcc" stroke-width="1" stroke-opacity="0.0" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_a3mbhj =
    '<svg viewBox="167.6 418.6 5.0 39.7" ><path transform="translate(167.55, 418.64)" d="M 2.5 0 C 5.000207901000977 0.289154052734375 5 8.730448722839355 5 19.5 C 5 30.26955032348633 5.000207901000977 39.72726440429688 2.5 39.72726440429688 C -0.0002076891105389223 39.72726440429688 -1.489970993806544e-11 30.26955032348633 -1.489970993806544e-11 19.5 C -1.489970993806544e-11 8.730448722839355 -0.0002076891105389223 -0.289154052734375 2.5 0 Z" fill="#ddffcc" fill-opacity="0.64" stroke="#ddffcc" stroke-width="1" stroke-opacity="0.0" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_qzb68s =
    '<svg viewBox="172.7 425.3 5.0 26.5" ><path transform="translate(172.75, 425.26)" d="M 2.408223390579224 0 C 5.059140682220459 -0.040435791015625 4.874024868011475 5.927684307098389 4.874024868011475 13.23985290527344 C 4.874024868011475 20.5520191192627 5.390612125396729 26.3504638671875 2.408223390579224 26.47970581054688 C -0.574166476726532 26.60894775390625 -0.05757918208837509 20.5520191192627 -0.05757918208837509 13.23985290527344 C -0.05757918208837509 5.927684307098389 -0.2426947802305222 0.040435791015625 2.408223390579224 0 Z" fill="#ddffcc" fill-opacity="0.64" stroke="#ddffcc" stroke-width="1" stroke-opacity="0.0" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_lll14 =
    '<svg viewBox="200.0 409.6 5.0 57.8" ><path transform="translate(200.0, 409.6)" d="M 2.470680952072144 0.00138256442733109 C 5.229878425598145 -0.4055387675762177 4.963719367980957 12.9448299407959 4.963719367980957 28.91137886047363 C 4.963719367980957 44.87792587280273 5.018664836883545 57.67815780639648 2.470680952072144 57.82137298583984 C -0.07730309665203094 57.9645881652832 -0.0223577506840229 44.87792587280273 -0.0223577506840229 28.91137886047363 C -0.0223577506840229 12.9448299407959 -0.2885162234306335 0.4083038866519928 2.470680952072144 0.00138256442733109 Z" fill="#ddffcc" fill-opacity="0.64" stroke="#ddffcc" stroke-width="1" stroke-opacity="0.0" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_c9dprh =
    '<svg viewBox="232.6 418.6 5.0 39.7" ><path transform="translate(232.55, 418.64)" d="M 2.5 0 C 5.000207424163818 0.289154052734375 5 8.730448722839355 5 19.5 C 5 30.26955032348633 5.000207424163818 39.72726440429688 2.5 39.72726440429688 C -0.000207689095987007 39.72726440429688 -1.489970993806544e-11 30.26955032348633 -1.489970993806544e-11 19.5 C -1.489970993806544e-11 8.730448722839355 -0.000207689095987007 -0.289154052734375 2.5 0 Z" fill="#ddffcc" fill-opacity="0.64" stroke="#ddffcc" stroke-width="1" stroke-opacity="0.0" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_vabqt5 =
    '<svg viewBox="247.8 423.0 5.0 31.0" ><path transform="translate(247.9, 422.99)" d="M 2.449671506881714 0 C 5.322356700897217 -0.15252685546875 4.931825637817383 6.939586639404297 4.931825637817383 15.5 C 4.931825637817383 24.0604133605957 5.11206579208374 31.27935791015625 2.449671506881714 31 C -0.2127228677272797 30.72064208984375 -0.03248272463679314 24.0604133605957 -0.03248272463679314 15.5 C -0.03248272463679314 6.939586639404297 -0.423013836145401 0.15252685546875 2.449671506881714 0 Z" fill="#ddffcc" fill-opacity="0.64" stroke="#ddffcc" stroke-width="1" stroke-opacity="0.0" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_pd3j1x =
    '<svg viewBox="260.2 424.5 5.0 27.9" ><path transform="translate(260.26, 424.55)" d="M 2.449670553207397 -0.0002414912160020322 C 5.322354316711426 -0.1375176608562469 4.93182373046875 6.245477676391602 4.93182373046875 13.94996166229248 C 4.93182373046875 21.65444564819336 5.112063884735107 28.15158843994141 2.449670553207397 27.9001636505127 C -0.2127227932214737 27.64873695373535 -0.03248272836208344 21.65444564819336 -0.03248272836208344 13.94996166229248 C -0.03248272836208344 6.245477676391602 -0.4230136871337891 0.137034684419632 2.449670553207397 -0.0002414912160020322 Z" fill="#ddffcc" fill-opacity="0.64" stroke="#ddffcc" stroke-width="1" stroke-opacity="0.0" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_hsj7n =
    '<svg viewBox="215.9 416.3 5.0 44.3" ><path transform="translate(215.94, 416.35)" d="M 2.499999761581421 0.0007797616999596357 C 5.00020694732666 0.3232610821723938 4.999999523162842 9.737482070922852 4.999999523162842 21.7483081817627 C 4.999999523162842 33.75913238525391 5.00020694732666 44.30692291259766 2.499999761581421 44.30692291259766 C -0.0002076890814350918 44.30692291259766 -1.489971340751239e-11 33.75913238525391 -1.489971340751239e-11 21.7483081817627 C -1.489971340751239e-11 9.737482070922852 -0.0002076890814350918 -0.3217015862464905 2.499999761581421 0.0007797616999596357 Z" fill="#ddffcc" fill-opacity="0.64" stroke="#ddffcc" stroke-width="1" stroke-opacity="0.0" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_t4wqfv =
    '<svg viewBox="184.6 418.6 5.0 39.7" ><path transform="translate(184.55, 418.64)" d="M 2.5 0 C 5.000207424163818 0.289154052734375 5 8.730448722839355 5 19.5 C 5 30.26955032348633 5.000207424163818 39.72726440429688 2.5 39.72726440429688 C -0.000207689095987007 39.72726440429688 -1.489970993806544e-11 30.26955032348633 -1.489970993806544e-11 19.5 C -1.489970993806544e-11 8.730448722839355 -0.000207689095987007 -0.289154052734375 2.5 0 Z" fill="#ddffcc" fill-opacity="0.64" stroke="#ddffcc" stroke-width="1" stroke-opacity="0.0" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_x0e =
    '<svg viewBox="136.7 437.0 2.7 3.7" ><path transform="translate(136.75, 437.04)" d="M 1.277476072311401 -0.0001756703277351335 C 2.729386806488037 -0.005836826283484697 2.62799859046936 0.8297214508056641 2.62799859046936 1.853451251983643 C 2.62799859046936 2.877180814743042 2.910934209823608 3.688983917236328 1.277476072311401 3.707078218460083 C -0.3559825718402863 3.725172519683838 -0.07304707169532776 2.877180814743042 -0.07304707169532776 1.853451251983643 C -0.07304707169532776 0.8297214508056641 -0.1744351089000702 0.005485485773533583 1.277476072311401 -0.0001756703277351335 Z" fill="#ddffcc" fill-opacity="0.64" stroke="#ddffcc" stroke-width="1" stroke-opacity="0.0" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_p7w7xa =
    '<svg viewBox="144.7 437.0 2.7 3.7" ><path transform="translate(144.75, 437.04)" d="M 1.277476072311401 -0.0001756703277351335 C 2.729386806488037 -0.005836826283484697 2.62799859046936 0.8297214508056641 2.62799859046936 1.853451251983643 C 2.62799859046936 2.877180814743042 2.910934209823608 3.688983917236328 1.277476072311401 3.707078218460083 C -0.3559825718402863 3.725172519683838 -0.07304707169532776 2.877180814743042 -0.07304707169532776 1.853451251983643 C -0.07304707169532776 0.8297214508056641 -0.1744351089000702 0.005485485773533583 1.277476072311401 -0.0001756703277351335 Z" fill="#ddffcc" fill-opacity="0.64" stroke="#ddffcc" stroke-width="1" stroke-opacity="0.0" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_pujj4y =
    '<svg viewBox="152.7 437.0 2.7 3.7" ><path transform="translate(152.75, 437.04)" d="M 1.277476072311401 -0.0001756703277351335 C 2.729386806488037 -0.005836826283484697 2.62799859046936 0.8297214508056641 2.62799859046936 1.853451251983643 C 2.62799859046936 2.877180814743042 2.910934209823608 3.688983917236328 1.277476072311401 3.707078218460083 C -0.3559825718402863 3.725172519683838 -0.07304707169532776 2.877180814743042 -0.07304707169532776 1.853451251983643 C -0.07304707169532776 0.8297214508056641 -0.1744351089000702 0.005485485773533583 1.277476072311401 -0.0001756703277351335 Z" fill="#ddffcc" fill-opacity="0.64" stroke="#ddffcc" stroke-width="1" stroke-opacity="0.0" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_jv7gpw =
    '<svg viewBox="164.7 434.6 2.7 8.4" ><path transform="translate(164.75, 434.58)" d="M 1.277476072311401 -0.0001392239209963009 C 2.729386806488037 -0.01301508955657482 2.62799859046936 1.887398242950439 2.62799859046936 4.215793132781982 C 2.62799859046936 6.544187545776367 2.910934209823608 8.390572547912598 1.277476072311401 8.431726455688477 C -0.3559825718402863 8.472880363464355 -0.07304707169532776 6.544187545776367 -0.07304707169532776 4.215793132781982 C -0.07304707169532776 1.887398242950439 -0.1744351089000702 0.01273664180189371 1.277476072311401 -0.0001392239209963009 Z" fill="#ddffcc" fill-opacity="0.64" stroke="#ddffcc" stroke-width="1" stroke-opacity="0.0" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_wgn8pu =
    '<svg viewBox="322.3 332.0 2.7 3.7" ><path transform="translate(322.42, 332.04)" d="M 1.277476072311401 -0.0001756703277351335 C 2.729386806488037 -0.005836826283484697 2.62799859046936 0.8297214508056641 2.62799859046936 1.853451251983643 C 2.62799859046936 2.877180814743042 2.910934209823608 3.688983917236328 1.277476072311401 3.707078218460083 C -0.3559825718402863 3.725172519683838 -0.07304707169532776 2.877180814743042 -0.07304707169532776 1.853451251983643 C -0.07304707169532776 0.8297214508056641 -0.1744351089000702 0.005485485773533583 1.277476072311401 -0.0001756703277351335 Z" fill="#ddffcc" fill-opacity="0.64" stroke="#ddffcc" stroke-width="1" stroke-opacity="0.0" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ilsice =
    '<svg viewBox="330.3 332.0 2.7 3.7" ><path transform="translate(330.42, 332.04)" d="M 1.277476072311401 -0.0001756703277351335 C 2.729386806488037 -0.005836826283484697 2.62799859046936 0.8297214508056641 2.62799859046936 1.853451251983643 C 2.62799859046936 2.877180814743042 2.910934209823608 3.688983917236328 1.277476072311401 3.707078218460083 C -0.3559825718402863 3.725172519683838 -0.07304707169532776 2.877180814743042 -0.07304707169532776 1.853451251983643 C -0.07304707169532776 0.8297214508056641 -0.1744351089000702 0.005485485773533583 1.277476072311401 -0.0001756703277351335 Z" fill="#ddffcc" fill-opacity="0.64" stroke="#ddffcc" stroke-width="1" stroke-opacity="0.0" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_rhtq72 =
    '<svg viewBox="338.3 332.0 2.7 3.7" ><path transform="translate(338.42, 332.04)" d="M 1.277476072311401 -0.0001756703277351335 C 2.729386806488037 -0.005836826283484697 2.62799859046936 0.8297214508056641 2.62799859046936 1.853451251983643 C 2.62799859046936 2.877180814743042 2.910934209823608 3.688983917236328 1.277476072311401 3.707078218460083 C -0.3559825718402863 3.725172519683838 -0.07304707169532776 2.877180814743042 -0.07304707169532776 1.853451251983643 C -0.07304707169532776 0.8297214508056641 -0.1744351089000702 0.005485485773533583 1.277476072311401 -0.0001756703277351335 Z" fill="#ddffcc" fill-opacity="0.64" stroke="#ddffcc" stroke-width="1" stroke-opacity="0.0" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_gu2d0f =
    '<svg viewBox="315.3 329.3 2.7 8.4" ><path transform="translate(315.42, 329.29)" d="M 1.277476072311401 -0.0001392239209963009 C 2.729386806488037 -0.01301508955657482 2.62799859046936 1.887398242950439 2.62799859046936 4.215793132781982 C 2.62799859046936 6.544187545776367 2.910934209823608 8.390572547912598 1.277476072311401 8.431726455688477 C -0.3559825718402863 8.472880363464355 -0.07304707169532776 6.544187545776367 -0.07304707169532776 4.215793132781982 C -0.07304707169532776 1.887398242950439 -0.1744351089000702 0.01273664180189371 1.277476072311401 -0.0001392239209963009 Z" fill="#ddffcc" fill-opacity="0.64" stroke="#ddffcc" stroke-width="1" stroke-opacity="0.0" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_quqi4l =
    '<svg viewBox="146.0 695.0 359.9 134.0" ><path transform="translate(146.0, 695.0)" d="M 141.4691314697266 0 C 219.6003723144531 0 282.9382629394531 29.99692153930664 282.9382629394531 67 C 282.9382629394531 81.57921600341797 250.1876373291016 123.2044677734375 359.894287109375 129.71923828125 C 332.985107421875 134.2294921875 188.8166656494141 134 141.4691314697266 134 C 63.33789825439453 134 0 104.0030822753906 0 67 C 0 29.99692153930664 63.33789825439453 0 141.4691314697266 0 Z" fill="#554616" stroke="#554616" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_azu4co =
    '<svg viewBox="35.5 172.5 41.0 1.0" ><path transform="translate(35.5, 172.5)" d="M 0 0 L 41 0" fill="none" stroke="#62df24" stroke-width="1" stroke-dasharray="1 1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_j =
    '<svg viewBox="85.5 172.5 41.0 1.0" ><path transform="translate(85.5, 172.5)" d="M 0 0 L 41 0" fill="none" stroke="#ef0000" stroke-width="1" stroke-dasharray="1 1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_e1r2rk =
    '<svg viewBox="136.5 172.5 28.0 1.0" ><path transform="translate(136.5, 172.5)" d="M 0 0 L 28 0" fill="none" stroke="#646464" stroke-width="1" stroke-dasharray="1 1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_al3ham =
    '<svg viewBox="171.5 172.5 26.0 1.0" ><path transform="translate(171.5, 172.5)" d="M 0 0 L 26 0" fill="none" stroke="#646464" stroke-width="1" stroke-dasharray="1 1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_hn9tby =
    '<svg viewBox="201.5 172.5 26.0 1.0" ><path transform="translate(201.5, 172.5)" d="M 0 0 L 26 0" fill="none" stroke="#646464" stroke-width="1" stroke-dasharray="1 1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_n2mm9y =
    '<svg viewBox="231.5 172.5 10.0 1.0" ><path transform="translate(231.5, 172.5)" d="M 0 0 L 10 0" fill="none" stroke="#646464" stroke-width="1" stroke-dasharray="1 1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_l51gy =
    '<svg viewBox="246.5 172.5 65.0 1.0" ><path transform="translate(246.5, 172.5)" d="M 0 0 L 65 0" fill="none" stroke="#646464" stroke-width="1" stroke-dasharray="1 1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_whal6s =
    '<svg viewBox="320.5 172.5 38.0 1.0" ><path transform="translate(320.5, 172.5)" d="M 0 0 L 38 0" fill="none" stroke="#646464" stroke-width="1" stroke-dasharray="1 1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
