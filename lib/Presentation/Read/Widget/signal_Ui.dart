import 'dart:math';

import 'package:adobe_xd/pinned.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_audio_waveforms/flutter_audio_waveforms.dart';
import 'package:speach_learning/Presentation/Read/controler/voice_bloc.dart';

class SignalUiControler extends StatelessWidget {


  const SignalUiControler({Key? key}) : super(key: key);

  static Size size = const Size(0, 0);

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        SizedBox.expand(
            child: SvgPicture.string(
              _svg_quqi4l,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            )),
        Pinned.fromPins(Pin(start: size.width * 0.09), Pin(),
            child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 50),
                child: Container(
                                  height: 6,
                                  decoration: const BoxDecoration(
                                      borderRadius:
                                      BorderRadius.all(
                                          Radius.circular(50))),
                                  margin: const EdgeInsets.only(right: 8),
                                  child: BlocBuilder<VoiceBloc,VoiceState>(
                                      builder: (context,state) {
                                      if(state is ChangeRateVoiceState) {
                                        return RectangleWaveform(
                                          samples: List.generate(
                                              70, (index) => state.rate -
                                              (Random().nextDouble() * 10.0)),
                                          height: 40,
                                          width: size.width * 0.5,
                                          activeColor: Colors.white70,
                                          inactiveColor: Colors.white70,
                                          elapsedDuration: const Duration(
                                              milliseconds: 50),
                                          maxDuration: const Duration(
                                              milliseconds: 50),
                                          isCentered: true,
                                          isRoundedRectangle: true,
                                          inactiveBorderColor: Colors.black45,
                                          activeBorderColor: Colors.black45,
                                          borderWidth: 0.001,
                                          activeGradient: const LinearGradient(
                                              begin: Alignment.bottomCenter,
                                              end: Alignment.topCenter,
                                              colors: [
                                                Colors.black26,
                                                Colors.black45
                                              ],
                                              stops: [0.0, 0.3]),
                                        );
                                      }else{
                                        return RectangleWaveform(
                                          samples: List.generate(
                                              70, (index) => Random().nextDouble() * 10.0),
                                          height: 40,
                                          width: size.width * 0.5,
                                          activeColor: Colors.white70,
                                          inactiveColor: Colors.white70,
                                          elapsedDuration: const Duration(
                                              milliseconds: 50),
                                          maxDuration: const Duration(
                                              milliseconds: 50),
                                          isCentered: true,
                                          isRoundedRectangle: true,
                                          inactiveBorderColor: Colors.black45,
                                          activeBorderColor: Colors.black45,
                                          borderWidth: 0.001,
                                          activeGradient: const LinearGradient(
                                              begin: Alignment.bottomCenter,
                                              end: Alignment.topCenter,
                                              colors: [
                                                Colors.black26,
                                                Colors.black45
                                              ],
                                              stops: [0.0, 0.3]),
                                        );
                                      }

                                    }),
                                )))
    ]);
  }
}

// ignore: constant_identifier_names
const String _svg_quqi4l =
    '<svg viewBox="146.0 695.0 359.9 134.0" ><path transform="translate(146.0, 695.0)" d="M 141.4691314697266 0 C 229.6003723144531 0 302.9382629394531 19.99692153930664 322.9382629394531 47 C 352.9382629394531 81.57921600341797 270.1876373291016 123.2044677734375 359.894287109375 129.71923828125 C 332.985107421875 134.2294921875 188.8166656494141 134 141.4691314697266 134 C 63.33789825439453 134 0 104.0030822753906 0 67 C 0 29.99692153930664 63.33789825439453 0 141.4691314697266 0 Z" fill="#554616" stroke="#554616" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';