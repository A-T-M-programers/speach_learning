class Filter_Text{
  static List<String> _somple = ['!','@','#','\$','%','^','&','*','(',')','_','-','+','=','<','>','?','/','\\','|',':','~','×','{','}','[',']',',','.',' ','\n','\t'];

  static String substring(String str){
    for(int i = 0; i < _somple.length;i++){
      if(str.contains(_somple[i])){
        str = str.replaceAll(_somple[i], '');
      }
    }
    return str;
  }
}