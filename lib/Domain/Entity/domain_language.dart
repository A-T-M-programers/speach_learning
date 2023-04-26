import 'package:equatable/equatable.dart';

class DomainLanguage extends Equatable{
  final int idDomain;
  final int idLang;
  final String titleTrans;
  final String descriptionTrans;

  const DomainLanguage(
      {required this.idDomain,required this.idLang,required this.titleTrans,required this.descriptionTrans});

  @override
  List<Object> get props => [idDomain,idLang,titleTrans,descriptionTrans];
}
