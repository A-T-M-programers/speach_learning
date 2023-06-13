import 'package:dartz/dartz.dart';
import 'package:speach_learning/Domain/Repository/repository_system.dart';
import 'package:speach_learning/Presentation/LogIn/controler/log_in_bloc.dart';
import 'package:speach_learning/core/error/failure.dart';
import 'package:speach_learning/core/usecases/base_useCase.dart';

class GetTokenUseCase extends BaseUseCase<String,GetTokenEvent>{
  final BaseSystemRepository<String,GetTokenEvent> baseSystemRepository;

  GetTokenUseCase(this.baseSystemRepository);

  @override
  Future<Either<Failure,String>> call(GetTokenEvent param) async {
    return await baseSystemRepository(param);
  }
}

class GetPermittingUseCase extends BaseUseCase<String,CheckIsSuccessLogInEvent>{
  final BaseSystemRepository<String,CheckIsSuccessLogInEvent> baseSystemRepository;

  GetPermittingUseCase(this.baseSystemRepository);

  @override
  Future<Either<Failure,String>> call(CheckIsSuccessLogInEvent param) async {
    return await baseSystemRepository(param);
  }
}