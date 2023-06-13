import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speach_learning/Presentation/Read/UI/read_page.dart';
import 'package:speach_learning/Presentation/Read/controler/read_bloc.dart';
import 'package:speach_learning/core/global/static/static_variable.dart';
import 'package:speach_learning/core/services/services_locator.dart';

class ButtonNext extends StatelessWidget {
  const ButtonNext({Key? key,required this.status}) : super(key: key);

  final String status;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReadBloc,ReadState>(
      builder: (context,state){
          if((status == "C" || status == "X") && state.idNextPhrase != 0) {
            return Stack(
                children: <Widget>[
                  Container(
                    width: 90,
                    height: 45,
                    decoration: BoxDecoration(
                        color: const Color(0xffd4af37),
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                            width: 1.0, color: const Color(0xffd4af37)),
                        boxShadow: const [
                          BoxShadow(color: Colors.white70, blurRadius: 10)
                        ]),
                  ),
                  SizedBox(
                    width: 90.0,
                    height: 32.0,
                    child: Row(children: [
                      Container(
                          padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                          alignment: Alignment.bottomCenter,
                          child: const Text("next", style: TextStyle(
                            color: Colors
                                .white70,),).tr()),
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_forward_rounded, color: Colors.white70,
                          size: 30,),
                        onPressed: () {
                          context.read<ReadBloc>().add(GetPhraseEvent(StaticVariable.participants.id, state.idNextPhrase));
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (route) =>
                              BlocProvider<ReadBloc>(
                                create: (context) {
                                  return ReadBloc(sl(),sl(),sl(),sl(),sl(),sl(),sl(),sl())
                                    ..add(const GetAllDialectEvent())
                                    ..add(GetPhraseEvent(StaticVariable.participants.id, state.idNextPhrase));
                                },
                                child: ReadPage(),
                              )));
                        },
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all(const EdgeInsets
                                .all(0.0)),
                            backgroundColor: MaterialStateProperty.all(
                                Colors.transparent)
                        ),
                      )
                    ],),
                  ),
                ]);
          }else{
            return const SizedBox(width: 90.0,height: 45.0,);
          }
    },);
  }
}
