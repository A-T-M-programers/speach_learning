import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:info_popup/info_popup.dart';
import 'package:speach_learning/Domain/Entity/Level.dart';
import 'package:speach_learning/Presentation/LogIn/controler/log_in_bloc.dart';
import 'package:speach_learning/Presentation/PhraseUI/UI/add_page.dart';
import 'package:speach_learning/Presentation/PhraseUI/controler/phrase_bloc.dart';
import 'package:speach_learning/Presentation/Read/Widget/SingleChildListTextView.dart';
import 'package:speach_learning/core/global/static/static_methode.dart';


class ToolTipButtonLevel extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  ToolTipButtonLevel({Key? key, required this.level,required this.idParticipant}) : super(key: key);
  final int idParticipant;
  final Level level;
  static Size size = const Size(0.0, 0.0);

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
              color: GetColorByType.call(level.type, context).withOpacity(0.9),
              borderRadius: BorderRadius.circular(20.0)),
          child:Stack(
            children: [
              // ignore: prefer_const_constructors
               Container(
                    margin: const EdgeInsets.only(top: 10.0),
                    alignment: Alignment.topCenter,
                    child: Text(level.title,
                      style: TextStyle(
                          color: Theme.of(context).textTheme.headline6!.color,
                          fontWeight: FontWeight.w700),
                    ),
              ),
              Container(
                    margin: const EdgeInsets.only(top: 10.0, right: 10.0, left: 10.0),
                    alignment: Alignment.topRight,
                    child: Text(
                          "0 " +
                          "from".tr() +
                          " " +
                          level.phraseCount.toString(),
                      style: TextStyle(
                          color: Theme.of(context).textTheme.headline6!.color,
                          fontWeight: FontWeight.w500,
                          fontSize: 12),
                    ),
              ),
               Row(children: [
                 Expanded(
                     flex: 1,
                     child: Container(
                       alignment: Alignment.centerLeft,
                       margin: const EdgeInsets.all(18.0),
                   child: Text(level.description,
                   style: TextStyle(color: Theme.of(context).textTheme.headline6!.color),),
                 )),Expanded(
            flex: 1,
            child: Container(
                    alignment: Alignment.bottomCenter,
                    margin: const EdgeInsets.all(18.0),
                    child: ElevatedButton(
                      onPressed: () {
                        if (level.type == "") {
                          return;
                        } else if(level.phraseCount != 0) {
                          if(idParticipant != 0) {
                            context.read<PhraseBloc>().add(GetLevelEvent(idLevel: level.id, idParticipant: idParticipant));
                            Navigator.push(context, MaterialPageRoute(builder: (route) => add_page(idParticipant: idParticipant, idLevel: level.id,)));
                          }else{
                            context.read<LogInBloc>().add(GetParticipantIdEvent());
                            context.read<PhraseBloc>().add(GetLevelEvent(idLevel: level.id, idParticipant: idParticipant));
                            Navigator.push(context, MaterialPageRoute(builder: (route) => add_page(idParticipant: idParticipant, idLevel: level.id,)));
                          }
                        }else{
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: const Text("emptylevel", style: TextStyle(color: Colors.white70),).tr(),backgroundColor: Colors.black87,));
                        }
                      },
                      child: Text(
                        level.getLUBR(),
                        style: TextStyle(
                            color: Theme.of(context).textTheme.headline6!.color),
                      ).tr(),
                      style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(Size(size.width * 0.3, 30.0)),
                          backgroundColor: MaterialStateProperty.all(level.getColor(context)),
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))),
                          side: MaterialStateProperty.all(BorderSide(width: 0.5,color: Theme.of(context).textTheme.headline2!.color!))
                      ),
                    ),),
              ),]),
            ],
          )),
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
        Text(level.id.toString(),style: TextStyle(color: Theme.of(context).textTheme.headline6!.color),),
        Container(
        height: 45.0,
          width: 45.0,
          padding: const EdgeInsets.all(7.0),
          margin: const EdgeInsets.only(top: 10.0,bottom: 10.0),
          decoration: BoxDecoration(
            // ignore: prefer_const_literals_to_create_immutables, prefer_const_constructors
            boxShadow: [BoxShadow(color: Colors.black54,blurStyle: BlurStyle.inner,blurRadius: 6.0,offset: Offset(0.0,6.0))],
            border: Border.all(width: 2,color: level.getColor(context).withAlpha(250)),
              color: level.getColor(context),
              borderRadius: BorderRadius.circular(50.0)),
          child: Container(
            padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                  border: Border.all(width: 2,color: level.getColor(context).withAlpha(250)),
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(50.0),
                boxShadow: const [BoxShadow(color: Colors.black54,blurRadius: 6,blurStyle: BlurStyle.outer)]
              ),
              child: Icon(
            level.getIcon(),
            color: level.getIconColor(context),
                size: 20.0,
          )),)])
    );
  }
}
