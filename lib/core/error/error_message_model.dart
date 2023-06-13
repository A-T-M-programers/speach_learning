import 'package:equatable/equatable.dart';

import 'filter_error.dart';

class ErrorMessageModel extends Equatable{
  final int statesCode;
  final String statusMessage;
  final bool success;

  const ErrorMessageModel({
    required this.statesCode,
    required this.statusMessage,
    required this.success
  });

  factory ErrorMessageModel.fromJson(Map<String,dynamic> json){
    return ErrorMessageModel(statesCode: json["status_code"] != null ? int.parse(json["status_code"]) : 404, statusMessage: FilterErrorBySectionNumber(json["status_code"] != null ? int.parse(json["status_code"]) : 404).call(), success: json["success"] ?? false);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [statesCode,statusMessage,success];


}