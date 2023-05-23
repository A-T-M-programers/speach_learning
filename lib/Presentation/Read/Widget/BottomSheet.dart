import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speach_learning/Presentation/Read/bloc/Bloc_Controler_Read.dart';
import 'package:speach_learning/core/error/Error_Class.dart';

// ignore: camel_case_types
class bottomSheet {
  static void showbottomsheet(context, Map<String, String> state) {
    Size size = MediaQuery.of(context).size;
    Future.delayed(Duration.zero, () {
      showModalBottomSheet(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50.0),
                      topLeft: Radius.circular(50.0))),
              elevation: 6,
              backgroundColor: const Color(0xffeeece4),
              enableDrag: false,
              isDismissible: false,
              builder: (bc) {
                return WillPopScope(
                  onWillPop: () async {
                    return false;
                  },
                    child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.7),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(50.0),
                          topRight: Radius.circular(50.0))),
                  child: Wrap(
                    children: <Widget>[
                      ListTile(
                        title: Center(
                            // ignore: prefer_const_constructors
                            child: Text(
                          "listening",
                          style: const TextStyle(color: Colors.black54),
                        ).tr()),
                      ),
                      ListTile(
                        leading: SizedBox(
                            height: 80.0,
                            width: size.width * 0.9,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  state["Name"] != null && state["Problem"] != "final"
                                      ? state["Name"].toString()
                                      : "",
                                  style:
                                      const TextStyle(color: Colors.lightBlue),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                SizedBox(
                                    width: size.width * 0.5,
                                    child: Text(
                                      ErrorListen.getError(state["Problem"].toString()),
                                      style: const TextStyle(
                                        color: Colors.black54,
                                      ),
                                      softWrap: true,
                                      textAlign: TextAlign.center,
                                    )),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  state["ProblemWord"] != null ? state["ProblemWord"].toString() : "",
                                  style: const TextStyle(color: Colors.red),
                                )
                              ],
                            )),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.pop(bc);
                          // if(state["Problem"].toString() == "final"){
                          //   Navigator.pop(context);
                          // }
                        },
                        title: Container(
                            margin: const EdgeInsets.only(bottom: 20.0),
                            width: size.width * 0.7,
                            height: 40.0,
                            decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(color: Colors.black12, blurRadius: 20)
                              ],
                              borderRadius: BorderRadius.circular(25.0),
                              color: Colors.white54,
                            ),
                            // ignore: prefer_const_constructors
                            child: Center(child: Text('alright').tr())),
                      )
                    ],
                  ),
                ));
              },
              context: context)
          .whenComplete(() {
        try {
          BlocProvider.of<Bloc_changeStateBottomSheet>(context).changeStateBottomSheet(false);
        } catch (e, s) {
          // ignore: avoid_print
          print(s);
        }
      });
    });
  }
}
