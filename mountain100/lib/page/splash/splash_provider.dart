import 'package:flutter_riverpod/flutter_riverpod.dart';

final splashProvider =  Provider((ref)=>SplashProvider(ref:ref));

abstract class SplashProviderInterface{
  //init();
  getMountainList();
}

class SplashProvider with SplashProviderInterface{
  final ProviderRef ref;

  SplashProvider({required this.ref});

  @override
  getMountainList() {

  }

  // @override
  // init() async{
  //   await ConfigProvider.getConfigList();
  //   await getBanner();
  //   final email = await prefProvider.getEmail();
  //   final userService = ref.read(userServiceProvider);
  //   String currentVersion = Platform.isAndroid?ConfigProvider.currentVersionAOS:ConfigProvider.currentVersionIOS;
  //   (await userService.login(email, Config.currentVersion)).fold((l) {
  //     //TODO: 오류 피드백 메시지
  //     Future.delayed(Duration(milliseconds: 2 * 1000), () {
  //       navigatorKey.currentState?.pushNamedAndRemoveUntil(
  //           Routes.loginRoute, (route) => false);
  //       checkVersion(currentVersion);
  //     });
  //   }, (r) async {
  //     if (r.active) {
  //       ref
  //           .read(userModelProvider.notifier)
  //           .state = r;
  //       String? token = await ref.read(pushModule).getToken();
  //       if (token != null) {
  //         ref.read(pushModule).updateTokenToDB(token: token);
  //       }
  //     }
  //     Future.delayed(Duration(milliseconds: 2 * 1000), () {
  //       if (r.active == false) {
  //         showCustomOkDialog(
  //             "회원탈퇴퇸 아이디입니다.\n확인 버튼을 누르면 로그인 페이지로 이동합니다.", okFunc: () {
  //           navigatorKey.currentState?.pushNamedAndRemoveUntil(
  //               Routes.loginRoute, (route) => false);
  //         }
  //         );
  //       } else {
  //         if((PushModule.pageName??"")!="MainPage") {
  //           navigatorKey.currentState?.pushNamedAndRemoveUntil(
  //               Routes.mainRoute, (route) => false);
  //         }
  //         checkVersion(currentVersion);
  //       }
  //     });
  //   });
  // }

  // void checkVersion(String currentVersion){
  //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
  //     if(currentVersion!=Config.currentVersion) {
  //       showCustomDialog("새로운 버전이 있습니다.\n업데이트하시겠습니까?", "업데이트", () async {
  //         await StoreRedirect.redirect(
  //             androidAppId: Config.aosPackageName, iOSAppId: Config.iosAppId);
  //         if (Platform.isIOS) {
  //           exit(0);
  //         } else {
  //           SystemNavigator.pop();
  //         }
  //       },
  //           cancelTxt: "취소",
  //           canClose: true,
  //           middleMessage:ConfigProvider.updateMessage
  //       );
  //     }
  //   });
  // }

}
