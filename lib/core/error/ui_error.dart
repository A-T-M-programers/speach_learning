import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:speach_learning/core/error/Error_Class.dart';

class UiError extends StatelessWidget {
  const UiError({Key? key , required this.message,required this.retry,required this.close}) : super(key: key);

  final String message;

  final Function retry;
  final Function close;

  static Size size = const Size(0.0, 0.0);

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      bottomSheet: BottomSheet(
        onClosing: () {  },
        builder: (BuildContext context) {
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
                      leading: SizedBox(
                          height: 80.0,
                          width: size.width * 0.9,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                  width: size.width * 0.9,
                                  child: Text(
                                    ErrorListen.getError(message),
                                    style: const TextStyle(
                                      color: Colors.black54,
                                    ),
                                    softWrap: true,
                                    textAlign: TextAlign.center,
                                  )),
                            ],
                          )),
                    ),
                    ListTile(
                      onTap: () {
                        retry();
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
                          child: Center(child: Text('retry').tr())),
                    ),ListTile(
                      onTap: () {
                        close();
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
                          child: Center(child: Text('close').tr())),
                    )
                  ],
                ),
              ));
        },),
    );
  }
}
