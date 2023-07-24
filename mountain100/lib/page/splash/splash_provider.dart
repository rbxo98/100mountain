import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mountain100/data/model/user/user_model.dart';
import 'package:mountain100/data/network/service/user_service.dart';

import '../../app/app.dart';
import '../../util/route_provier.dart';

final splashProvider =  Provider<SplashProvider>((ref)=>SplashProvider(ref:ref));
late final userCredentialProvider = StateProvider<UserCredential?>((ref) => null);
final userInfoProvider = StateProvider<UserModel?>((ref) => null);

abstract class SplashProviderInterface{
  init();
}

class SplashProvider with SplashProviderInterface{
  final ProviderRef ref;
  final firestore = FirebaseFirestore.instance;
  SplashProvider({required this.ref});

  @override
  init() async {
    ref.read(userCredentialProvider.notifier).state = await ref.read(userServiceProvider).signInWithGoogle().then((value) async {
      if (!value.additionalUserInfo!.isNewUser){
        var result=await firestore.collection('UserInfo').doc(value.user!.uid).get();
        print(result.data()!);
        ref.read(userInfoProvider.notifier).state=UserModel.fromJson(result.data()!);
        print("####");
        navigatorKey.currentState?.pushNamedAndRemoveUntil(
            Routes.mainRoute, (route) => false);
      }
      else{
        navigatorKey.currentState?.pushNamedAndRemoveUntil(
            Routes.loginRoute, (route) => false);
      }
      return value;
    });
  }



}
