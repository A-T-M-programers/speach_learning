import 'package:speach_learning/Domain/Entity/domain_participant.dart';
import 'package:speach_learning/core/utils/enums.dart';

abstract class BaseParticipantDomainDataSource{
  Future<DomainParticipant> getParticipantDomainDataSource(int idParticipant);
}

class ParticipantDomainRemoteDataSource extends BaseParticipantDomainDataSource{

  @override
  Future<DomainParticipant> getParticipantDomainDataSource(int idParticipant) async {

    // final response = await Dio().get(ApiConstance.participantsDomainPath);
    // if(response.statusCode == 200){
    //   return List<SectionsModel>.from(response.data);
    // }else{
    //   throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    // }
    return const DomainParticipant(idParticipant: 0, idDomain: 0, stateDomain: StateDomain.start,name: "EN");
  }
}