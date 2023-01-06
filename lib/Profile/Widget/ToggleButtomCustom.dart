import 'package:flutter/material.dart';
import 'package:speach_learning/Profile/bloc/ChangeThemeBloc.dart';

class ToggleButtonCustom extends StatefulWidget {
  const ToggleButtonCustom({Key? key}) : super(key: key);


  @override
  State<ToggleButtonCustom> createState() => _ToggleButtonCustomState();
}

class _ToggleButtonCustomState extends State<ToggleButtonCustom> {

  final List<bool> _isSelected = [false,true];

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
          child:Row(children:[ Text('Dark', style: TextStyle(fontSize: 14)),Icon(Icons.dark_mode_outlined,)]),
        ),
          // ignore: prefer_const_constructors
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child:Row(children: [ Text('Light', style: TextStyle(fontSize: 14,color: Colors.white)),Icon(Icons.light_mode_outlined,color: Colors.white,)]),
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
              _isSelected[index] = true;
              if(index == 0){
                changeThemeBloc.onDarkThemeChange();
              }else{
                changeThemeBloc.onLightThemeChange();
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
