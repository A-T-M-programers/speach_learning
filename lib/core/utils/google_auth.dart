import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:speach_learning/core/error/exceptions.dart';
import 'package:speach_learning/core/error/failure.dart';

class GoogleAuth {
  final GoogleSignIn _googleSignIn ;
  static String email = "";

  GoogleAuth(this._googleSignIn);

  Future<void> init() async {
    try {
      bool isAuthorized = false;
      _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) async {
        isAuthorized = account != null;
        if (account != null) {
          isAuthorized = await _googleSignIn.canAccessScopes(['email', 'https://www.googleapis.com/auth/contacts.readonly']);
          if (isAuthorized) {
            _googleSignIn.signInSilently();
            email = account.email;
          }
        }
      });
    }catch(e){
      print(e.toString());
    }
  }

  Future<Either<Failure,GoogleSignInAccount?>> getAuthParticipant() async {
    try{
      if( await _googleSignIn.isSignedIn() && _googleSignIn.currentUser != null){
        email = _googleSignIn.currentUser!.email;
        return Right(_googleSignIn.currentUser);
      }else {
        return Right(await _googleSignIn.signIn());
      }
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage,failure.errorMessageModel.statesCode,DioErrorType.badResponse));
    }
  }
}