
import 'package:adobe_xd/adobe_xd.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:speach_learning/Data/DataSource/participant_locale_file.dart';
import 'package:speach_learning/Domain/Entity/Participants.dart';
import 'package:speach_learning/Presentation/Home/UI/home_page.dart';
import 'package:speach_learning/Presentation/Home/controler/home_bloc.dart';
import 'package:speach_learning/Presentation/Home/controler/home_event.dart';
import 'package:speach_learning/Presentation/LogIn/controler/log_in_bloc.dart';
import 'package:speach_learning/Presentation/Profile/controler/ProfileBloc.dart';
import 'package:speach_learning/Presentation/Profile/controler/ProfileEvent.dart';
import 'package:speach_learning/Presentation/Profile/controler/ProfileState.dart';
import 'package:speach_learning/Presentation/Read/Widget/BottomSheet.dart';
import 'package:speach_learning/core/services/services_locator.dart';
import 'package:speach_learning/core/utils/enums.dart';
import 'package:speach_learning/core/utils/google_auth.dart';

// ignore: must_be_immutable
class ViewEmailButton extends StatelessWidget {
  ViewEmailButton({Key? key}) : super(key: key);

  Size size = const Size(0.0, 0.0);
  late GoogleSignInAccount googleSignInAccount;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return BlocBuilder<LogInBloc, LogInState>(
      buildWhen: (previos,current){
        switch (current.requestState) {
          case RequestState.loading:
            break;
          case RequestState.loaded:
            sl<BaseParticipantLocalFile<void,int>>().call(current.participantsId);
            context.read<HomeBloc>().add(GetParticipantDomainEvent(idLang: current.participantsId));
            context.read<HomeBloc>().add(GetAllSectionsEvent(idParticipant: current.participantsId));
            context.read<ProfileBloc>().add(GetParticipantEvent(id: current.participantsId, key: "login"));
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (route) => home_page()), (route) => false);
            break;
          case RequestState.error:
            setParticipant(googleSignInAccount, context);
            break;
        }
        return false;
      },
        builder: (context, state) => BlocBuilder<ProfileBloc, ParticipantState>(
          buildWhen: (previos, current) {
            if (current.requestState == RequestState.loaded) {
              switch(current.requestState){
                case RequestState.loading:
                  break;
                case RequestState.loaded:
                  context.read<HomeBloc>().add(GetAllSectionsEvent(idParticipant: current.idParticipant));
                  context.read<ProfileBloc>().add(GetParticipantEvent(id: current.idParticipant, key: "login"));
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (route) => home_page()), (route) => false);
                  break;
                case RequestState.error:
                  bottomSheet.showbottomsheet(context,{"Problem": current.error.message});
                  break;
              }
            }
            return false;
          },
          builder:(context,state) => ElevatedButton(
            style: ButtonStyle(
              // ignore: prefer_const_constructors
              textStyle: MaterialStateProperty.all(
                  // ignore: prefer_const_constructors
                  TextStyle(fontWeight: FontWeight.normal)),
              backgroundColor: MaterialStateProperty.all(Colors.transparent),
              // ignore: prefer_const_constructors
              padding: MaterialStateProperty.all(EdgeInsets.all(0.0)),
              foregroundColor: MaterialStateProperty.all(Colors.transparent),
              shadowColor: MaterialStateProperty.all(Colors.transparent),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0))),
            ),
            onPressed: () async {
              try {
                final response = await sl<GoogleAuth>().getAuthParticipant();
                // ignore: avoid_print
                response.fold((l) => {print(l.message)}, (r) {
                  if (r != null) {
                    googleSignInAccount = r;
                    if(!sl.isRegistered<Dio>(instanceName: "Dio")){
                      context.read<LogInBloc>().add(const GetTokenEvent("voca@test.com", "password"));
                    }
                    context.read<LogInBloc>().add(GetParticipantWithEmailEvent(email: r.email));
                  }
                });
              } catch (e, s) {
                // ignore: avoid_print
                print(s);
              }
            },
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      color: const Color(0xfff6df82),
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(
                          width: 1.0, color: const Color(0xfff6df82)),
                      boxShadow: const [
                        BoxShadow(
                            color: Color(0xfff6df82),
                            blurRadius: 10,
                            spreadRadius: 1)
                      ]),
                ),
                Align(
                  // ignore: prefer_const_constructors
                  alignment: Alignment(0.0, 0.0),
                  child: SizedBox(
                    child: Text(
                      'email',
                      style: TextStyle(
                        fontFamily: 'Cambria Math',
                        fontSize: size.height * 0.03,
                        color: const Color(0xff647793),
                      ),
                      softWrap: false,
                    ).tr(),
                  ),
                ),
                Pinned.fromPins(
                    Pin(size: 24.0, start: 16.0), Pin(size: 24.0, middle: 0.5),
                    child: CustomPaint(
                        painter: GoogleLogoPainter(),
                        size: const Size.square(0.0))),
              ],
            ),
          ),
        ));
  }

  void setParticipant(GoogleSignInAccount googleSignInAccount, BuildContext context) async {
    context.read<ProfileBloc>().add(SetParticipantEvent(
        participants: Participants(
            id: 0,
            name: googleSignInAccount.displayName ?? "",
            email: googleSignInAccount.email,
            imageParticipant: ImageParticipant(
                linkImage: googleSignInAccount.photoUrl ?? "",
                stateImage: googleSignInAccount.photoUrl != null
                    ? StateImage.remote
                    : StateImage.local),
            langApp: 2,
            themApp: ThemeApp.light,
            isAdmob: false,
            learnWordCount: 0,
            learnPhraseCount: 0,
            idDialects:2)));
  }
}

class GoogleLogoPainter extends CustomPainter {
  @override
  // ignore: avoid_renaming_method_parameters
  bool shouldRepaint(_) => true;

  @override
  void paint(Canvas canvas, Size size) {
    final length = size.width;
    final verticalOffset = (size.height / 2) - (length / 2);
    final bounds = Offset(0, verticalOffset) & Size.square(length);
    final center = bounds.center;
    final arcThickness = size.width / 4.5;
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = arcThickness;

    void drawArc(double startAngle, double sweepAngle, Color color) {
      final _paint = paint..color = color;
      canvas.drawArc(bounds, startAngle, sweepAngle, false, _paint);
    }

    drawArc(3.5, 1.9, Colors.red);
    drawArc(2.5, 1.0, Colors.amber);
    drawArc(0.9, 1.6, Colors.green.shade600);
    drawArc(-0.18, 1.1, Colors.blue.shade600);

    canvas.drawRect(
      Rect.fromLTRB(
        center.dx,
        center.dy - (arcThickness / 2),
        bounds.centerRight.dx + (arcThickness / 2) - 4,
        bounds.centerRight.dy + (arcThickness / 2),
      ),
      paint
        ..color = Colors.blue.shade600
        ..style = PaintingStyle.fill
        ..strokeWidth = 0,
    );
  }
}
