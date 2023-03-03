import 'package:adobe_xd/adobe_xd.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speach_learning/PhraseUI/Widget/Add_Page/WordItem.dart';
import 'package:speach_learning/PhraseUI/bloc/BlocShowCheckBox.dart';
import 'package:speach_learning/Process_Class/Filter_Text.dart';
import 'package:speach_learning/Process_Class/PhraseItem.dart';
import 'package:speach_learning/Process_Class/User.dart';
import 'package:speach_learning/Read/UI/read_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemPhrase extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  ItemPhrase(
      {Key? key,
      required this.phraseItem,
      required this.isLongPress,
      required this.index})
      : super(key: key);

  final PhraseItem phraseItem;
  final bool isLongPress;
  final int index;

  @override
  State<ItemPhrase> createState() => _ItemPhraseState();
}

class _ItemPhraseState extends State<ItemPhrase> {
  // ignore: prefer_const_constructors
  Size size = Size(0.0, 0.0);
  bool less = false, more = false, equal = false, isSelected = false;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    less = widget.phraseItem.uprb.type == "2";
    more = widget.phraseItem.uprb.type == "0";
    equal = widget.phraseItem.uprb.type == "1";
    return Directionality(
        textDirection: TextDirection.ltr,
        child: Center(
            child: SizedBox(
                width: size.width * 0.95,
                height: 100.0,
                child: Row(children: [
                  widget.isLongPress && (less || equal)
                      ? Expanded(
                          flex: 0,
                          child: BlocBuilder<BlocShowCheckBox, Map<int, bool>>(
                              buildWhen: (previous, current) {
                                if (current.keys.first == widget.index) {
                                  isSelected = current.values.first;
                                  return true;
                                }
                                return false;
                              },
                              builder: (bc, isShow) => Checkbox(
                                  value: isSelected,
                                  onChanged: (value) {
                                    isSelected = value!;
                                    context
                                        .read<BlocShowCheckBox>()
                                        .showCheckBox(
                                            {widget.index: isSelected});
                                  })))
                      : const SizedBox(),
                  Expanded(
                      flex: 3,
                      child: Card(
                        margin: const EdgeInsets.only(bottom: 20.0),
                        elevation: 10.0,
                        child: ListTile(
                          onLongPress: () {
                            if (isSelected) {
                              isSelected = false;
                            } else {
                              isSelected = true;
                            }
                            if (less || equal) {
                              context.read<BlocShowCheckBox>().showCheckBox({widget.index: isSelected});
                            }
                          },
                          trailing: User.typeUser == TypeUser.User && more
                              ? const SizedBox()
                              : IconButton(
                                  splashColor: Colors.lightGreenAccent,
                                  color: Colors.grey,
                                  alignment: Alignment.center,
                                  iconSize: 35.0,
                                  icon: const Icon(
                                      Icons.arrow_circle_right_rounded),
                                  onPressed: () {
                                    List<Map<String, String>> data = [];
                                    data.addAll(List.generate(
                                        widget.phraseItem.listWord.length,
                                        (index) => {
                                              "id": widget.phraseItem
                                                  .listWord[index].id,
                                              "Name": widget.phraseItem
                                                  .listWord[index].content
                                            }));

                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (route) => read_page(
                                                  listPhrase: [
                                                    widget.phraseItem
                                                  ],
                                                )));
                                  },
                                ),
                          title: Text(
                            widget.phraseItem.type,
                            style: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .headline3!
                                    .color!),
                          ),
                          leading:SizedBox(
                              width: size.width * 0.1,
                              child: Stack(
                              children: [
                             (less
                                    ? const Icon(
                                        Icons.task_alt_outlined,
                                        color: Colors.lightGreen,
                                      )
                                    : more
                                        ? const Icon(
                                            Icons.lock_outline_rounded,
                                            color: Colors.grey,
                                          )
                                        : equal
                                            ? const SizedBox()
                                            : const Icon(
                                                Icons.info,
                                                color: Colors.amberAccent,
                                              )),
                                Pinned.fromPins(
                                  Pin(size: 25.0, start: 0.0),
                                  Pin(size: 25.0, end: 0.0),
                                  child: SvgPicture.string(
                                    _svg_oxph2,
                                    allowDrawingOutsideViewBox: true,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                // appeared level user on top layer
                                //*
                                Pinned.fromPins(
                                  Pin(size: 10.0, middle: 0.24),
                                  Pin(size: 10.0, end: 4.0),
                                  child: Text.rich(
                                    // ignore: prefer_const_constructors
                                    TextSpan(
                                      style: const TextStyle(
                                        fontFamily: 'PMingLiU-ExtB',
                                        fontSize: 9,
                                        color: Colors.black,
                                      ),
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: [
                                        // ignore: prefer_const_constructors
                                        TextSpan(
                                          text: '${widget.phraseItem.level}',
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
                          subtitle: Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Row(children: [
                                Wrap(
                                  spacing: 10,
                                  runSpacing: 10,
                                  children: List.generate(
                                      widget.phraseItem.count,
                                      (index) => WordItem(
                                          word: widget.phraseItem.listWord
                                              .firstWhere((element) =>
                                                  element.id ==
                                                  widget.phraseItem.listPWRB
                                                      .firstWhere((element) =>
                                                          element.index ==
                                                          index)
                                                      .iDWord))),
                                ),
                                const SizedBox(
                                  width: 3.0,
                                ),
                                Text(
                                  Filter_Text.addMark(widget.phraseItem.type),
                                  style: TextStyle(
                                    color: Colors.transparent,
                                    fontWeight: FontWeight.bold,
                                    shadows: [
                                      BoxShadow(
                                          color: Theme.of(context)
                                              .textTheme
                                              .headline2!
                                              .color!,
                                          offset: const Offset(0, -3))
                                    ],
                                  ),
                                )
                              ])),
                        ),
                      )),
                ]))));
  }
}

// ignore: constant_identifier_names
const String _svg_oxph2 =
    '<svg viewBox="139.3 8.5 45.0 36.0" ><path transform="translate(139.3, 8.5)" d="M 37.125 31.5 L 7.875 31.5 C 7.256249904632568 31.5 6.75 32.00624847412109 6.75 32.625 L 6.75 34.875 C 6.75 35.49375152587891 7.256249904632568 36 7.875 36 L 37.125 36 C 37.74375152587891 36 38.25 35.49375152587891 38.25 34.875 L 38.25 32.625 C 38.25 32.00624847412109 37.74375152587891 31.5 37.125 31.5 Z M 41.625 9 C 39.76171875 9 38.25 10.51171875 38.25 12.375 C 38.25 12.87421894073486 38.36249923706055 13.33828163146973 38.55937576293945 13.76718711853027 L 33.46875 16.81875038146973 C 32.38593673706055 17.46562576293945 30.98671913146973 17.10000038146973 30.36093711853027 16.00312614440918 L 24.63046836853027 5.9765625 C 25.3828125 5.357812404632568 25.875 4.4296875 25.875 3.375 C 25.875 1.51171875 24.36328125 0 22.5 0 C 20.63671875 0 19.125 1.51171875 19.125 3.375 C 19.125 4.4296875 19.6171875 5.357812404632568 20.36953163146973 5.9765625 L 14.63906288146973 16.00312423706055 C 14.01328182220459 17.09999847412109 12.60703182220459 17.46562385559082 11.53125 16.81874847412109 L 6.447656154632568 13.76718616485596 C 6.637499809265137 13.34531116485596 6.757030963897705 12.87421703338623 6.757030963897705 12.37499904632568 C 6.757030963897705 10.51171779632568 5.245312213897705 8.999999046325684 3.382030963897705 8.999999046325684 C 1.518749713897705 8.999999046325684 0 10.51171875 0 12.375 C 0 14.23828125 1.51171875 15.75 3.375 15.75 C 3.557812452316284 15.75 3.740624904632568 15.72187519073486 3.916406154632568 15.69375038146973 L 9 29.25 L 36 29.25 L 41.08359527587891 15.69375038146973 C 41.25937652587891 15.72187519073486 41.44218826293945 15.75 41.625 15.75 C 43.48828125 15.75 45 14.23828125 45 12.375 C 45 10.51171875 43.48828125 9 41.625 9 Z" fill="#d9df30" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
