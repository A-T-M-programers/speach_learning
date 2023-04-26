import 'package:dartz/dartz.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:speach_learning/core/error/exceptions.dart';
import 'package:speach_learning/core/error/failure.dart';

class GoogleAuth {
  final GoogleSignIn _googleSignIn ;

  GoogleAuth(this._googleSignIn);

  Future<String> init() async {
    bool isAuthorized = false;
    String email = "";
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) async {
      isAuthorized = account != null;
      if(account != null){
        isAuthorized = await _googleSignIn.canAccessScopes(['email','https://www.googleapis.com/auth/contacts.readonly']);
      }
      if(isAuthorized){
        _googleSignIn.signInSilently();
        email = account!.email;
      }
    });
    return email;
  }

  Future<Either<Failure,GoogleSignInAccount?>> getAuthParticipant() async {
    try{
      return Right(await _googleSignIn.signIn());
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}