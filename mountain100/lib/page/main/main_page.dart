import 'dart:typed_data';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:html/parser.dart';
import 'package:mountain100/data/model/mountain/mountain_model.dart';
import 'package:mountain100/data/network/service/base_service.dart';
import 'package:mountain100/page/comunity/comunity_page.dart';
import 'package:mountain100/page/info/info_provider.dart';
import 'package:mountain100/page/splash/splash_provider.dart';
import '../../app/config/app_config.dart';
import '../info/info_page.dart';
import '../location/location_page.dart';
import 'main_provider.dart';


class MainPage extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage>
    with SingleTickerProviderStateMixin {
  late TabController mainTabController;
  late MainPageProvider provider;
  List<Widget> mainPages = [
    MainInnerPage(),
    LocationPage(),
    InfoPage(),
     ComunityPage()
  ];


  @override
  void initState() {
    provider = ref.read(mainProvider);
    mainTabController = ref.read(mainTabControllerProvider(this));
    provider.getMountainList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userInfo = ref.read(userInfoProvider);
    provider.getMountainList();
    final pageIndex = ref.watch(mainPageIndex);
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text("100대 명산 완등인증",style: TextStyle(color: Colors.black),),
          automaticallyImplyLeading: false,
          centerTitle: true,
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.format_list_bulleted_outlined),color: Colors.black,),
          ],
        ),
        body:  mainPages[pageIndex],
      bottomNavigationBar:  Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.maxFinite,
            height: 1,
            decoration: BoxDecoration(
              border: Border(
                  top: BorderSide(
                    width: 1,
                    color: AppColor.BottomNavigatorColor_Defalut,
                  )
              ),
              color: Colors.white,
            ),
          ),
          TabBar(
            onTap: provider.setTap,
            controller: mainTabController,
            tabs: [
              Container(
                child: Tab(
                  icon: Icon(Icons.home_outlined),
                  child: Text(
                    AppStrings.HOME,
                    style: TextStyle(
                      fontSize: 10.sp,
                    ),
                  ),
                ),
              ),
              Container(
                child: Tab(
                  icon: Icon(Icons.location_on_outlined),
                  child: Text(
                    AppStrings.MY_LOCATOIN,
                    style: TextStyle(
                      fontSize: 10.sp,
                    ),
                  ),
                ),
              ),
              Container(
                child: Tab(
                  icon: Icon(Icons.flag),
                  child: Text(
                    AppStrings.MOUNTAIN_INFO,
                    style: TextStyle(
                      fontSize: 10.sp,
                    ),
                  ),
                ),
              ),
              Container(
                child: Tab(
                  icon: Icon(Icons.people_outline),
                  child: Text(
                    AppStrings.COMUNITY,
                    style: TextStyle(
                      fontSize: 10.sp,
                    ),
                  ),
                ),
              ),
              Container(
                child: Tab(
                  icon: Icon(Icons.account_circle),
                  child: Text(
                    AppStrings.MYINFO,
                    style: TextStyle(
                      fontSize: 10.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
class MainInnerPage extends ConsumerStatefulWidget{
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>_MainInnerPage();

}

class _MainInnerPage extends ConsumerState<MainInnerPage>{
  late MainPageProvider provider;
  @override
  void initState() {
    provider = ref.read(mainProvider);
  }
  @override
  Widget build(BuildContext context) {
    final userInfo = ref.read(userInfoProvider);
    final mountainInfo = ref.read(mountainListProvider);
    final recentMountainInfo = ref.watch(mainRecentClimbMountainListProvider);
    print(recentMountainInfo);
    return SingleChildScrollView(
      child:Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.7),
                    blurRadius: 5.0,
                    offset: Offset(3, 10), // changes position of shadow
                  )
                ]
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: CarouselSlider(
                    items: [
                  Container(color:Colors.blue,child: Text("Banner1"),width: double.infinity,),
                  Container(color:Colors.red,child: Text("Banner2"),width: double.infinity,),
                  Container(color:Colors.green,child: Text("Banner3"),width: double.infinity,),
                ], options: CarouselOptions(
                  viewportFraction: 1,
                  height: 120.h,
                  autoPlay: true,
                )),
              ),
            ),

            Divider(height: 30.h, color: Colors.white,),

            Container(
              child:Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("내 인증 현황",style: TextStyle(fontSize: AppSettings.FONTSIZE_TITLE,fontWeight: FontWeight.bold),),
                      Text("자세히",style: TextStyle(color: Colors.black54),),
                    ],
                  ),

                  Container(
                    height: 70.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.7),
                          blurRadius: 5.0,
                          offset: Offset(3, 10), // changes position of shadow
                      ),
                      ]
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left:10,right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(),
                              Text(userInfo!.userInfo.nickname),
                            ].map((e) => Padding(padding: EdgeInsets.only(left: 5,right: 5),child: e,)).toList(),
                          ),

                          Row(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.check_circle_outline,color: Colors.green,),
                                  Text("완료",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
                                ],
                              ),
                              Text(userInfo.climbCompleteList.length.toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.highlight_off_outlined,color: Colors.red,),
                                  Text("미완료",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
                                ],
                              ),
                              Text((100-userInfo.climbCompleteList.length).toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                            ].map((e) => Padding(padding: EdgeInsets.only(left: 10),child: e,)).toList(),
                          )

                        ].map((e) => Padding(padding: EdgeInsets.only(left: 10,right: 5),child: e,)).toList(),
                      ),
                    ),

                  )

                ],
              ),
            ),

            Divider(height: 30.h,color: Colors.white,),

            Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("최근 인증",style: TextStyle(fontSize:AppSettings.FONTSIZE_TITLE,fontWeight: FontWeight.bold)),
                      Row(children: [Text("더보기"),Icon(Icons.chevron_right)],)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            ...recentMountainInfo.map((e) {
                              return Container();
                            }).toList()
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }


}

// ListTile(
//   isThreeLine: true,
//   title: Text(data['명산_이름']!),
//   subtitle: Text(data['명산_소재지']!),
//   trailing: Icon(Icons.chevron_right),
//   onTap: () {
//     ref.read(mountainProvider.notifier).state = MountainModel(
//         cordX: parse(data['X좌표']!).documentElement!.text,
//         cordY: parse(data['Y좌표']!).documentElement!.text,
//         transInfo: parse(data['X좌표']!).documentElement!.text,
//         difficult: parse(data['X좌표']!).documentElement!.text,
//         height: parse(data['X좌표']!).documentElement!.text,
//         location: parse(data['X좌표']!).documentElement!.text,
//         name: parse(data['X좌표']!).documentElement!.text,
//         description: parse(data['X좌표']!).documentElement!.text,
//         course: parse(data['X좌표']!).documentElement!.text,
//         point: parse(data['X좌표']!).documentElement!.text,
//         selectedReason: data['특징_및_선정_이유']!);
//     Navigator.of(context, rootNavigator: true)
//         .push(MaterialPageRoute(builder: (_) => InfoPage()));
//   },
// )
