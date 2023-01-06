import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speach_learning/Process_Class/Error_Class.dart';
import 'package:speach_learning/Read/bloc/Bloc_Controler_Read.dart';


// ignore: camel_case_types
class bottomSheet {

  static void showbottomsheet(context,Map<String, String> level){
    Size size = MediaQuery.of(context).size;
    Future.delayed(Duration.zero,() {
      showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(topRight: Radius.circular(50.0),topLeft: Radius.circular(50.0))),
        elevation: 6,
        backgroundColor: const Color(0xffeeece4),
        enableDrag: false,
        builder: (bc) {
          return Container(
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.7),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(50.0),
                    topRight: Radius.circular(50.0))),
            child: Wrap(
              children: <Widget>[
                const ListTile(
                  title: Center(
                      child: Text(
                        "Listening...!!!",
                        style: TextStyle(color: Colors.black54),
                      )),
                ),
                ListTile(
                  leading: SizedBox(
                      height: 30.0,
                      width: size.width * 0.9,
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.center,
                        children: [
                          Text(
                            level["Name"] != null? level["Name"].toString():"",
                            style: const TextStyle(
                                color: Colors.lightBlue),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            ErrorListen.getError(level["Problem"].toString()),
                            style: const TextStyle(color: Colors.black54),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            level["ProblemWord"] != null? level["ProblemWord"].toString():"",
                            style: const TextStyle(color: Colors.red),
                          )
                        ],
                      )),
                ),
                ListTile(
                  onTap: () {
                    Navigator.pop(bc);
                  },
                  title: Container(
                      margin: const EdgeInsets.only(bottom: 20.0),
                      width: size.width * 0.7,
                      height: 40.0,
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black12,
                              blurRadius: 20)
                        ],
                        borderRadius: BorderRadius.circular(25.0),
                        color: Colors.white54,
                      ),
                      child: const Center(child: Text('Alright'))),
                )
              ],
            ),
          );
        },
        context: context).whenComplete(() {
          try {
            BlocProvider.of<Bloc_Controler>(context).changeStateBottomSheet(false);
          } catch (e, s) {
            print(s);
          }
      });});
  }

}
