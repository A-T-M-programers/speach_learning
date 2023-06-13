import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AlertDialogShow{
  static showAlertDialog(BuildContext context){
    // ignore: prefer_const_constructors
    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      actions:const [
        Center(
            child: CircularProgressIndicator(
      color: Colors.white,
    ))]);
    showDialog(
      barrierDismissible: false,
      context:context,
      builder:(BuildContext context){
        return alert;
      },
    );
  }
  static showAlertDialogNextLevel(BuildContext context,String level,widgetThis){
    Animation _heartAnimation;
    AnimationController _heartAnimationController;

    _heartAnimationController = AnimationController(vsync: widgetThis, duration:const Duration(milliseconds: 1200));
    _heartAnimation = Tween(begin: 150.0, end: 200.0).animate(CurvedAnimation(
        curve: Curves.bounceOut, parent: _heartAnimationController));

    _heartAnimationController.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        _heartAnimationController.repeat();
      }
    });
    _heartAnimationController.forward();
    // ignore: prefer_const_constructors
    AlertDialog alert = AlertDialog(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
      AnimatedBuilder(
      animation: _heartAnimationController,
      builder: (context, child) {
        return Center(
          child: Center(
            child: Icon(
              Icons.favorite,
              color: Colors.red,
              size: _heartAnimation.value,
            ),
          ),
        );
      },
    ),
          const SizedBox(height: 20,),

          TweenAnimationBuilder(
            child: Text('skiplevel'.tr() +' $level',
              style:const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                color: Colors.green
              ),
            ),
            duration:const Duration(milliseconds: 500),
            curve: Curves.bounceOut,
            tween: Tween(begin: 1.0, end: 0.0),
            builder: (context,double? value, child){
              return Transform.translate(
                offset:  Offset(
                    value! * 60,
                    0.0
                ),
                child: child,
              );
            },
          ),

          const SizedBox(height: 20,),
          TweenAnimationBuilder(
            child: const SizedBox(),
            duration: const Duration(milliseconds: 1200),
            curve: Curves.bounceOut,
            tween: Tween(begin: 1.0, end: 0.0),
            builder: (context,double? value, child){
              return Transform.translate(
                offset:  Offset(
                    0.0,
                    value! * 300
                ),
                child: child,
              );
            },
          ),
        ]
        );
    showDialog(
      barrierDismissible: false,
      context:context,
      builder:(BuildContext context){
        return alert;
      },
    ).whenComplete(() {
      _heartAnimationController.dispose();
    });
  }

  static loadFutureFunction(BuildContext context,Function method,List? listArgument){

    // ignore: prefer_const_constructors
    AlertDialog alert = AlertDialog(
        backgroundColor: Colors.transparent,
        elevation: 0.1,
        actions: [
          Center(
            child: FutureBuilder(
                future: Function.apply(method,listArgument),
                builder: (cont,AsyncSnapshot snapshot){
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator(color: Colors.white,strokeWidth: 2.0,backgroundColor: Colors.transparent,);
                  } else if(snapshot.connectionState == ConnectionState.done) {
                    if(snapshot.hasError){
                      return Text("theirisproblem",style: TextStyle(color: Theme.of(context).textTheme.headlineMedium!.color,backgroundColor: Colors.transparent),).tr();
                    }else if(snapshot.hasData) {
                      Future.delayed(const Duration(milliseconds: 500),(){
                        Navigator.pop(context);
                      });
                      return snapshot.data!;
                    }else{
                      Future.delayed(const Duration(milliseconds: 500),(){
                        Navigator.pop(context);
                      });
                      return const CircularProgressIndicator(color: Colors.white,strokeWidth: 2.0,backgroundColor: Colors.transparent,);
                    }
                  }else if(snapshot.connectionState == ConnectionState.none){
                    Future.delayed(const Duration(milliseconds: 500),(){
                      Navigator.pop(context);
                    });
                    return const CircularProgressIndicator(color: Colors.white,strokeWidth: 2.0,backgroundColor: Colors.transparent,);
                  }else{
                    return Text("theirisproblem",style: TextStyle(color: Theme.of(context).textTheme.headlineSmall!.color,backgroundColor: Colors.transparent),).tr();
                  }
            }),
          )]);
    showDialog(
      barrierColor: Colors.transparent,
      barrierDismissible: false,
      context:context,
      builder:(BuildContext context){
        return alert;
      },
    );
  }
  static yesOrNoDialog(context,String title,String content) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            elevation: 10.0,
            shape: OutlineInputBorder(borderSide: BorderSide(strokeAlign: BorderSide.strokeAlignOutside,width: 1.5,color: Theme.of(context).textTheme.headlineSmall!.color!),borderRadius: BorderRadius.circular(20.0)),
            backgroundColor: Theme.of(context).textTheme.displayMedium!.color,
            actionsAlignment: MainAxisAlignment.center,
            title: Text(title,style: TextStyle(color: Theme.of(context).textTheme.displayLarge!.color),).tr(),
            content: Text(content,
              style: TextStyle(
                  color: Theme.of(context).textTheme.headlineSmall!.color,
                  fontSize: 14
              ),
            ).tr(),
            actions: <Widget>[
              ElevatedButton(
                child: const Text(
                  'cancel',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16
                  ),
                ).tr(),
                onPressed: () {
                  Navigator.pop(context, false);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red)
                ),
              ),
              const SizedBox(
                width: 50,
              ),
              ElevatedButton(
                child: const Text(
                  'alright',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16
                  ),
                ).tr(),
                onPressed: () {
                  Navigator.pop(context, true);
                },
              )
            ],
          );
        }
    );
  }

}