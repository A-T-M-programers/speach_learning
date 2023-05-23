import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speach_learning/Presentation/Profile/controler/ProfileBloc.dart';
import 'package:speach_learning/Presentation/Profile/controler/ProfileEvent.dart';
import 'package:speach_learning/Presentation/Profile/controler/ProfileState.dart';
import 'package:speach_learning/core/utils/enums.dart';

class ToggleButtonCustom extends StatelessWidget {
  const ToggleButtonCustom({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc,ParticipantState>(
      buildWhen: (previos,current) => previos.requestState != current.requestState,
        builder: (context, state) {
          switch(state.requestState){
            case RequestState.loading:
              return getWidget(false, context, [false,true],0,ThemeApp.light);
            case RequestState.loaded:
              return getWidget(true, context, [state.themeApp == ThemeApp.dark,state.themeApp == ThemeApp.light],state.participants!.id, state.participants!.themApp);
            case RequestState.error:
              return getWidget(false, context, [false,true],0,ThemeApp.light);
          }
        });
  }
  Widget getWidget(bool checkLoaded,BuildContext context,List<bool> listSelected,int id,ThemeApp? themeAppParticipant){
    return ToggleButtons(
      // list of booleans
        isSelected: listSelected,
        // text color of selected toggle
        selectedColor: Colors.white,
        // text color of not selected toggle
        color: Theme.of(context).textTheme.headline2!.color,
        // fill color of selected toggle
        fillColor: Theme.of(context).textTheme.headline2!.color,
        // when pressed, splash color is seen
        splashColor: Colors.white54,
        // long press to identify highlight color
        highlightColor: Colors.orange,
        // if consistency is needed for all text style
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
        // border properties for each toggle
        disabledColor: Colors.white70,
        renderBorder: true,
        borderColor: Colors.white54,
        borderWidth: 1.5,
        borderRadius: BorderRadius.circular(10),
        selectedBorderColor: Colors.white54,
        // add widgets for which the users need to toggle
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          // ignore: prefer_const_constructors
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child:Row(children:[ const Text('dark', style: TextStyle(fontSize: 12)).tr(),const Icon(Icons.dark_mode_outlined,)]),
          ),
          // ignore: prefer_const_constructors
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child:Row(children: [ const Text('light', style: TextStyle(fontSize: 12)).tr(),const Icon(Icons.light_mode_outlined)]),
          ),
        ],
        // to select or deselect when pressed
        onPressed: (int newIndex) {
          if(checkLoaded) {
            ThemeApp themeApp = newIndex == 0 ? ThemeApp.dark : ThemeApp.light;
            // checking for the index value
            if (themeAppParticipant != themeApp) {
              // one button is always set to tru-e
              if (themeApp == ThemeApp.dark) {
                context.read<ProfileBloc>().add(SetThemeAppParticipantEvent(themeApp: ThemeApp.dark,id: id));
              } else if (themeApp == ThemeApp.light) {
                context.read<ProfileBloc>().add(SetThemeAppParticipantEvent(themeApp: ThemeApp.light, id: id));
              }
            } else {
              // other two will be set to false and not selected
            }
          }
        }
    );
  }
}
