import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../app/app.dart';
import '../../data/model/user/user_model.dart';
import '../../data/network/service/user_service.dart';
import '../../util/route_provier.dart';
import '../main/main_provider.dart';
import '../splash/splash_provider.dart';



abstract class LoginPageProviderInterface {
  loginByGoogle();
  setUserInfo(String nickname, {String? address, String? tel});
  setNotificationAgreeState(bool value);
}

final loginProvider = Provider<LoginPageProvider>((ref) => LoginPageProvider(ref: ref));
final loginNotificationAgreeProvider = StateProvider<bool>((ref) => false);
class LoginPageProvider with LoginPageProviderInterface {
  final ProviderRef ref;

  LoginPageProvider({required this.ref});

  @override
  loginByGoogle() async {
    final userCredential =
        await ref.read(userServiceProvider).signInWithGoogle();
    ref.read(userCredentialProvider.notifier).state = userCredential;
    if (userCredential.additionalUserInfo!.isNewUser) {
      navigatorKey.currentState!
          .pushNamedAndRemoveUntil(Routes.userinfoInput, (route) => false);
    } else {
      try {
      var result = await FirebaseFirestore.instance
          .collection('UserInfo')
          .doc(userCredential.user!.uid)
          .get();
      if(result.data()!=null){
        ref.read(userInfoProvider.notifier).state =
            UserModel.fromJson(result.data()!);
        final len =
            ref.read(userInfoProvider.notifier).state!.climbCompleteList.length;
        if (len >= 2) {
          final models = ref
              .read(userInfoProvider.notifier)
              .state!
              .climbCompleteList
              .sublist(len - 2);
          ref.read(mainRecentClimbMountainListProvider.notifier).state = [
            ...models
          ];
        } else {
          ref.read(mainRecentClimbMountainListProvider.notifier).state = [
            ...ref.read(userInfoProvider.notifier).state!.climbCompleteList
          ];
        }
        navigatorKey.currentState
            ?.pushNamedAndRemoveUntil(Routes.mainRoute, (route) => false);
      }
      else{
        ref.read(userCredentialProvider.notifier).state = userCredential;
        navigatorKey.currentState!
            .pushNamedAndRemoveUntil(Routes.userinfoInput, (route) => false);
      }
      } catch (e) {
        print(e.toString());
        Fluttertoast.showToast(
          msg: "유저 정보를 불러오는 중 오류가 발생했습니다.\n잠시 후 다시 시도해주세요.",
        );
        navigatorKey.currentState
            ?.pushNamedAndRemoveUntil(Routes.loginRoute, (route) => false);
      }
    }
    ;
  }

  @override
  setUserInfo(String nickname, {String? address, String? tel}) async  {
    // final token = await FirebaseMessaging.instance.getToken();
    final user = ref.read(userCredentialProvider.notifier).state!;
    UserInfoModel userInfoModel = UserInfoModel(nickname: nickname, address: address, email: user.user!.email!, rank: 'bronze', tel: tel);
    UserModel userModel = UserModel(climbCompleteList: [], commentList: [], likeMountainList: [], likePostList: [], postList: [], userInfo: userInfoModel);
    try{
      await FirebaseFirestore.instance.collection('UserInfo').doc(user.user!.uid).set(userModel.toJson());
      ref.read(userInfoProvider.notifier).state=userModel;
      navigatorKey.currentState!.pushNamedAndRemoveUntil(Routes.mainRoute, (route) => false);
    }
    catch(e){
      print(e.toString());
      Fluttertoast.showToast(msg: "유저 정보 등록 실패");
    }
  }

  @override
  setNotificationAgreeState(bool value) {
    ref.read(loginNotificationAgreeProvider.notifier).state=value;
  }
}
