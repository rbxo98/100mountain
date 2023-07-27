import 'package:flutter/material.dart';

import '../page/login/login_page.dart';
import '../page/main/main_page.dart';
import '../page/splash/splash_page.dart';

class Routes{
  static const String splashRoute = "/";
  static const String loginRoute = "/login";
  static const String mainRoute = "/main";

}

class RouteGenerator{
  static Route<dynamic> getRoute(RouteSettings routeSettings){
    switch(routeSettings.name){
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_)=>SplashPage());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_)=>LoginPage());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_)=>MainPage());
    // case Routes.cmListRoute:
    //   return CustomMaterialPageRoute(builder:(_)=>CmListPage());
      default:
        return MaterialPageRoute(builder: (_)=>Scaffold(body: Container(),));
    }
  }
}