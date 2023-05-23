import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speach_learning/Presentation/Home/controler/home_bloc.dart';
import 'package:speach_learning/Presentation/Home/controler/home_event.dart';
import 'package:speach_learning/Presentation/Home/controler/home_state.dart';
import 'package:speach_learning/Presentation/Home/widget/container_level.dart';
import 'package:speach_learning/Presentation/LogIn/controler/log_in_bloc.dart';
import 'package:speach_learning/Presentation/Read/Widget/BottomSheet.dart';
import 'package:speach_learning/core/global/static/get_error_details.dart';
import 'package:speach_learning/core/services/services_locator.dart';
import 'package:speach_learning/core/utils/enums.dart';

// ignore: must_be_immutable
class AllSectionsViewComponent extends StatelessWidget {
  const AllSectionsViewComponent({Key? key,required this.participantId}) : super(key: key);
  final int participantId;
  static late BuildContext bc ;

  static ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
        buildWhen: (previous, current) => previous.requestState != current.requestState || previous.allSections != current.allSections,
        builder: (context, state) {
          switch (state.requestState) {
            case RequestState.loading:
              return Center(
                  child: Text(
                "Loading...",
                style: TextStyle(
                    color: Theme.of(context).textTheme.headline2!.color),
              ));
            case RequestState.loaded:
              bc = context;
              return RefreshIndicator(
                      onRefresh: () async => _onScroll(),
                      child: ListView.builder(
                          controller: controller,
                          physics: const BouncingScrollPhysics(),
                itemCount: state.allSections.length,
                shrinkWrap: true,
                  padding: const EdgeInsets.only(bottom: 100.0,top: 15.0),
                  itemBuilder: (context,index) => ContainerLevel(idParticipant: participantId,section: state.allSections[index])));
            case RequestState.error:
              bottomSheet.showbottomsheet(context, {"Problem": "err_Network"});
              return Center(child: Icon(sl<GetErrorDetails>().getIconError(state.error.dioErrorType),size: 90,color: Theme.of(context).textTheme.headline2!.color!,));
          }
        });
  }

  void _onScroll() async {
      try {
        if((controller.position.minScrollExtent - 50) > controller.offset && participantId != 0){
          BlocProvider.of<HomeBloc>(bc).add(GetAllSectionsEvent(idParticipant: participantId));
        }else if(participantId == 0 && (controller.position.minScrollExtent - 50) > controller.offset){
          BlocProvider.of<LogInBloc>(bc).add(GetParticipantIdEvent());
        }
      } catch (e, s) {
        // ignore: avoid_print
        print(s);
      }
  }

}
