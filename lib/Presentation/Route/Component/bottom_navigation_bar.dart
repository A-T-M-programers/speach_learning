import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speach_learning/Presentation/Route/controler/route_page_bloc.dart';
import 'package:speach_learning/core/utils/enums.dart';

class BottomNavigationBarHome extends StatelessWidget {
  const BottomNavigationBarHome({Key? key}) : super(key: key);

  static Size size = const Size(0.0, 0.0);
  static int currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Container(
      height: size.width * 0.125,
      decoration: BoxDecoration(
          color: Colors.transparent,
          boxShadow: [
            BoxShadow(
                color: Theme.of(context).textTheme.headline5!.color!.withOpacity(0.1),
            )],
      ),
      child: ListView.builder(
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index){
            return InkWell(
              onTap: (){
                switch(index){
                  case 0:
                    break;
                  case 1:
                    break;
                  case 2:
                    if(currentIndex != index){
                      context.read<RoutePageBloc>().add(const TransitionRoutePageEvent(BottomSheetOption.home));
                    }
                    break;
                  case 3:
                    break;
                  case 4:
                    if(currentIndex != index){
                      context.read<RoutePageBloc>().add(const TransitionRoutePageEvent(BottomSheetOption.profile));
                    }
                    break;
                }
                currentIndex = index;
                HapticFeedback.lightImpact();
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: BlocBuilder<RoutePageBloc,RoutePageState>(
            buildWhen: (previous, current) {
             return previous.requestState != current.requestState;
            },
            builder: (context,state) {
              return Stack(
                children: [
                  AnimatedContainer(
                  color: Colors.transparent,
                    duration: const Duration(seconds: 1),
                  curve: Curves.fastLinearToSlowEaseIn,
                  width: index == currentIndex ? size.width * 0.25 : size.width * 0.17,
                  alignment: Alignment.center,
                  child: AnimatedContainer(duration: const Duration(seconds: 1),
                  curve: Curves.fastLinearToSlowEaseIn,
                    height: index == currentIndex ? size.width * 0.18 : 0,
                    width: index == currentIndex ? size.width * 0.32 : 0,
                    decoration: BoxDecoration(
                      color: index == currentIndex ? Colors.blueAccent.withOpacity(0.4) : Colors.transparent,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),),
                  AnimatedContainer(duration: const Duration(seconds: 1),
                  curve: Curves.fastLinearToSlowEaseIn,
                    width: index == currentIndex ? size.width * 0.31 : size.width * 0.1,
                    alignment: Alignment.center,
                    child: Stack(
                      children: [
                        Row(
                          children: [
                          AnimatedContainer(duration: const Duration(seconds: 1),
                          curve: Curves.fastLinearToSlowEaseIn,
                            width: index == currentIndex ? size.width *0.13 : 0,
                          ),
                            AnimatedOpacity(
                                opacity: index == currentIndex ? 1 : 0,
                                duration: const Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                              child: Text(index == currentIndex ? listOfNames[index] : "",
                              style: TextStyle(color: Theme.of(context).textTheme.headline6!.color,
                              fontWeight: FontWeight.w600,
                              fontSize: 13),
                              ).tr(),
                            )
                        ],),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(listOfImage[index]),
                          AnimatedContainer(duration: const Duration(seconds: 1),
                          curve: Curves.fastLinearToSlowEaseIn,
                          width: index == currentIndex ? size.width * 0.2 : 0,),
                        ],)
                      ],
                    ),
                  )
                ],
              );},
            )
            );
          },
      ),
    );
  }
  static List<String> listOfImage = [
    "assets/icon/icon_box.png",
    "assets/icon/🦆 icon _continent_.png",
    "assets/icon/🦆 icon _open quran_.png",
    "assets/icon/🦆 icon _dollar coin_.png",
    "assets/icon/🦆 icon _male_.png"
  ];

  static List<String> listOfNames = [
    "awards",
    "about",
    "study",
    "subscription",
    "profile",
  ];
}
