import 'package:equatable/equatable.dart';
import 'package:speach_learning/Domain/Entity/Dialects.dart';
import 'package:speach_learning/Domain/Entity/Lang.dart';
import 'package:speach_learning/core/utils/enums.dart';

// ignore: must_be_immutable
class Participants extends Equatable {
  final int id;

  final String name;

  final String email;

  ImageParticipant imageParticipant;
  void setImageParticipant(ImageParticipant imageParticipant){
    this.imageParticipant = imageParticipant;
  }

  int langApp;
  void setLang(int lang){
    langApp = lang;
  }

  ThemeApp themApp;
  void setThemeApp(ThemeApp themeApp){
    themApp = themeApp;
  }

  final bool isAdmob;

  final int learnWordCount;

  final int learnPhraseCount;

  final Dialects dialects;

  Participants(
      {required this.id,
      required this.name,
      required this.email,
      required this.imageParticipant,
      required this.langApp,
      required this.themApp,
      required this.isAdmob,
      required this.learnWordCount,
      required this.learnPhraseCount,
      required this.dialects});

  factory Participants.from(Participants participants) => Participants(
      id: participants.id,
      name: participants.name,
      email: participants.email,
      imageParticipant: participants.imageParticipant,
      langApp: participants.langApp,
      themApp: participants.themApp,
      isAdmob: participants.isAdmob,
      learnWordCount: participants.learnWordCount,
      learnPhraseCount: participants.learnPhraseCount,
      dialects: participants.dialects);

  factory Participants.empty() => Participants(
      id: 0,
      name: "",
      email: "",
      imageParticipant: const ImageParticipant(linkImage: "", stateImage: StateImage.local),
      langApp: 1,
      themApp: ThemeApp.light,
      isAdmob: false,
      learnWordCount: 0,
      learnPhraseCount: 0,
      dialects: const Dialects(id: 0, locale: "", key: "", lang: Lang(id: 0, name: "")));

  @override
  List<Object> get props => [
        id,
        name,
        email,
    imageParticipant,
        langApp,
        themApp,
        isAdmob,
        learnWordCount,
        learnPhraseCount,
        dialects
      ];
}

// ignore: must_be_immutable
class ImageParticipant extends Equatable{
  final String linkImage;

  final StateImage stateImage;

  const ImageParticipant({required this.linkImage,required this.stateImage});

  factory ImageParticipant.setImageParticipant() {
   return const ImageParticipant(linkImage: "", stateImage: StateImage.local);
 }

  @override
  List<Object> get props => [linkImage,stateImage];
}
