import 'package:equatable/equatable.dart';

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
    return ErrorMessageModel(statesCode: json["status_code"], statusMessage: json["status_message"], success: json["success"]);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [statesCode,statusMessage,success];


}