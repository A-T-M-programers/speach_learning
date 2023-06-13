import 'package:equatable/equatable.dart';

abstract class FilterError extends Equatable{
  final int stateCode;

  const FilterError(this.stateCode);

  @override
  List<Object> get props => [stateCode];
}

class FilterErrorBySectionNumber extends FilterError{

  const FilterErrorBySectionNumber(super.stateCode);

  String call(){
    if(super.stateCode >= 400 && super.stateCode < 499){
      return "client";
    }else if(super.stateCode >= 500 && super.stateCode < 599){
      return "server";
    }
    return "";
  }

}