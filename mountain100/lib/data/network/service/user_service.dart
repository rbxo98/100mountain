import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../model/user/user_model.dart';
import '../failure.dart';

abstract class UserServiceInterface{
  // Future<Either<Failure,UserModel>> googleLogin();
}
final userServiceProvider = Provider((ref)=>UserService());

class UserService with UserServiceInterface{
  // @override
  // Future<Either<Failure, UserModel>> googleLogin() {
  //
  // }

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

}