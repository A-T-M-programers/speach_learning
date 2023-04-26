import 'package:speach_learning/Domain/Entity/Participants.dart';
import 'package:speach_learning/core/utils/enums.dart';

import 'dialect_model.dart';

// ignore: must_be_immutable
class ParticipantModel extends Participants {
  ParticipantModel(
      {required super.id,
      required super.name,
      required super.email,
      required super.imageParticipant,
      required super.langApp,
      required super.themApp,
      required super.isAdmob,
      required super.learnWordCount,
      required super.learnPhraseCount,
      required super.dialects});

  factory ParticipantModel.fromJson(Map<String, dynamic> json) =>
      ParticipantModel(
          id: 1 /*json["id"]*/,
          name: json["name"],
          email: json["email"],
          imageParticipant: ImageParticipant(linkImage: json["link_image"], stateImage: json["link_image"] != "" ? StateImage.remote : StateImage.local),
          langApp: json["lang_app"],
          themApp: json["theme_app"] == "D" ? ThemeApp.dark : ThemeApp.light,
          isAdmob: json["is_admob"] == 0 ? false : true,
          learnWordCount: json["learn_word_count"],
          learnPhraseCount: json["learn_phrase_count"],
          dialects: DialectModel.fromJson(json));
}