import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:speach_learning/Profile/Widget/SimpleSwitchCostome.dart';
import 'package:speach_learning/Profile/Widget/ToggleButtomCustom.dart';
import 'package:speach_learning/Profile/model/GetPhoto.dart';
import 'package:volume_controller/volume_controller.dart';

import '../../SplashScreen/UI/Splash_Screen.dart';
import 'DisplayPhoto.dart';

// ignore: camel_case_types
class profile_page extends StatefulWidget {
  // ignore: non_constant_identifier_names
  const profile_page({Key? key,required this.Level}) : super(key: key);

  // ignore: non_constant_identifier_names
  final int Level;

  @override
  State<profile_page> createState() => _profile_pageState();
}

// ignore: camel_case_types
class _profile_pageState extends State<profile_page> {
  // ignore: prefer_const_constructors
  Size size = Size(0.0, 0.0);
  bool _switched = false;
  double _setVolumeValue = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    VolumeController().listener((volume) {
      setState(() => _setVolumeValue = volume);
    });

    VolumeController().getVolume().then((volume) => _setVolumeValue = volume);
  }
  @override
  void dispose() {
    VolumeController().removeListener();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          iconTheme: Theme.of(context).appBarTheme.iconTheme,
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          title: Text("profile",style: TextStyle(color: Theme.of(context).textTheme.headline1!.color),).tr(),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: SizedBox(
              width: size.width,
          height: size.height,
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
                          color: Theme.of(context).cardColor,
                          border: Border.all(
                              width: 1.0, color: const Color(0xff888579)),
                        ),
                      ),
                    ),
                    Container(
                        width: size.width,
                        margin: EdgeInsets.only(top: (size.height * 0.25) - 70.0),
                        child: get_svg_top_navbar(size.width,context)),
                  ],
                ),
              ),
              Pinned.fromPins(
                Pin(size: size.height * 0.15, middle: size.height > size.width ? 0.5017 : 0.0517),
                Pin(size: size.height * 0.15, start: size.height * 0.05),
                child: Stack(
                  children: <Widget>[
                    Center(child: Stack(
                      children: <Widget>[
                        SizedBox(
                          height: 100,
                          width: 100,
                          child: Stack(
                              children: [
                            GestureDetector(
                                onTap: () {
                                  setState(() {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => get_photo
                                                    .path.path.isNotEmpty
                                                ? show_photo(
                                                    path: get_photo.path.path,
                                                    type: "D",
                                                  )
                                                : show_photo(
                                                    path: "",
                                                    type: "",
                                                  )));
                                  });
                                },
                                child: get_photo.path.path.isNotEmpty
                                    ? Container(
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: FileImage(
                                                  File(get_photo.path.path)),
                                              fit: BoxFit.fill),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Theme.of(context)
                                                    .shadowColor,
                                                blurRadius: 10)
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          border: Border.all(
                                              color: Colors.white, width: 3),
                                        ),
                                        child: null,
                                        // ignore: prefer_const_constructors
                                      )
                                    : Container(
                                        decoration: BoxDecoration(
                                          // ignore: prefer_const_constructors
                                          image: DecorationImage(
                                              // ignore: prefer_const_constructors
                                              image: AssetImage(
                                                  "assets/SplashScreen/SplashScreen.png"),
                                              fit: BoxFit.fill),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Theme.of(context)
                                                    .shadowColor,
                                                blurRadius: 10)
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          border: Border.all(
                                              color: Colors.white, width: 3),
                                        ),
                                        child: null,
                                        // ignore: prefer_const_constructors
                                      )
                                //     : CachedNetworkImage(
                                //   imageUrl: widget.member.getImage,
                                //   imageBuilder: (context, imageProvider) =>
                                //       Container(
                                //         decoration: BoxDecoration(
                                //           boxShadow: [
                                //             BoxShadow(
                                //                 color: Theme.of(context).shadowColor,
                                //                 blurRadius: 10)
                                //           ],
                                //           borderRadius: BorderRadius.circular(50),
                                //           image: DecorationImage(
                                //             image: imageProvider,
                                //             fit: BoxFit.fill,
                                //           ),
                                //         ),
                                //       ),
                                //   placeholder: (context, url) =>
                                //       CircularProgressIndicator(),
                                //   errorWidget: (context, url, error) =>
                                //       Icon(Icons.error),
                                // )
                                ),
                          ]),
                        ),
                      ],
                    )),
                    Pinned.fromPins(
                        Pin(size: size.height * 0.04, start: 0.0),
                        Pin(size: size.height * 0.04, end: 6.5),
                        child: IconButton(
                          onPressed: () async {
                            await get_photo.showSelectionDialog(context);
                            setState(() {});
                          },
                          icon: const Icon(Icons.add_photo_alternate),
                          color: Colors.lime,
                          iconSize: size.height * 0.04,
                        )),
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
                              color: Theme.of(context).textTheme.headline2!.color,
                            ),
                            softWrap: false,
                          ),
                        )),
                    Expanded(
                        flex: 3,
                        child: Pinned.fromPins(
                            context.locale == Locale('en')? Pin(size: 70.0, end: 0.0) :Pin(size: 70.0, start: 0.0),
                            Pin(size: 30.0, end: 2.0),
                            child: GestureDetector(
                              onTap: toggleSwitch,
                              child: SimpleSwitchCustome(toggle: _switched),
                            )
                        )),
                  ],
                ),
              ),
              Pinned.fromPins(
                Pin(start: 20.0, end: 21.0),
                Pin(size: 40.0, middle: 0.6532),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        flex: 1,
                        child: Center(
                            child: Pinned.fromPins(
                          Pin(size: 100.0, start: 0.0),
                          Pin(start: 17.0, end: 0.0),
                          // ignore: prefer_const_constructors
                          child: Text(
                            '*  '+'darkmode'.tr(),
                            // ignore: prefer_const_constructors
                            style: TextStyle(
                              fontFamily: 'PMingLiU-ExtB',
                              fontSize: 16,
                              color: Theme.of(context).textTheme.headline2!.color,
                            ),
                            softWrap: false,
                          ),
                        ))),
                    Expanded(
                        flex: 3,
                        child: Pinned.fromPins(
                            context.locale == Locale('en')? Pin(size: 146.0, end: 0.0):Pin(size: 146.0, start: 0.0),
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
                            '*  '+'volume'.tr(),
                            // ignore: prefer_const_constructors
                            style: TextStyle(
                              fontFamily: 'PMingLiU-ExtB',
                              fontSize: 16,
                              color: Theme.of(context).textTheme.headline2!.color,
                            ),
                            softWrap: false,
                          ),
                        )),
                    Expanded(
                flex:3,
                child: Align(
                      alignment:context.locale == Locale('en')? Alignment.centerRight:Alignment.centerLeft,
                      child: SizedBox(
                        width: 234.0,
                        height: 12.0,
                        child: Slider(
                          activeColor: Colors.lightBlue,
                            min: 0.0,
                            max: 1.0,
                            value: _setVolumeValue,
                            onChanged: (value){
                              _setVolumeValue = value;
                              VolumeController().setVolume(value);
                              setState(() {});
                        }),
                      ),
                    )),
                  ],
                ),
              ),
              Pinned.fromPins(
                Pin(start: 20.0, end: 48.0),
                Pin(size: 20.0, middle: 0.7805),
                child: Row(
                  children: <Widget>[
                    Expanded(
                flex:1,
                child: Pinned.fromPins(
                      Pin(size: 100.0, middle: 0.0),
                      Pin(size: 30.0, end: 0.0),
                      // ignore: prefer_const_constructors
                      child: Text(
                        '*  '+'level'.tr(),
                        // ignore: prefer_const_constructors
                        style: TextStyle(
                          fontFamily: 'PMingLiU-ExtB',
                          fontSize: 16,
                          color: Theme.of(context).textTheme.headline2!.color,
                        ),
                        softWrap: false,
                      ),
                    )),
                    Expanded(
                      flex: 3,
                      child: Pinned.fromPins(
                        context.locale == Locale('en')? Pin(size: size.width * 0.2, end: 0.0):Pin(size: size.width * 0.2, start: 0.0),
                      Pin(size: 16.0, start: 1.0),
                      // ignore: prefer_const_constructors
                      child: Text(
                        '${widget.Level}',
                        // ignore: prefer_const_constructors
                        style: TextStyle(
                          fontFamily: 'PMingLiU-ExtB',
                          fontSize: 14,
                          color: Theme.of(context).textTheme.headline2!.color,
                        ),
                        textAlign: TextAlign.center,
                        softWrap: false,
                      ),
                    )),
                  ],
                ),
              ),
            ],
          ),
        )));
  }

  void toggleSwitch() {
    if(_switched){
      //In English
      // ignore: prefer_const_constructors
      context.setLocale(Locale('en'));
    }else{
      //In Arabic
      // ignore: prefer_const_constructors
      context.setLocale(Locale('ar'));
    }
    setState(() {
      _switched = !_switched;
    });
  }
}
