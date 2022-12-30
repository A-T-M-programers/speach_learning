class ErrorListen{
  static final Map<String,String> _mapErr = {"Match":"Their is not Match","err_Network":"Their is not Network Connection","err_speech":"The Speech is not clearly"};

  static String getError(String err){
    _mapErr.forEach((key, value) {
      err == key ? err = value: err = err;
    });

    return err;
  }
}