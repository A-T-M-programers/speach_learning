import 'dart:ui' as ui;

import 'package:easy_localization/easy_localization.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:speach_learning/Presentation/Home/controler/home_bloc.dart';
import 'package:speach_learning/Presentation/Home/controler/home_event.dart';
import 'package:speach_learning/core/global/static/AlertDialog.dart';
import 'package:speach_learning/Data/DataSource/participant_locale_file.dart';
import 'package:speach_learning/Presentation/LoadingPage/Ui/loading_page.dart';
import 'package:speach_learning/Presentation/LogIn/UI/log_in.dart';
import 'package:speach_learning/Presentation/Profile/component/SimpleSwitchCostome.dart';
import 'package:speach_learning/Presentation/Profile/component/ToggleButtomCustom.dart';
import 'package:speach_learning/Presentation/Profile/component/view_domain_mark_profile.dart';
import 'package:speach_learning/Presentation/Profile/component/view_email_partcipant.dart';
import 'package:speach_learning/Presentation/Profile/component/view_image_participant.dart';
import 'package:speach_learning/Presentation/Profile/component/view_name_participant.dart';
import 'package:speach_learning/Presentation/Profile/component/view_volume_profile.dart';
import 'package:speach_learning/Presentation/Profile/controler/ProfileBloc.dart';
import 'package:speach_learning/Presentation/Profile/controler/ProfileState.dart';
import 'package:speach_learning/Presentation/Profile/model/GetPhoto.dart';
import 'package:speach_learning/Presentation/Read/Widget/BottomSheet.dart';
import 'package:speach_learning/Presentation/SplashScreen/UI/Splash_Screen.dart';
import 'package:speach_learning/core/services/services_locator.dart';
import 'package:speach_learning/core/utils/enums.dart';
import 'DisplayPhoto.dart';

// ignore: camel_case_types, must_be_immutable
class profile_page extends StatelessWidget {
  const profile_page({Key? key,required this.id}) : super(key: key);
  final int id;

  static Size size = const Size(0.0, 0.0);

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return BlocBuilder<ProfileBloc,ParticipantState>(
      buildWhen: (previous, current) => previous.requestState != current.requestState,
      builder: (context,state){
        switch (state.requestState) {
          case RequestState.loading:
             return const LoadingPage();
          case RequestState.loaded:
            return WillPopScope(

                onWillPop: () async {
                  context.read<HomeBloc>().add(GetAllSectionsEvent(idParticipant: id));
                  context.read<HomeBloc>().add(GetParticipantDomainEvent(idLang: id));
                  return true;
                },
                child: Scaffold(
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    appBar: AppBar(
                      iconTheme: Theme.of(context).appBarTheme.iconTheme,
                      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
                      title: Text(
                        "profile",
                        style:
                        TextStyle(color: Theme.of(context).textTheme.headlineMedium!.color),
                      ).tr(),
                      centerTitle: true,
                      actions: [
                        IconButton(
                          onPressed: () async {
                            bool checkLogOut = false;
                            try {
                              checkLogOut = await AlertDialogShow.yesOrNoDialog(context, "logout", "sureLogOut");
                            }catch(e){
                              // ignore: avoid_print
                              print("Error in profile_page Page" + e.toString());
                            }
                            if(checkLogOut){
                              sl<GoogleSignIn>().signOut();
                              await sl<BaseParticipantLocalFile<void,int>>().call(0);
                              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (route) => log_in()), (route) => false);
                            }
                          },
                          icon: const Icon(Icons.logout_rounded),
                          color: Theme.of(context).textTheme.headlineMedium!.color,)
                      ],
                    ),
                    body: SingleChildScrollView(
                        child: SizedBox(
                            width: size.width,
                            height: size.height,
                            child: Directionality(
                              textDirection: ui.TextDirection.ltr,
                              child: Stack(
                                children: <Widget>[
                                  Pinned.fromPins(
                                    Pin(size: size.width),
                                    Pin(size: 310.0, start: 0.0),
                                    child: Stack(
                                      children: <Widget>[
                                        Pinned.fromPins(
                                          Pin(start: 0.0, end: 0.0),
                                          Pin(size: size.height * 0.25, start: 0.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Theme.of(context)
                                                  .appBarTheme
                                                  .backgroundColor,
                                              border: Border.all(
                                                  width: 1.0,
                                                  color: Theme.of(context)
                                                      .appBarTheme
                                                      .backgroundColor!),
                                            ),
                                          ),
                                        ),
                                        Container(
                                            width: size.width,
                                            margin: EdgeInsets.only(
                                                top: (size.height * 0.25) - 70.0),
                                            child: get_svg_top_navbar(size.width, context)),
                                      ],
                                    ),
                                  ),
                                  Pinned.fromPins(
                                    Pin(size: size.width * 0.9, start: 25.0),
                                    Pin(
                                        size: size.height * 0.15,
                                        start: size.height * 0.05),
                                    child: Stack(
                                      children: <Widget>[
                                        Container(
                                          alignment: Alignment.centerLeft,
                                          child: SizedBox(
                                            height: 100,
                                            width: 100,
                                            child: Stack(children: [
                                              GestureDetector(
                                                  onTap: () {
                                                    Navigator.push(context, MaterialPageRoute(builder: (context) => show_photo()));
                                                  },
                                                  child: ViewParticipantImage()),
                                            ]),
                                          ),
                                        ),
                                        Pinned.fromPins(
                                            Pin(size: size.height * 0.04, start: 0.0),
                                            Pin(size: size.height * 0.04, end: 6.5),
                                            child: IconButton(
                                              onPressed: () async {
                                                await get_photo.showSelectionDialog(context,id);
                                              },
                                              icon: const Icon(Icons.add_photo_alternate),
                                              color: Colors.lime,
                                              iconSize: size.height * 0.04,
                                            )),
                                        Pinned.fromPins(
                                            Pin(size: size.width * 0.6, end: 0.0),
                                            Pin(size: size.height * 0.04, middle: 0.2),
                                            child: const ViewNameParticipant()),
                                        Pinned.fromPins(
                                            Pin(size: size.width * 0.6, end: 0.0),
                                            Pin(size: size.height * 0.04, middle: 0.6),
                                            child: const ViewEmailParticipant()),
                                      ],
                                    ),
                                  ),
                                  Pinned.fromPins(
                                    Pin(start: 20.0, end: 31.0),
                                    Pin(size: 20.0, middle: 0.5249),
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                            flex: 1,
                                            child: Pinned.fromPins(
                                              Pin(size: 100.0, start: 0.0),
                                              Pin(start: 0.0, end: 0.0),
                                              // ignore: prefer_const_constructors
                                              child: Text(
                                                '*  ' + 'language'.tr(),
                                                // ignore: prefer_const_constructors
                                                style: TextStyle(
                                                  fontFamily: 'PMingLiU-ExtB',
                                                  fontSize: 16,
                                                  color: Theme.of(context)
                                                      .textTheme
                                                      .headlineSmall!
                                                      .color,
                                                ),
                                                softWrap: false,
                                              ),
                                            )),
                                        Expanded(
                                            flex: 3,
                                            child: Pinned.fromPins(
                                              Pin(size: 70.0, end: 0.0),
                                              Pin(size: 30.0, end: 2.0),
                                              child: SimpleSwitchCustome(),
                                            )),
                                      ],
                                    ),
                                  ),
                                  Pinned.fromPins(
                                    Pin(start: 20.0, end: 21.0),
                                    Pin(size: 40.0, middle: 0.6532),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Expanded(
                                            flex: 1,
                                            child: Pinned.fromPins(
                                              Pin(size: 120.0, start: 0.0),
                                              Pin(start: 17.0, end: 0.0),
                                              // ignore: prefer_const_constructors
                                              child: Text(
                                                '*  ' + 'darkmode'.tr(),
                                                // ignore: prefer_const_constructors
                                                style: TextStyle(
                                                  fontFamily: 'PMingLiU-ExtB',
                                                  fontSize: 16,
                                                  color: Theme.of(context)
                                                      .textTheme
                                                      .headlineSmall!
                                                      .color,
                                                ),
                                                softWrap: false,
                                              ),
                                            )),
                                        Expanded(
                                            flex: 2,
                                            child: Pinned.fromPins(
                                                Pin(size: 146.0, end: 0.0),
                                                Pin(size: 35.0, middle: 0.9),
                                                // ignore: prefer_const_constructors
                                                child: ToggleButtonCustom())),
                                      ],
                                    ),
                                  ),
                                  Pinned.fromPins(
                                    Pin(start: 20.0, end: 30.0),
                                    Pin(size: 20.0, middle: 0.8989),
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                            flex: 1,
                                            child: Pinned.fromPins(
                                              Pin(size: 100.0, middle: 0.0),
                                              Pin(size: 30.0, middle: 0.5),
                                              // ignore: prefer_const_constructors
                                              child: Text(
                                                '*  ' + 'volume'.tr(),
                                                // ignore: prefer_const_constructors
                                                style: TextStyle(
                                                  fontFamily: 'PMingLiU-ExtB',
                                                  fontSize: 16,
                                                  color: Theme.of(context)
                                                      .textTheme
                                                      .headlineSmall!
                                                      .color,
                                                ),
                                                softWrap: false,
                                              ),
                                            )),
                                        const Expanded(
                                            flex: 3,
                                            child: ViewVolumeProfile()),
                                      ],
                                    ),
                                  ),
                                  Pinned.fromPins(
                                    Pin(start: 20.0, end: 48.0),
                                    Pin(size: 20.0, middle: 0.7805),
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                            flex: 1,
                                            child: Pinned.fromPins(
                                              Pin(size: 100.0, middle: 0.0),
                                              Pin(size: 30.0, end: 0.0),
                                              // ignore: prefer_const_constructors
                                              child: Text(
                                                '*  ' + 'level'.tr(),
                                                // ignore: prefer_const_constructors
                                                style: TextStyle(
                                                  fontFamily: 'PMingLiU-ExtB',
                                                  fontSize: 16,
                                                  color: Theme.of(context)
                                                      .textTheme
                                                      .headlineSmall!
                                                      .color,
                                                ),
                                                softWrap: false,
                                              ),
                                            )),
                                        Expanded(
                                            flex: 3,
                                            child: Pinned.fromPins(
                                              Pin(size: size.width * 0.2, end: 0.0),
                                              Pin(size: 16.0, start: 1.0),
                                              // ignore: prefer_const_constructors
                                              child: const ViewDomainMarkProfile(),
                                            )),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )))));
          case RequestState.error:
            Navigator.pop(context);
            bottomSheet.showbottomsheet(context, {"Problem": state.error.message});
            return const SizedBox();
        }
    } );
  }
}
