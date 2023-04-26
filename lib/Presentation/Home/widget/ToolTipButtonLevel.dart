import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:info_popup/info_popup.dart';
import 'package:speach_learning/AlertDialog.dart';
import 'package:speach_learning/PhraseUI/UI/add_page.dart';
import 'package:speach_learning/Presentation/Home/Bloc/BlocHome.dart';
import 'package:speach_learning/Process_Class/Level.dart';
import 'package:speach_learning/Read/Widget/SingleChildListTextView.dart';

class ToolTipButtonLevel extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
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
              color: Theme.of(context).appBarTheme.backgroundColor, borderRadius: BorderRadius.circular(20.0)),
          child: BlocBuilder<Bloc_Change_Lan, String>(
              builder: (bc, state) {
            return Stack(
            children: [
              // ignore: prefer_const_constructors
               Container(
                    margin: const EdgeInsets.only(top: 10.0),
                    alignment: Alignment.topCenter,
                    child: Text(
                      context.locale == const Locale("en")
                          ? widget.level.content
                          : widget.level.transContent,
                      // ignore: prefer_const_constructors
                      style: TextStyle(
                          color: Theme.of(context).textTheme.headline2!.color,
                          fontWeight: FontWeight.w700),
                    ),
              ),
              Container(
                    margin: const EdgeInsets.only(top: 10.0, right: 10.0, left: 10.0),
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
                          color: Theme.of(context).textTheme.headline2!.color,
                          fontWeight: FontWeight.w500,
                          fontSize: 12),
                    ),
              ),
               Row(children: [
                 Expanded(
                     flex: 1,
                     child: Container(
                       alignment: Alignment.centerLeft,
                       margin: EdgeInsets.all(18.0),
                   child: Text(context.locale == const Locale("en")? widget.level.description: widget.level.transDescription,
                   style: TextStyle(color: Theme.of(context).textTheme.headline2!.color),),
                 )),Expanded(
            flex: 1,
            child: Container(
                    alignment: Alignment.bottomCenter,
                    margin: const EdgeInsets.all(18.0),
                    child: ElevatedButton(
                      onPressed: () {
                        if (widget.level.type == "") {
                          return;
                        } else if(widget.level.listPhraseItem.isNotEmpty) {
                          AlertDialogShow.showAlertDialog(context);
                          // ignore: prefer_const_constructors
                          Future.delayed(Duration(seconds: 1), () {
                            Navigator.pop(context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (route) => add_page(
                                      level:widget.level,
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
                            color: Theme.of(context).textTheme.headline2!.color),
                      ).tr(),
                      style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(Size(size.width * 0.3, 30.0)),
                          backgroundColor: MaterialStateProperty.all(widget.level.getColor(context)),
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))),
                        side: MaterialStateProperty.all(BorderSide(width: 0.5,color: Theme.of(context).textTheme.headline2!.color!))
                      ),
                    ),
              )),]),
            ],
          );
          })),
      // ignore: prefer_const_constructors
      arrowTheme: InfoPopupArrowTheme(
        color: Theme.of(context).appBarTheme.backgroundColor!,
        arrowDirection: ArrowDirection.up,
      ),
      dismissTriggerBehavior: PopupDismissTriggerBehavior.onTapArea,
      indicatorOffset: Offset.zero,
      contentOffset: Offset.zero,
      child:Column(children: [
        10.ph,
        Container(child: Text(widget.level.index.toString(),style: TextStyle(color: Theme.of(context).textTheme.headline2!.color),),),
        Container(
        height: 45.0,
          width: 45.0,
          padding: const EdgeInsets.all(7.0),
          margin: const EdgeInsets.only(top: 10.0,bottom: 10.0),
          decoration: BoxDecoration(
            // ignore: prefer_const_literals_to_create_immutables, prefer_const_constructors
            boxShadow: [BoxShadow(color: Colors.black54,blurStyle: BlurStyle.inner,blurRadius: 6.0,offset: Offset(0.0,6.0))],
            border: Border.all(width: 2,color: widget.level.getColor(context).withAlpha(250)),
              color: widget.level.getColor(context),
              borderRadius: BorderRadius.circular(50.0)),
          child: Container(
            padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                  border: Border.all(width: 2,color: widget.level.getColor(context).withAlpha(250)),
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(50.0),
                boxShadow: const [BoxShadow(color: Colors.black54,blurRadius: 6,blurStyle: BlurStyle.outer)]
              ),
              child: Icon(
            widget.level.getIcon(),
            color: widget.level.getIconColor(context),
                size: 20.0,
          )),)])
    );
  }
}
