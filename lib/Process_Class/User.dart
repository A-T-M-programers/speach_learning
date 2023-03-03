
// ignore: constant_identifier_names
enum TypeUser { Admin , User }

class User{
  static late String _id;
  static String get id => _id;

  static late TypeUser _typeUser;
  static TypeUser get typeUser  => _typeUser;

  static late String _name;
  static String get name => _name;

  static late String _email;
  static String get email => _email;

  static late String _linkImage;
  static String get linkImage => _linkImage;

  static late String _lanApp;
  static String get lanApp => _lanApp;
  static void setLanApp(String lanApp){
    _lanApp = lanApp;
  }

  static late bool _themApp;
  static bool get themApp => _themApp;
  static void setThemApp(bool isDark) {
    _themApp = isDark;
  }

  static late double _volume;
  static double get volume => _volume;
  static void setVolume(double volume){
    _volume = volume;
  }

  static late String _studyLan;
  static String get studyLan => _studyLan;

  static late bool _isAdmob;
  static bool get isAdmob => _isAdmob;

  static late int _learnWordCount;
  static int get learnWordCount => _learnWordCount;

  static late int _learnPhraseCount;
  static int get learnPhraseCount => _learnPhraseCount;

  static late int _level;
  static int get level => _level;
  static setLevel(int level){
    _level = level;
  }

  User({required TypeUser typeUser,required Map user}){
    _typeUser = typeUser;
    _id = user["id"];
    _name = user["Name"];
    _email = user["Email"];
    _linkImage = user["Link-Image"];
    _lanApp = user["Lan-App"];
    _themApp = user["Them-App"] == "0" ? false : true;
    _volume = double.parse(user["Volume"]);
    _studyLan = user["Study-Lan"];
    _level = int.parse(user["Level"]);
    _isAdmob = int.parse(user["Is-Admob"]) == 0 ? false : true;
  }
}