import 'package:flutter/material.dart';
import 'package:mountain100/page/applicant/applicant_page.dart';
import 'package:mountain100/page/comunity/comunity_page.dart';
import 'package:mountain100/page/comunity/comunity_write_post_page.dart';
import 'package:mountain100/page/login/join_page.dart';
import 'package:mountain100/page/login/term_page.dart';
import 'package:mountain100/page/my/my_mountain_detail_page.dart';
import 'package:mountain100/page/nfc/nfc_page.dart';

import '../page/location/location_page.dart';
import '../page/login/login_page.dart';
import '../page/login/user_info_page.dart';
import '../page/main/main_page.dart';
import '../page/splash/splash_page.dart';

class Routes{
  static const String splashRoute = "/splash";
  static const String loginRoute = "/login";
  static const String joinRoute = "/login/join";
  static const String termRoute = "/login/term";
  static const String userinfoInput = "/userinfoInput";
  static const String mainRoute = "/main";
  static const String applicantRoute = "/applicant";
  static const String nfcRoute = "/main/nfc";
  static const String mapRoute = "/location";
  static const String comunityRoute = "/comunity";
  static const String writePostRoute = "/comunity/writePost";
  static const String myMountainDetailRoute = "/main/myMountainDetail";

}

class RouteGenerator{
  static Route<dynamic> getRoute(RouteSettings routeSettings){
    switch(routeSettings.name){
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_)=>SplashPage());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_)=>LoginPage());
      case Routes.termRoute:
        return MaterialPageRoute(builder: (_)=>TermPage());
      case Routes.joinRoute:
        return MaterialPageRoute(builder: (_)=>JoinPage());
      case Routes.myMountainDetailRoute:
        return MaterialPageRoute(builder: (_)=>MyMountainDetailPage());
      case Routes.userinfoInput:
        return MaterialPageRoute(builder: (_)=>UserInfoPage());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_)=>MainPage());
      case Routes.applicantRoute:
        return MaterialPageRoute(builder: (_)=>ApplicantPage());
      case Routes.nfcRoute:
        return MaterialPageRoute(builder: (_)=>NfcPage());
      case Routes.mapRoute:
        return MaterialPageRoute(builder: (_)=>LocationPage());
      case Routes.comunityRoute:
        return MaterialPageRoute(builder: (_)=>ComunityPage());
      case Routes.writePostRoute:
        return MaterialPageRoute(builder: (_)=>WritePostpage());
    // case Routes.cmListRoute:
    //   return CustomMaterialPageRoute(builder:(_)=>CmListPage());
      default:
        return MaterialPageRoute(builder: (_)=>Scaffold(body: Container(),));
    }
  }
}