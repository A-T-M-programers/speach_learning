// import 'package:adobe_xd/adobe_xd.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:shimmer/shimmer.dart';
// import 'package:speach_learning/Presentation/PhraseUI/controler/phrase_bloc.dart';
// import 'package:speach_learning/Presentation/Read/UI/read_page.dart';
// import 'package:speach_learning/Presentation/Read/Widget/BottomSheet.dart';
// import 'package:speach_learning/core/error/ui_error.dart';
// import 'package:speach_learning/core/network/check_connection.dart';
// import 'package:speach_learning/core/utils/enums.dart';
// import 'package:flutter_svg/flutter_svg.dart';
//
// class ViewFloating extends StatelessWidget {
//   const ViewFloating({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<PhraseBloc,PhraseState>(
//         buildWhen: (previous, current) => previous.requestState != current.requestState,
//         builder: (context, state) {
//       switch(state.requestState){
//         case RequestState.loading:
//           return Shimmer.fromColors(
//               child: const SizedBox(height: 50,width: 50,),
//               baseColor: Theme.of(context).textTheme.headline2!.color!,
//               highlightColor: Theme.of(context).scaffoldBackgroundColor);
//         case RequestState.loaded:
//           return FloatingActionButton(
//             elevation: 25,
//             backgroundColor: Colors.transparent,
//             onPressed: () async {
//               if (await CheckConnection.getCheckConnectionNetWork()) {
//                 if (state.level.listPhraseItem.isNotEmpty && (state.level.listPhraseItem.contains(state.level.listPhraseItem.firstWhere((element) => element.type == "1")))) {
//                   Navigator.push(context, MaterialPageRoute(builder: (route) => read_page(context: route,listPhrase: state.level.listPhraseItem.where((element) => element.type == "1").toList())));
//                 }
//               }else{
//                 bottomSheet.showbottomsheet(context, {"Problem": "err_Network"});
//               }
//             },
//             child: SizedBox(
//                 height: 50.0,
//                 width: 60.0,
//                 child: Stack(
//                   children: <Widget>[
//                     SizedBox.expand(
//                         child: SvgPicture.string(
//                           _svg_gowi32,
//                           allowDrawingOutsideViewBox: true,
//                           fit: BoxFit.fill,
//                         )),
//                     Align(
//                       alignment: const Alignment(-0.240, 0.0),
//                       child: SizedBox(
//                         width: 26.0,
//                         height: 18.0,
//                         child: Stack(
//                           children: <Widget>[
//                             Pinned.fromPins(
//                               Pin(size: 4.1, start: 0.0),
//                               Pin(start: 2.5, end: 2.5),
//                               child: SvgPicture.string(
//                                 _svg_blxhzz,
//                                 allowDrawingOutsideViewBox: true,
//                                 fit: BoxFit.fill,
//                               ),
//                             ),
//                             Pinned.fromPins(
//                               Pin(size: 4.5, middle: 0.3249),
//                               Pin(start: 0.0, end: 0.0),
//                               child: SvgPicture.string(
//                                 _svg_d3yaw,
//                                 allowDrawingOutsideViewBox: true,
//                                 fit: BoxFit.fill,
//                               ),
//                             ),
//                             Pinned.fromPins(
//                               Pin(size: 4.6, middle: 0.6689),
//                               Pin(start: 3.3, end: 3.3),
//                               child: SvgPicture.string(
//                                 _svg_xbzq4,
//                                 allowDrawingOutsideViewBox: true,
//                                 fit: BoxFit.fill,
//                               ),
//                             ),
//                             Pinned.fromPins(
//                               Pin(size: 4.2, end: 0.0),
//                               Pin(start: 2.5, end: 2.5),
//                               child: SvgPicture.string(
//                                 _svg_gy3ddt,
//                                 allowDrawingOutsideViewBox: true,
//                                 fit: BoxFit.fill,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 )),
//           );
//         case RequestState.error:
//           return UiError(
//               message: "err_Network",
//               retry: (){
//
//               },
//               close: () {
//                 Navigator.pop(context);
//               });
//       }
//     });
//   }
// }
//
// // ignore: constant_identifier_names
// const String _svg_blxhzz =
//     '<svg viewBox="0.0 2.5 4.1 12.5" ><path transform="translate(0.09, 2.48)" d="M 1.967854619026184 -0.0001080089714378119 C 4.151819705963135 -0.01916300319135189 3.999311685562134 2.793258428573608 3.999311685562134 6.239049911499023 C 3.999311685562134 9.684841156005859 4.424903392791748 12.41730499267578 1.967854619026184 12.47820949554443 C -0.4891944229602814 12.53911399841309 -0.06360273808240891 9.684841156005859 -0.06360273808240891 6.239049911499023 C -0.06360273808240891 2.793258428573608 -0.2161106616258621 0.01894698292016983 1.967854619026184 -0.0001080089714378119 Z" fill="#ddffcc" fill-opacity="0.49" stroke="#ddffcc" stroke-width="1" stroke-opacity="0.0" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// // ignore: constant_identifier_names
// const String _svg_d3yaw =
//     '<svg viewBox="7.1 0.0 4.5 17.5" ><path transform="translate(7.16, 0.01)" d="M 2.213550567626953 -0.004938301164656878 C 4.688959121704102 -0.1280732154846191 4.450174808502197 3.911765336990356 4.450174808502197 8.743264198303223 C 4.450174808502197 13.57476234436035 4.499468326568604 17.44812774658203 2.213550567626953 17.4914665222168 C -0.0723678320646286 17.53480339050293 -0.02307373285293579 13.57476234436035 -0.02307373285293579 8.743264198303223 C -0.02307373285293579 3.911765336990356 -0.2618572413921356 0.1181966289877892 2.213550567626953 -0.004938301164656878 Z" fill="#ddffcc" fill-opacity="0.49" stroke="#ddffcc" stroke-width="1" stroke-opacity="0.0" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// // ignore: constant_identifier_names
// const String _svg_xbzq4 =
//     '<svg viewBox="14.6 3.3 4.6 10.8" ><path transform="translate(14.63, 3.34)" d="M 2.280761480331421 -0.004920233972370625 C 4.561712741851807 0.07387544214725494 4.5615234375 2.374162912368774 4.5615234375 5.308910846710205 C 4.5615234375 8.243658065795898 4.561712741851807 10.8209228515625 2.280761480331421 10.8209228515625 C -0.0001896563189802691 10.8209228515625 -1.80592692800019e-07 8.243658065795898 -1.80592692800019e-07 5.308910846710205 C -1.80592692800019e-07 2.374162912368774 -0.0001896563189802691 -0.08371590822935104 2.280761480331421 -0.004920233972370625 Z" fill="#ddffcc" fill-opacity="0.49" stroke="#ddffcc" stroke-width="1" stroke-opacity="0.0" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// // ignore: constant_identifier_names
// const String _svg_gy3ddt =
//     '<svg viewBox="22.2 2.5 4.2 12.4" ><path transform="translate(22.26, 2.54)" d="M 2.064984321594238 -0.001448087394237518 C 4.495635032653809 -0.06252509355545044 4.165196895599365 2.777401685714722 4.165196895599365 6.205286979675293 C 4.165196895599365 9.633169174194336 4.317702770233154 12.52388477325439 2.064984321594238 12.41201877593994 C -0.1877345144748688 12.30015563964844 -0.03522882610559464 9.633169174194336 -0.03522882610559464 6.205286979675293 C -0.03522882610559464 2.777401685714722 -0.3656669855117798 0.059628926217556 2.064984321594238 -0.001448087394237518 Z" fill="#ddffcc" fill-opacity="0.49" stroke="#ddffcc" stroke-width="1" stroke-opacity="0.0" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
// // ignore: constant_identifier_names
// const String _svg_gowi32 =
//     '<svg viewBox="146.0 695.0 72.8 60.1" ><path transform="translate(146.0, 695.0)" d="M 28.61854362487793 0 C 44.42412567138672 0 57.23708724975586 13.46099185943604 57.23708724975586 30.06596755981445 C 57.23708724975586 36.60832977294922 50.61178970336914 55.28749084472656 72.804931640625 58.21096038818359 C 67.361328125 60.23491668701172 38.19672775268555 60.13193511962891 28.61854362487793 60.13193511962891 C 12.81296062469482 60.13193511962891 0 46.67094802856445 0 30.06596755981445 C 0 13.46099185943604 12.81296062469482 0 28.61854362487793 0 Z" fill="#554616" stroke="#554616" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
