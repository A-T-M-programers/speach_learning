import 'package:equatable/equatable.dart';

class Dialects extends Equatable{
  final int id;

  final String locale;

  final String key;

  final int idLang;

  const Dialects({
    this.id = 0,
    this.locale = "",
    this.key = "",
    this.idLang = 0});

  @override
  List<Object> get props => [id,locale,key,idLang];
}