import 'package:dio/dio.dart';
import 'package:speach_learning/Data/Model/domain_language_model.dart';
import 'package:speach_learning/Data/Model/domains_model.dart';
import 'package:speach_learning/Process_Class/Level.dart';
import 'package:speach_learning/Process_Class/PhraseItem.dart';
import 'package:speach_learning/Process_Class/Word.dart';
import 'package:speach_learning/Process_Class/WordOrPhraseType.dart';
import 'package:speach_learning/core/error/exceptions.dart';
import 'package:speach_learning/core/network/api_constance.dart';
import 'package:speach_learning/core/network/error_message_model.dart';


abstract class BaseSectionsRemoteDataSource{
  Future<List<DomainsModel>> getAllSectionsDataSource();
}

class SectionsRemoteDataSource extends BaseSectionsRemoteDataSource{

  @override
  Future<List<DomainsModel>> getAllSectionsDataSource() async {

    // final response = await Dio().get(ApiConstance.allSectionsPath);
    // if(response.statusCode == 200){
    //   return List<SectionsModel>.from(response.data);
    // }else{
    //   throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    // }
    int countLevel = 0;
    return List.generate(2, (index) => DomainsModel(
        id: index + 1,
        title: "Section ${index + 1}",
        description:"Description",
        idLang:0,
        listLevel:List.generate(6, (indexLevel) {
          countLevel++;
          return Level(data: {
            "id": "$countLevel",
            "id-Section": index,
            "Content": "Level $countLevel",
            "Trans-Content": "المستوى $countLevel",
            "Description": "Description",
            "Trans-Description": "Trans-Description",
            "Index": countLevel,
            "Type": countLevel < 4 ? "complete" : countLevel == 4 ? "start" : "",
            "Phrase-Count": 2,
            "List-Phrase-Item": [
              PhraseItem(data: {
                "id": "0",
                "Type": WordOrPhraseType(
                    data: {"id": "0", "Content": "Question", "Trans": "سؤال"}),
                "Index": 0,
                "Word-Count": 3,
                "id-Level": "0",
                "Level": 0,
                "List-Word": [
                  // ignore: prefer_const_literals_to_create_immutables
                  Word(data: {
                    "id": "0",
                    "Content": "How",
                    "Trans": "كيف",
                    "Index": 0,
                    "PhraseNumber": 0,
                    "Type": WordOrPhraseType(data: {
                      "id": "0",
                      "Content": "H-Question",
                      "Trans": "كلمة سؤال"
                    }),
                    "Word-In-Phrase": "How",
                    "Trans-In-Phrase": "كيف",
                    "UWRB": UWRB(data: {"Type": "2"})
                  }),
                  // ignore: prefer_const_literals_to_create_immutables
                  Word(data: {
                    "id": "1",
                    "Content": "are",
                    "Trans": "فعل مساعد",
                    "Index": 1,
                    "PhraseNumber": 0,
                    "Type": WordOrPhraseType(data: {
                      "id": "1",
                      "Content": "Verb-Be",
                      "Trans": "فعل كون"
                    }),
                    "Word-In-Phrase": "How are",
                    "Trans-In-Phrase": "كيف",
                    "UWRB": UWRB(data: {"Type": "2"})
                  }),
                  // ignore: prefer_const_literals_to_create_immutables
                  Word(data: {
                    "id": "5",
                    "Content": "you",
                    "Trans": "انت",
                    "Index": 2,
                    "PhraseNumber": 0,
                    "Type": WordOrPhraseType(
                        data: {"id": "1", "Content": "Pronoun", "Trans": "ضمير"}),
                    "Word-In-Phrase": "How are you",
                    "Trans-In-Phrase": "كيف حالك",
                    "UWRB": UWRB(data: {"Type": "2"})
                  })
                ],
                "List-PWRB": [
                  PWRB(data: {"id-Phrase": "0", "id-Word": "0", "Index": 0}),
                  PWRB(data: {"id-Phrase": "0", "id-Word": "1", "Index": 1}),
                  PWRB(data: {"id-Phrase": "0", "id-Word": "5", "Index": 2})
                ],
                "UPRB": UPRB(
                    data: {"Type": "1"})
              }),
              PhraseItem(data: {
                "id": "1",
                "Type": WordOrPhraseType(
                    data: {"id": "1", "Content": "Normal", "Trans": "بسيطة"}),
                "Index": 1,
                "Word-Count": 2,
                "id-Level": "0",
                "Level": 0,
                "List-Word": [
                  // ignore: prefer_const_literals_to_create_immutables
                  Word(data: {
                    "id": "3",
                    "Content": "Hello",
                    "Trans": "مرحبا",
                    "Index": 3,
                    "PhraseNumber": 1,
                    "Type": WordOrPhraseType(
                        data: {"id": "3", "Content": "Noun", "Trans": "اسم"}),
                    "Word-In-Phrase": "Hello",
                    "Trans-In-Phrase": "مرحبا",
                    "UWRB": UWRB(data: {"Type": "2"})
                  }),
                  // ignore: prefer_const_literals_to_create_immutables
                  Word(data: {
                    "id": "4",
                    "Content": "world",
                    "Trans": "عالم",
                    "Index": 4,
                    "PhraseNumber": 1,
                    "Type": WordOrPhraseType(
                        data: {"id": "3", "Content": "Noun", "Trans": "اسم"}),
                    "Word-In-Phrase": "Hello world",
                    "Trans-In-Phrase": "مرحبا بالعالم",
                    "UWRB": UWRB(data: {"Type": "2"})
                  }),
                ],
                "List-PWRB": [
                  PWRB(data: {"id-Phrase": "0", "id-Word": "3", "Index": 0}),
                  PWRB(data: {"id-Phrase": "0", "id-Word": "4", "Index": 1}),
                ],
                "UPRB": UPRB(
                    data: {"Type": "0"})
              }),
            ]
          });}
        ),
    domainLanguage: DomainLanguageModel(idDomain: index + 1,idLang: 0,titleTrans: "الوحدة ${index + 1}",descriptionTrans:"الوصف" )));
  }
}