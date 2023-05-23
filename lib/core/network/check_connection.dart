import 'dart:io';

class CheckConnection{
  static Future<bool> getCheckConnectionNetWork() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        // ignore: avoid_print
        print('connected');
        return true;
      }else{
        return false;
      }
    } on SocketException catch (_) {
      // ignore: avoid_print
      print('not connected');
      return false;
    }
  }
}