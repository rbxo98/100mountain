import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../util/route_provier.dart';
import 'config/app_config.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,

        ),
        tabBarTheme: TabBarTheme(
            labelColor: AppColor.BottomNavigatorColor_Selected,
            unselectedLabelColor: AppColor.BottomNavigatorColor_Defalut,
            labelStyle: TextStyle(color: AppColor.BottomNavigatorColor_Defalut), // color for text
            indicator: null),
      ),
      navigatorKey: navigatorKey,
      initialRoute: Routes.splashRoute,
      onGenerateRoute: RouteGenerator.getRoute,
        builder: (ctx,widget){
          ScreenUtil.init(ctx,designSize: Size(360,640));
          return widget!;
        }
    );
  }
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyHomePage extends ConsumerStatefulWidget{
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>_MyHomePageState();

}

class _MyHomePageState extends ConsumerState<MyHomePage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}