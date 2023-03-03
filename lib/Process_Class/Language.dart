
class Language{
  late String _id;
  String get id => _id;

  late String _language;
  String get language => _language;

  late int _levelCount;
  int get levelCount => _levelCount;

  Language({required Map data}){
    _id = data["id"];
    _language = data[Language];
    _levelCount = data["Level-Count"];
  }
}