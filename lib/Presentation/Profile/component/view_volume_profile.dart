import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speach_learning/Presentation/Profile/controler/ProfileBloc.dart';
import 'package:speach_learning/Presentation/Profile/controler/ProfileEvent.dart';
import 'package:speach_learning/Presentation/Profile/controler/ProfileState.dart';
import 'package:speach_learning/core/utils/enums.dart';
import 'package:volume_controller/volume_controller.dart';

class ViewVolumeProfile extends StatelessWidget {
  const ViewVolumeProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileParticipantBloc, ParticipantState>(
      buildWhen: (previos,current) => previos.requestState != current.requestState,
        builder: (context, state) {
      switch (state.requestState) {
        case RequestState.loading:
          return getWidget(false, context, 0.5);
        case RequestState.loaded:
          VolumeController().setVolume(state.volume);
         return getWidget(true, context, state.volume);
        case RequestState.error:
          return getWidget(false, context, 0.5);
      }
    });
  }
  Widget getWidget(bool checkLoaded,BuildContext context,double volume){
    return Align(
      alignment: Alignment.centerRight,
      child: SizedBox(
        width: 234.0,
        height: 12.0,
        child: Slider(
            activeColor: Colors.lightBlue,
            min: 0.0,
            max: 1.0,
            value: volume,
            onChanged: (value) {
              if(checkLoaded) {
                context.read<ProfileParticipantBloc>().add(SetVolumeParticipantEvent(volume: value));
              }
            }),
      ),
    );
  }
}
