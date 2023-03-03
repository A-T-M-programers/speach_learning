import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:speach_learning/AlertDialog.dart';
import 'package:speach_learning/Process_Class/User.dart';
import 'package:speach_learning/Profile/bloc/ChangeThemeBloc.dart';

class ToggleButtonCustom extends StatefulWidget {
  const ToggleButtonCustom({Key? key}) : super(key: key);


  @override
  State<ToggleButtonCustom> createState() => _ToggleButtonCustomState();
}

class _ToggleButtonCustomState extends State<ToggleButtonCustom> {

  late List<bool> _isSelected;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isSelected = [User.themApp,!User.themApp];
  }

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      // list of booleans
        isSelected: _isSelected,
        // text color of selected toggle
        selectedColor: Colors.white,
        // text color of not selected toggle
        color: Colors.black54,
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
          child:Row(children:[ Text('dark', style: TextStyle(fontSize: 12)).tr(),Icon(Icons.dark_mode_outlined,)]),
        ),
          // ignore: prefer_const_constructors
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child:Row(children: [ Text('light', style: TextStyle(fontSize: 12,color: Colors.white)).tr(),Icon(Icons.light_mode_outlined,color: Colors.white,)]),
          ),
        ],
// to select or deselect when pressed
        onPressed: (int newIndex) {
          setState(() {
          // looping through the list of booleans values
          for (int index = 0; index < _isSelected.length; index++) {
            // checking for the index value
            if (index == newIndex) {
              // one button is always set to tru-e
              if(index == 0 && _isSelected[index] != true){
                _isSelected[index] = true;
                User.setThemApp(true);
                AlertDialogShow.loadFutureFunction(context,changeThemeBloc.onDarkThemeChange,null);
              }else if(_isSelected[index] != true){
                _isSelected[index] = true;
                User.setThemApp(false);
                AlertDialogShow.loadFutureFunction(context,changeThemeBloc.onLightThemeChange,null);
              }
            } else {
              // other two will be set to false and not selected
              _isSelected[index] = false;
            }
          }
        });}
    );
  }
}
