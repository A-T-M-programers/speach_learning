import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speach_learning/Presentation/Read/controler/read_bloc.dart';
import 'package:speach_learning/core/error/ui_error.dart';
import 'package:speach_learning/core/global/static/static_variable.dart';
import 'package:speach_learning/core/utils/enums.dart';

class DropDownLanguage extends StatelessWidget {
  const DropDownLanguage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReadBloc,ReadState>(
        buildWhen: (previous, current){
            switch(current.readPageStateBuild){
              case ReadPageStateBuild.main:
                return false;
              case ReadPageStateBuild.level1:
                return true;
              case ReadPageStateBuild.level2:
                return false;
              case ReadPageStateBuild.level3:
                return false;
              case ReadPageStateBuild.level4:
                return false;
            }
        },
        builder: (context,state){
      switch(state.requestState){
        case RequestState.loading:
          return const SizedBox();
        case RequestState.loaded:
          return DropdownButton(
            elevation: 2,
            borderRadius: BorderRadius.circular(20),
            dropdownColor: const Color(0xff888579),
            style: const TextStyle(color: Colors.white70),
            iconSize: 28,
            value: state.idDialect == 0 ? StaticVariable.participants.idDialects : state.idDialect,
            items: List.generate(
                state.listDialects.length,
                    (index) => DropdownMenuItem(
                      child: Text("English(${state.listDialects[index].locale.substring(state.listDialects[index].locale.length - 2)})     "),
                      value:state.listDialects[index].id,)),
            onChanged: (value) {
              context.read<ReadBloc>().add(SetParticipantDialectEvent(StaticVariable.participants.id, int.parse(value.toString())));
            },
          );
        case RequestState.error:
          return UiError(
              message: state.error.message,
              retry: (){
                context.read<ReadBloc>().add(const GetAllDialectEvent());
              },
              close: (){
                Navigator.pop(context);
              });
      }
    });
  }
}
