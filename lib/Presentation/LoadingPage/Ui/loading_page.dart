import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:speach_learning/Presentation/Read/Widget/SingleChildListTextView.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          body: Center(
            child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.cloud_download_rounded,color: Colors.greenAccent,size: 80.0,),
                  10.ph,
                  Text("loading",style: TextStyle(color: Theme.of(context).textTheme.headlineSmall!.color,fontSize: 16)).tr(),
              10.ph,
              LoadingAnimationWidget.stretchedDots(color: Theme.of(context).textTheme.headlineSmall!.color!, size: 80.0),
        ])),
        ),
        onWillPop: () async {
      return true;
    });
  }
}
