import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:adobe_xd/page_link.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:speach_learning/profile_page.dart';

import 'add_page.dart';
import 'read_page.dart';

class home_page extends StatelessWidget {
  home_page({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffeeece4),
      body: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(26.0, 83.0, 10.0, -192.0),
            child: PageLink(
              links: [
                PageLinkInfo(
                  ease: Curves.linear,
                  duration: 0.3,
                  pageBuilder: () => read_page(),
                ),
              ],
              child: SingleChildScrollView(
                primary: false,
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 20,
                  runSpacing: 20,
                  children: [
                    {},
                    {},
                    {},
                    {},
                    {},
                    {},
                    {},
                    {},
                    {},
                    {},
                    {},
                    {},
                    {},
                    {},
                    {},
                    {},
                    {},
                    {},
                    {},
                    {},
                    {},
                    {},
                    {},
                    {},
                    {},
                    {},
                    {},
                    {}
                  ].map((itemData) {
                    return SizedBox(
                      width: 81.0,
                      height: 129.0,
                      child: PageLink(
                        links: [
                          PageLinkInfo(
                            ease: Curves.linear,
                            duration: 0.3,
                            pageBuilder: () => read_page(),
                          ),
                        ],
                        child: Stack(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                color: const Color(0xffeeece4),
                                border: Border.all(
                                    width: 1.0, color: const Color(0xffe2e0d5)),
                              ),
                            ),
                            Pinned.fromPins(
                              Pin(start: 6.0, end: 6.7),
                              Pin(size: 97.0, start: 9.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xffffffff),
                                  border: Border.all(
                                      width: 1.0,
                                      color: const Color(0x00707070)),
                                ),
                              ),
                            ),
                            Pinned.fromPins(
                              Pin(size: 38.0, middle: 0.5116),
                              Pin(size: 22.0, end: 1.0),
                              child: Text(
                                'English',
                                style: TextStyle(
                                  fontFamily: 'Sakkal Majalla',
                                  fontSize: 16,
                                  color: const Color(0xffeeece4),
                                  fontWeight: FontWeight.w700,
                                ),
                                softWrap: false,
                              ),
                            ),
                            Pinned.fromPins(
                              Pin(start: 5.9, end: 6.9),
                              Pin(size: 97.0, start: 9.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: const AssetImage(''),
                                    fit: BoxFit.fill,
                                  ),
                                ),
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
          ),
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
                  Pin(size: 124.0, end: 59.5),
                  Pin(size: 28.5, middle: 0.5306),
                  child: Stack(
                    children: <Widget>[
                      Pinned.fromPins(
                        Pin(start: 0.0, end: 0.0),
                        Pin(size: 1.0, end: -1.0),
                        child: SvgPicture.string(
                          _svg_begji,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 75.0, start: 7.0),
                        Pin(size: 17.0, start: 1.5),
                        child: Text(
                          'search......',
                          style: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 16,
                            color: const Color(0xffffffff),
                          ),
                          softWrap: false,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 24.5, end: 1.0),
                        Pin(size: 23.5, start: 0.0),
                        child: SvgPicture.string(
                          _svg_ba0n,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 27.0, start: 16.0),
                  Pin(size: 22.5, middle: 0.459),
                  child: Stack(
                    children: <Widget>[
                      Pinned.fromPins(
                        Pin(start: 0.0, end: 0.0),
                        Pin(size: 2.3, end: 0.0),
                        child: SvgPicture.string(
                          _svg_y9opy4,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(start: 0.0, end: 0.0),
                        Pin(size: 2.3, middle: 0.3333),
                        child: SvgPicture.string(
                          _svg_aa3y3y,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(start: 0.0, end: 0.0),
                        Pin(size: 2.3, middle: 0.6667),
                        child: SvgPicture.string(
                          _svg_yixnrq,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(start: 0.0, end: 0.0),
                        Pin(size: 2.3, start: 0.0),
                        child: SvgPicture.string(
                          _svg_ktuu2,
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
            Pin(start: 0.0, end: 0.0),
            Pin(size: 86.0, end: -1.0),
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.bottomRight,
                  child: SizedBox(
                    width: 210.0,
                    height: 61.0,
                    child: PageLink(
                      links: [
                        PageLinkInfo(
                          transition: LinkTransition.Fade,
                          ease: Curves.easeOut,
                          duration: 0.3,
                          pageBuilder: () => profile_page(),
                        ),
                      ],
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
                    width: 211.0,
                    height: 61.0,
                    child: PageLink(
                      links: [
                        PageLinkInfo(
                          transition: LinkTransition.Fade,
                          ease: Curves.easeOut,
                          duration: 0.3,
                          pageBuilder: () => add_page(),
                        ),
                      ],
                      child: Stack(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xffd4af37),
                              borderRadius: BorderRadius.only(
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
                            color: const Color(0xff000000),
                            borderRadius: BorderRadius.all(
                                Radius.elliptical(9999.0, 9999.0)),
                            border: Border.all(
                                width: 6.0, color: const Color(0xffeeece4)),
                          ),
                        ),
                        Center(
                          child: SizedBox(
                            width: 22.0,
                            height: 19.0,
                            child: SvgPicture.string(
                              _svg_a0ci9l,
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
            Pin(size: 45.0, middle: 0.3637),
            Pin(size: 36.0, start: 8.5),
            child: SvgPicture.string(
              _svg_oxph2,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 6.0, middle: 0.3768),
            Pin(size: 14.0, start: 21.0),
            child: Text.rich(
              TextSpan(
                style: TextStyle(
                  fontFamily: 'PMingLiU-ExtB',
                  fontSize: 20,
                  color: const Color(0xff707070),
                ),
                children: [
                  TextSpan(
                    text: '0',
                    style: TextStyle(
                      fontSize: 14,
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
      ),
    );
  }
}

const String _svg_begji =
    '<svg viewBox="244.5 41.5 124.0 1.0" ><path transform="translate(244.5, 41.5)" d="M 124 0 L 0 0" fill="none" stroke="#f9eaea" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ba0n =
    '<svg viewBox="343.0 13.0 24.5 23.5" ><path transform="translate(341.88, 11.88)" d="M 24.82302474975586 19.93840980529785 L 20.67839622497559 15.96304798126221 L 17.49050140380859 14.69952297210693 C 18.55184745788574 13.25155448913574 19.12040328979492 11.52421283721924 19.11825370788574 9.754203796386719 C 19.11825561523438 4.995765209197998 15.08267593383789 1.125 10.12162780761719 1.125 C 5.16057825088501 1.125 1.125 4.995765209197998 1.125 9.754204750061035 C 1.125 14.51264476776123 5.160577774047852 18.38340950012207 10.12162780761719 18.38340950012207 C 11.98314666748047 18.38533592224121 13.7989387512207 17.8303050994873 15.3160457611084 16.79563522338867 L 16.62973213195801 19.844970703125 L 20.77436065673828 23.82033157348633 C 21.89205932617188 24.8930492401123 23.70476341247559 24.89320373535156 24.82290840148926 23.8209171295166 C 25.94104957580566 22.74863243103027 25.94121360778809 21.00995826721191 24.82326889038086 19.93747901916504 Z M 2.760750532150269 9.754204750061035 C 2.760750532150269 5.86112642288208 6.062784671783447 2.693946361541748 10.12162780761719 2.693946361541748 C 14.18046951293945 2.693946361541748 17.48250389099121 5.86112642288208 17.48250389099121 9.754204750061035 C 17.48250389099121 13.64728355407715 14.18046951293945 16.81446266174316 10.12162780761719 16.81446266174316 C 6.062784671783447 16.81446266174316 2.760750532150269 13.64728355407715 2.760750532150269 9.754204750061035 Z M 23.66636848449707 22.71161079406738 C 23.18697547912598 23.17080497741699 22.4104118347168 23.17080497741699 21.9310188293457 22.71161079406738 L 18.01684951782227 18.95729637145996 L 16.79549026489258 16.12133979797363 L 19.75219917297363 17.29281997680664 L 23.66636848449707 21.04713439941406 C 24.14463043212891 21.50686836242676 24.14463043212891 22.25118064880371 23.6663646697998 22.71091651916504 Z" fill="#f3e8e8" stroke="#ffffff" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_y9opy4 =
    '<svg viewBox="4.5 27.0 27.0 2.3" ><path  d="M 4.5 27 L 31.5 27 L 31.5 29.25 L 4.5 29.25 L 4.5 27 Z" fill="#f2e0e0" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_aa3y3y =
    '<svg viewBox="4.5 13.5 27.0 2.3" ><path  d="M 4.5 13.5 L 31.5 13.5 L 31.5 15.75 L 4.5 15.75 L 4.5 13.5 Z" fill="#f2e0e0" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_yixnrq =
    '<svg viewBox="4.5 20.3 27.0 2.3" ><path  d="M 4.5 20.25 L 31.5 20.25 L 31.5 22.5 L 4.5 22.5 L 4.5 20.25 Z" fill="#f2e0e0" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ktuu2 =
    '<svg viewBox="4.5 6.8 27.0 2.3" ><path  d="M 4.5 6.75 L 31.5 6.75 L 31.5 9 L 4.5 9 L 4.5 6.75 Z" fill="#f2e0e0" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_hznry0 =
    '<svg viewBox="0.0 0.0 27.0 27.0" ><path transform="translate(-4.5, -4.5)" d="M 29.25 31.5 C 29.25 31.5 31.5 31.5 31.5 29.25 C 31.5 27 29.25 20.25 18 20.25 C 6.75 20.25 4.5 27 4.5 29.25 C 4.5 31.5 6.75 31.5 6.75 31.5 L 29.25 31.5 Z M 6.76099967956543 29.37599945068359 L 6.76099967956543 29.37100028991699 L 6.76099967956543 29.37599945068359 Z M 6.798999786376953 29.25 L 29.19999885559082 29.25 C 29.21070671081543 29.24861335754395 29.22137641906738 29.24694633483887 29.23199844360352 29.24499893188477 L 29.24999809265137 29.2400016784668 C 29.24799728393555 28.68700218200684 28.90399742126465 27.0210018157959 27.37799835205078 25.49600219726562 C 25.9109992980957 24.03000068664551 23.14999961853027 22.5 18 22.5 C 12.84799957275391 22.5 10.0890007019043 24.03000068664551 8.621999740600586 25.49699974060059 C 7.095999717712402 27.02299880981445 6.75499963760376 28.6870002746582 6.75 29.24099922180176 C 6.766301155090332 29.24417114257812 6.782635688781738 29.24717140197754 6.798999786376953 29.25 Z M 29.24099922180176 29.37599945068359 L 29.24099922180176 29.37100028991699 L 29.24099922180176 29.37599945068359 Z M 18 15.75 C 20.48528099060059 15.75 22.5 13.73528099060059 22.5 11.25 C 22.5 8.764719009399414 20.48528099060059 6.75 18 6.75 C 15.51471900939941 6.75 13.5 8.764719009399414 13.5 11.25 C 13.5 13.73528099060059 15.51471900939941 15.75 18 15.75 Z M 24.75 11.25 C 24.75 14.9779224395752 21.7279224395752 18 18 18 C 14.2720775604248 18 11.25 14.9779224395752 11.25 11.25 C 11.25 7.522077560424805 14.2720775604248 4.5 18 4.5 C 21.7279224395752 4.5 24.75 7.522078037261963 24.75 11.25 Z" fill="#fbefef" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_yb3s61 =
    '<svg viewBox="87.5 902.9 26.0 26.0" ><path transform="translate(82.52, 897.94)" d="M 30 17 L 19 17 L 19 6 C 19 5.447715282440186 18.55228424072266 5 18 5 C 17.44771575927734 5 17 5.447715282440186 17 6 L 17 17 L 6 17 C 5.447715282440186 17 5 17.44771575927734 5 18 C 4.990014553070068 18.2629508972168 5.094343185424805 18.5173511505127 5.286075115203857 18.69757843017578 C 5.477806568145752 18.8778076171875 5.738167762756348 18.96621704101562 5.999999523162842 18.94000244140625 L 17 18.94000053405762 L 17 30 C 17 30.55228424072266 17.44771575927734 31 18 31 C 18.55228424072266 31 19 30.55228424072266 19 30 L 19 19 L 30 19 C 30.55228424072266 19 31 18.55228424072266 31 18 C 31 17.44771575927734 30.55228424072266 17 30 17 Z" fill="#fbf9f9" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_a0ci9l =
    '<svg viewBox="202.4 855.5 22.3 18.6" ><path transform="translate(199.0, 851.0)" d="M 11.96987724304199 23.06781005859375 L 11.96987724304199 16.8785400390625 L 17.12680244445801 16.8785400390625 L 17.12680244445801 23.06781005859375 L 22.36967658996582 23.06781005859375 L 22.36967658996582 13.78390502929688 L 25.7216796875 13.78390502929688 L 14.54833984375 4.5 L 3.375 13.78390502929688 L 6.727001667022705 13.78390502929688 L 6.727001667022705 23.06781005859375 L 11.96987724304199 23.06781005859375 Z" fill="#f6efd7" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_oxph2 =
    '<svg viewBox="139.3 8.5 45.0 36.0" ><path transform="translate(139.3, 8.5)" d="M 37.125 31.5 L 7.875 31.5 C 7.256249904632568 31.5 6.75 32.00624847412109 6.75 32.625 L 6.75 34.875 C 6.75 35.49375152587891 7.256249904632568 36 7.875 36 L 37.125 36 C 37.74375152587891 36 38.25 35.49375152587891 38.25 34.875 L 38.25 32.625 C 38.25 32.00624847412109 37.74375152587891 31.5 37.125 31.5 Z M 41.625 9 C 39.76171875 9 38.25 10.51171875 38.25 12.375 C 38.25 12.87421894073486 38.36249923706055 13.33828163146973 38.55937576293945 13.76718711853027 L 33.46875 16.81875038146973 C 32.38593673706055 17.46562576293945 30.98671913146973 17.10000038146973 30.36093711853027 16.00312614440918 L 24.63046836853027 5.9765625 C 25.3828125 5.357812404632568 25.875 4.4296875 25.875 3.375 C 25.875 1.51171875 24.36328125 0 22.5 0 C 20.63671875 0 19.125 1.51171875 19.125 3.375 C 19.125 4.4296875 19.6171875 5.357812404632568 20.36953163146973 5.9765625 L 14.63906288146973 16.00312423706055 C 14.01328182220459 17.09999847412109 12.60703182220459 17.46562385559082 11.53125 16.81874847412109 L 6.447656154632568 13.76718616485596 C 6.637499809265137 13.34531116485596 6.757030963897705 12.87421703338623 6.757030963897705 12.37499904632568 C 6.757030963897705 10.51171779632568 5.245312213897705 8.999999046325684 3.382030963897705 8.999999046325684 C 1.518749713897705 8.999999046325684 0 10.51171875 0 12.375 C 0 14.23828125 1.51171875 15.75 3.375 15.75 C 3.557812452316284 15.75 3.740624904632568 15.72187519073486 3.916406154632568 15.69375038146973 L 9 29.25 L 36 29.25 L 41.08359527587891 15.69375038146973 C 41.25937652587891 15.72187519073486 41.44218826293945 15.75 41.625 15.75 C 43.48828125 15.75 45 14.23828125 45 12.375 C 45 10.51171875 43.48828125 9 41.625 9 Z" fill="#d9df30" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
