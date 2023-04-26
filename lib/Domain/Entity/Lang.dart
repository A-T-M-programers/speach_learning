import 'package:equatable/equatable.dart';

class Lang extends Equatable{
  final int id;

  final String name;

  const Lang({required this.id,required this.name});

  @override
  List<Object> get props => [id,name];
}