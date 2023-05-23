import 'package:easy_localization/easy_localization.dart';

class ErrorListen{
  static final Map<String,String> _mapErr = {"Match":"match".tr(),"err_Network":"errnetwork".tr(),"err_speech":"errspeech".tr(),"excellent":"excellent".tr(),"final":"final".tr(),"continue":"continue".tr()};

  static String getError(String err){
    _mapErr.forEach((key, value) {
      err == key ? err = value: err = err;
    });

    return err;
  }
}