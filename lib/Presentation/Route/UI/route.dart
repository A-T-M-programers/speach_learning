import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speach_learning/Presentation/Home/UI/home_page.dart';
import 'package:speach_learning/Presentation/Home/controler/home_bloc.dart';
import 'package:speach_learning/Presentation/Home/controler/home_event.dart';
import 'package:speach_learning/Presentation/LoadingPage/Ui/loading_page.dart';
import 'package:speach_learning/Presentation/Profile/UI/profile_page.dart';
import 'package:speach_learning/Presentation/Profile/controler/ProfileBloc.dart';
import 'package:speach_learning/Presentation/Profile/controler/ProfileEvent.dart';
import 'package:speach_learning/Presentation/Route/Component/bottom_navigation_bar.dart';
import 'package:speach_learning/Presentation/Route/controler/route_page_bloc.dart';
import 'package:speach_learning/core/error/ui_error.dart';
import 'package:speach_learning/core/route_file.dart';
import 'package:speach_learning/core/utils/enums.dart';

class RoutePage extends StatelessWidget {
  const RoutePage({Key? key, required this.idParticipant}) : super(key: key);

  final int idParticipant;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.6),
      body: PageTransitionSwitcher(
          transitionBuilder: (Widget child,Animation<double> animation,Animation<double> secondaryAnimation){
        return SharedAxisTransition(animation: animation, secondaryAnimation: secondaryAnimation, transitionType: SharedAxisTransitionType.horizontal,child: child,);
      },
      child: BlocBuilder<RoutePageBloc,RoutePageState>(
          buildWhen: (previous, current) => previous.requestState != current.requestState,
          builder: (context,state) {
        switch(state.requestState){
          case RequestState.loading:
            return const LoadingPage();
          case RequestState.loaded:
            return getPage(state.bottomSheetOption,context);
          case RequestState.error:
            return UiError(
                message: state.message,
                retry: (){

                },
                close: (){

                });
    }})),
      bottomNavigationBar: const BottomNavigationBarHome(),
    );
  }

  Widget getPage(BottomSheetOption bottomSheetOption,BuildContext context) {
    switch(bottomSheetOption){
      case BottomSheetOption.home:
        context.read<HomeBloc>().add(GetAllSectionsEvent(idParticipant: idParticipant));
        context.read<HomeBloc>().add(GetParticipantDomainEvent(id: idParticipant));
        return home_page(idParticipant: idParticipant);
      case BottomSheetOption.profile:
        context.read<ProfileBloc>().add(GetParticipantEvent(id: idParticipant, key: RoutePageStatic.profilePage));
        return profile_page(id: idParticipant);
      case BottomSheetOption.empty:
        return const SizedBox();
    }
  }
}
