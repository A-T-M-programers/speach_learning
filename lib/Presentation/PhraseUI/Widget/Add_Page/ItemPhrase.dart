import 'dart:ui' as ui;
import 'package:adobe_xd/adobe_xd.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speach_learning/Presentation/Read/UI/read_page.dart';
import 'package:speach_learning/Presentation/Read/controler/read_bloc.dart';
import 'package:speach_learning/core/global/static/Filter_Text.dart';
import 'package:speach_learning/Domain/Entity/PhraseItem.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:speach_learning/core/global/static/static_methode.dart';
import 'package:speach_learning/core/global/static/static_variable.dart';
import 'package:speach_learning/core/services/services_locator.dart';

import 'WordItem.dart';

// ignore: must_be_immutable
class ItemPhrase extends StatelessWidget {
  ItemPhrase(
      {Key? key,
      required this.phraseItem,
      required this.index,})
      : super(key: key);

  final PhraseItem phraseItem;
  final int index;

  // ignore: prefer_const_constructors
  Size size = Size(0.0, 0.0);
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Directionality(
        textDirection: ui.TextDirection.ltr,
        child: Center(
            child: SizedBox(
                width: size.width * 0.95,
                height: 140.0,
                child: Card(
                        margin: const EdgeInsets.only(bottom: 20.0),
                        elevation: 10.0,
                        child: ListTile(
                          trailing: phraseItem.type == ""
                              ? const SizedBox()
                              : IconButton(
                                  splashColor: Colors.lightGreenAccent,
                                  color: Colors.grey,
                                  alignment: Alignment.center,
                                  iconSize: 35.0,
                                  icon: const Icon(
                                      Icons.arrow_circle_right_rounded),
                                  onPressed: () {
                                    try {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (route) =>BlocProvider<ReadBloc>(
                                                  create: (context) {
                                                    return ReadBloc(sl(),sl(),sl(),sl(),sl(),sl(),sl(),sl())
                                                      ..add(const GetAllDialectEvent())
                                                      ..add(GetPhraseEvent(StaticVariable.participants.id, phraseItem.id));
                                                  },
                                                child: ReadPage(),
                                              )));
                                    }catch(error){
                                      print(error.toString());
                                    }
                                  },
                                ),
                          title: Text(
                            phraseItem.translation,
                            style: TextStyle(
                                color: Theme.of(context).textTheme.headlineLarge!.color!),
                          ),
                          leading:SizedBox(
                              width: size.width * 0.1,
                              child: Stack(
                              children: [
                                GetIconPhraseByType.call(phraseItem.type, context) != null ? Icon(
                                  GetIconPhraseByType.call(phraseItem.type, context),
                                        color: GetColorByType.call(phraseItem.type, context),
                                      ) : const SizedBox(),
                                Pinned.fromPins(
                                  Pin(size: 30.0, start: 0.0),
                                  Pin(size: 30.0, end: 0.0),
                                  child: SvgPicture.string(
                                    _svg_oxph2,
                                    allowDrawingOutsideViewBox: true,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                // appeared level user on top layer
                                //*
                                Pinned.fromPins(
                                  Pin(size: 10.0, middle: 0.32),
                                  Pin(size: 10.0, end: 6.0),
                                  child: Text.rich(
                                    // ignore: prefer_const_constructors
                                    TextSpan(
                                      style: const TextStyle(
                                        fontFamily: 'PMingLiU-ExtB',
                                        fontSize: 9,
                                        color: Colors.black,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: '${phraseItem.idLevel}',
                                          style: const TextStyle(
                                            fontSize: 9,
                                          ),
                                        ),
                                      ],
                                    ),
                                    textHeightBehavior:
                                        const TextHeightBehavior(
                                            applyHeightToFirstAscent: false),
                                    textAlign: TextAlign.center,
                                    softWrap: false,
                                  ),
                                ),
                                //*/
                          ])),
                          subtitle: Container(
                              padding: const EdgeInsets.only(top: 10.0),
                              child:
                              // Row(children: [
                                Wrap(
                                  spacing: 10,
                                  runSpacing: 10,
                                  children: List<Widget>.generate(
                                      phraseItem.listWord.length + 1,
                                      (index) => index == (phraseItem.listWord.length) ?
                                    Text(
                                      Filter_Text.addMark(phraseItem.content),
                                      style: TextStyle(
                                        color: Colors.transparent,
                                        fontWeight: FontWeight.bold,
                                        shadows: [
                                          BoxShadow(
                                              color: Theme.of(context)
                                                  .textTheme
                                                  .headlineSmall!
                                                  .color!,
                                              offset: const Offset(0, -3))
                                        ],
                                      ),
                                    ) : WordItem(word: phraseItem.listWord[index])),
                                ),
                                // const SizedBox(
                                //   width: 3.0,
                                // ),
                                // Text(
                                //   Filter_Text.addMark(widget.phraseItem.content),
                                //   style: TextStyle(
                                //     color: Colors.transparent,
                                //     fontWeight: FontWeight.bold,
                                //     shadows: [
                                //       BoxShadow(
                                //           color: Theme.of(context)
                                //               .textTheme
                                //               .headline2!
                                //               .color!,
                                //           offset: const Offset(0, -3))
                                //     ],
                                //   ),
                                // )
                              // ])
                        ),
                        ),
                      )),
                ));
  }
}

// ignore: constant_identifier_names
const String _svg_oxph2 =
    '<svg viewBox="139.3 8.5 45.0 36.0" ><path transform="translate(139.3, 8.5)" d="M 37.125 31.5 L 7.875 31.5 C 7.256249904632568 31.5 6.75 32.00624847412109 6.75 32.625 L 6.75 34.875 C 6.75 35.49375152587891 7.256249904632568 36 7.875 36 L 37.125 36 C 37.74375152587891 36 38.25 35.49375152587891 38.25 34.875 L 38.25 32.625 C 38.25 32.00624847412109 37.74375152587891 31.5 37.125 31.5 Z M 41.625 9 C 39.76171875 9 38.25 10.51171875 38.25 12.375 C 38.25 12.87421894073486 38.36249923706055 13.33828163146973 38.55937576293945 13.76718711853027 L 33.46875 16.81875038146973 C 32.38593673706055 17.46562576293945 30.98671913146973 17.10000038146973 30.36093711853027 16.00312614440918 L 24.63046836853027 5.9765625 C 25.3828125 5.357812404632568 25.875 4.4296875 25.875 3.375 C 25.875 1.51171875 24.36328125 0 22.5 0 C 20.63671875 0 19.125 1.51171875 19.125 3.375 C 19.125 4.4296875 19.6171875 5.357812404632568 20.36953163146973 5.9765625 L 14.63906288146973 16.00312423706055 C 14.01328182220459 17.09999847412109 12.60703182220459 17.46562385559082 11.53125 16.81874847412109 L 6.447656154632568 13.76718616485596 C 6.637499809265137 13.34531116485596 6.757030963897705 12.87421703338623 6.757030963897705 12.37499904632568 C 6.757030963897705 10.51171779632568 5.245312213897705 8.999999046325684 3.382030963897705 8.999999046325684 C 1.518749713897705 8.999999046325684 0 10.51171875 0 12.375 C 0 14.23828125 1.51171875 15.75 3.375 15.75 C 3.557812452316284 15.75 3.740624904632568 15.72187519073486 3.916406154632568 15.69375038146973 L 9 29.25 L 36 29.25 L 41.08359527587891 15.69375038146973 C 41.25937652587891 15.72187519073486 41.44218826293945 15.75 41.625 15.75 C 43.48828125 15.75 45 14.23828125 45 12.375 C 45 10.51171875 43.48828125 9 41.625 9 Z" fill="#d9df30" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
