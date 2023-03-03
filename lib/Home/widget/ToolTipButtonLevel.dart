import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:info_popup/info_popup.dart';
import 'package:speach_learning/PhraseUI/UI/add_page.dart';
import 'package:speach_learning/AlertDialog.dart';
import 'package:speach_learning/Home/Bloc/BlocHome.dart';
import 'package:speach_learning/Process_Class/Level.dart';
import 'package:speach_learning/Process_Class/User.dart';

class ToolTipButtonLevel extends StatefulWidget {
  ToolTipButtonLevel({Key? key, required this.level}) : super(key: key);

  final Level level;

  @override
  State<ToolTipButtonLevel> createState() => _ToolTipButtonLevelState();
}

class _ToolTipButtonLevelState extends State<ToolTipButtonLevel> {
  Size size = Size(0.0, 0.0);

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return InfoPopupWidget(
      areaBackgroundColor: Colors.transparent,
      contentMaxWidth: size.width,
      customContent: Container(
          height: 120.0,
          padding: EdgeInsets.zero,
          margin: EdgeInsets.only(
              left: size.width * 0.05, right: size.width * 0.05),
          decoration: BoxDecoration(
              color: Colors.black54, borderRadius: BorderRadius.circular(20.0)),
          child: BlocBuilder<Bloc_Change_Lan, String>(builder: (bc, state) {
            return Stack(
            children: [
              // ignore: prefer_const_constructors
               Container(
                    margin: EdgeInsets.only(top: 10.0),
                    alignment: Alignment.topCenter,
                    child: Text(
                      context.locale == Locale("en")
                          ? widget.level.content
                          : widget.level.transContent,
                      // ignore: prefer_const_constructors
                      style: TextStyle(
                          color: Colors.greenAccent,
                          fontWeight: FontWeight.w700),
                    ),
              ),
              Container(
                    margin: EdgeInsets.only(top: 10.0, right: 10.0, left: 10.0),
                    alignment: Alignment.topRight,
                    child: Text(
                      widget.level.listPhraseItem
                              .where((element) => element.uprb.type == "2")
                              .length
                              .toString() +
                          " " +
                          "from".tr() +
                          " " +
                          widget.level.listPhraseItem.length.toString(),
                      style: TextStyle(
                          color: Colors.white60,
                          fontWeight: FontWeight.w500,
                          fontSize: 12),
                    ),
              ),
               Container(
                    width: size.width,
                    alignment: Alignment.bottomCenter,
                    margin: EdgeInsets.all(18.0),
                    child: ElevatedButton(
                      onPressed: () {
                        if (widget.level.listPhraseItem.isNotEmpty) {
                          try {
                            if (widget.level.type != "") {
                              AlertDialogShow.showAlertDialog(context);
                              // ignore: prefer_const_constructors
                              Future.delayed(Duration(seconds: 1), () {
                                Navigator.pop(context);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (route) => add_page(
                                              listPhraseItem:
                                                  widget.level.listPhraseItem,
                                            )));
                              });
                            }
                          } catch (e, s) {
                            // ignore: avoid_print
                            print(s);
                          }
                        } else if(User.typeUser == TypeUser.Admin) {
                          AlertDialogShow.showAlertDialog(context);
                          // ignore: prefer_const_constructors
                          Future.delayed(Duration(seconds: 1), () {
                            Navigator.pop(context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (route) => add_page(
                                      listPhraseItem:[],
                                    )));
                          });
                        }else{
                          ScaffoldMessenger.of(bc).showSnackBar(SnackBar(
                            content: const Text(
                              "emptylevel",
                              style: TextStyle(color: Colors.white70),
                            ).tr(),
                            backgroundColor: Colors.black87,
                          ));
                        }
                      },
                      child: Text(
                        widget.level.getLUBR(),
                        style: TextStyle(
                            color: widget.level.getIconColor(context)),
                      ).tr(),
                      style: ButtonStyle(
                          minimumSize:
                              MaterialStateProperty.all(Size(size.width, 50.0)),
                          backgroundColor: MaterialStateProperty.all(
                              widget.level.getColor(context)),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)))),
                    ),
              ),
            ],
          );
          })),
      // ignore: prefer_const_constructors
      arrowTheme: InfoPopupArrowTheme(
        color: Colors.black54,
        arrowDirection: ArrowDirection.up,
      ),
      dismissTriggerBehavior: PopupDismissTriggerBehavior.onTapArea,
      indicatorOffset: Offset.zero,
      contentOffset: Offset.zero,
      child: Container(
          decoration: BoxDecoration(
              color: widget.level.getColor(context),
              borderRadius: BorderRadius.circular(50.0)),
          child: Icon(
            widget.level.getIcon(),
            color: widget.level.getIconColor(context),
          )),
    );
  }
}
