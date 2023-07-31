import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mountain100/data/model/user/user_model.dart';
import 'package:mountain100/data/network/service/user_service.dart';

import '../../app/app.dart';
import '../../util/route_provier.dart';
import '../main/main_provider.dart';

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
    //final fcmToken = await FirebaseMessaging.instance.getToken(vapidKey: dotenv.get('FCM_KEY')).then((value){print(value);});
    ref.read(userCredentialProvider.notifier).state = await ref.read(userServiceProvider).signInWithGoogle().then((value) async {
      if (value.additionalUserInfo!.isNewUser){
        navigatorKey.currentState?.pushNamedAndRemoveUntil(
            Routes.loginRoute, (route) => false);
      }
      else{
        var result=await firestore.collection('UserInfo').doc(value.user!.uid).get();
        try{
          ref.read(userInfoProvider.notifier).state=UserModel.fromJson(result.data()!);
          final len = ref.read(userInfoProvider.notifier).state!.climbCompleteList.length;
          if (len>=2){
            final models = ref.read(userInfoProvider.notifier).state!.climbCompleteList.sublist(len-2);
            ref.read(mainRecentClimbMountainListProvider.notifier).state=[...models];
          }
          else {
            ref.read(mainRecentClimbMountainListProvider.notifier).state=[...ref.read(userInfoProvider.notifier).state!.climbCompleteList];
          }
          navigatorKey.currentState?.pushNamedAndRemoveUntil(
              Routes.mainRoute, (route) => false);
        }
        catch(e){
          print(e.toString());
          Fluttertoast.showToast(msg:"유저 정보를 찾을 수 없습니다.\n다시 로그인 해주세요.",);
          navigatorKey.currentState?.pushNamedAndRemoveUntil(
              Routes.loginRoute, (route) => false);
        }
      }
      return value;
    });
  }



}
