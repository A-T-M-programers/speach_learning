import 'package:equatable/equatable.dart';
import 'package:speach_learning/Domain/Entity/Lang.dart';

class Dialects extends Equatable{
  final int id;

  final String locale;

  final String key;

  final Lang lang;

  const Dialects({required this.id,required this.locale,required this.key,required this.lang});

  @override
  List<Object> get props => [id,locale,key,lang];
}