
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mountain100/app/app.dart';
import 'package:mountain100/page/splash/splash_provider.dart';

abstract class MyPageProviderInterface {
  setLogOut();
  setDeleteUser();
  getCountDown();
}

final myDeleteUserCountProvider = StateProvider.autoDispose<int>((ref) => 5);


final myPageProvider = Provider<MyPageProvider>((ref) => MyPageProvider(ref: ref));
class MyPageProvider with MyPageProviderInterface {
  final ProviderRef ref;
  MyPageProvider({required this.ref});

  @override
  setLogOut() async {
    try{
      FirebaseAuth.instance.signOut().then((value) {
        Fluttertoast.showToast(msg: "로그아웃 되었습니다.");
        SystemNavigator.pop(animated: true);
      });
    }
    catch(e){
      print(e.toString());
      Fluttertoast.showToast(msg: "로그아웃 중 오류가 발생했습니다.");
    }
  }

  @override
  setDeleteUser() async {
    try{
      print(ref.read(userCredentialProvider.notifier).state);
      await FirebaseFirestore.instance.collection('UserInfo').doc(ref.read(userCredentialProvider.notifier).state!.user!.uid).delete();
      await FirebaseAuth.instance.currentUser!.delete();
      Fluttertoast.showToast(msg: "회원탈퇴 되었습니다. 이용해주셔서 감사합니다.");
      SystemNavigator.pop(animated: true);
    }
    catch(e){
      print(e.toString());
      Fluttertoast.showToast(msg: "회원 탈퇴 중 오류가 발생했습니다.");
    }
  }

  @override
  getCountDown() async {
    for(int i=5;i>0;i--){
      ref.read(myDeleteUserCountProvider.notifier).state=i;
      Future.delayed(Duration(seconds: 1));
    }
  }

}