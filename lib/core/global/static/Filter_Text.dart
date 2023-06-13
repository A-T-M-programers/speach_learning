// ignore: camel_case_types
class Filter_Text{
  static final List<String> _somple = ['!','@','#','\$','%','^','&','*','(',')','_','-','+','=','<','>','?','/','\\','|',':','~','×','{','}','[',']',',','.',' ','\n','\t'];
  static final Map<String,String> _type = {"Question":"?","Normal":"."};
  static final List<String> _compoundPhrase = ["-"];
  static final Map<String,bool> _returnTypePhrase = {"0":false,"1":true,"2":true};

  static String substring(String str){
    for(int i = 0; i < _somple.length;i++){
      if(str.contains(_somple[i])){
        str = str.replaceAll(_somple[i], '');
      }
    }
    return str;
  }
  static String addMark(String str){
    if(_type.containsKey(str)) return _type[str]!;
    return "";
  }
  static bool returnTypePhrase(String str){
    return _returnTypePhrase.containsKey(str) ? _returnTypePhrase[str]! : false;
  }

  static String isCompoundPhrase(String str){
    for(String element in _compoundPhrase){
      if(str.contains(element)){
        return str.split(element).join(" ");
      }
    }
    return str;
  }
}