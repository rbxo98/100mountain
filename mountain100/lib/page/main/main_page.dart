import 'dart:typed_data';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:draggable_fab/draggable_fab.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:html/parser.dart';
import 'package:mountain100/app/app.dart';
import 'package:mountain100/data/model/mountain/mountain_model.dart';
import 'package:mountain100/data/network/service/base_service.dart';
import 'package:mountain100/page/comunity/comunity_page.dart';
import 'package:mountain100/page/info/info_provider.dart';
import 'package:mountain100/page/splash/splash_provider.dart';
import 'package:mountain100/util/route_provier.dart';
import '../../app/config/app_config.dart';
import '../info/info_page.dart';
import '../location/location_page.dart';
import '../my/my_page.dart';
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
    ComunityPage(),
    MyPage(),
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
      endDrawer: Drawer(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            automaticallyImplyLeading: false,
            centerTitle: false,
            title: Text("${userInfo!.userInfo.nickname}님 안녕하세요!"),
          ),
          body: ListView(
            children: [
              ListTile(
                title: Text("내 정보"),
                trailing: IconButton(
                  onPressed: () {
                    navigatorKey.currentState!.pop();
                    mainTabController.index = 4;
                    provider.setTap(4);
                  },
                  icon: Icon(Icons.chevron_right),
                ),
              ),
              ListTile(
                title: Text("기념품 신청"),
                trailing: IconButton(
                  onPressed: () {
                    navigatorKey.currentState!.pushNamed(Routes.applicantRoute);
                  },
                  icon: Icon(Icons.chevron_right),
                ),
              ),
              ListTile(
                title: Text("공지사항"),
                trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.chevron_right),
                ),
              ),
              ListTile(
                title: Text("FAQ"),
                trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.chevron_right),
                ),
              ),
              ListTile(
                title: Text("문의하기"),
                trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.chevron_right),
                ),
              ),
              ListTile(
                title: Text("설정"),
                trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.chevron_right),
                ),
              ),
              ListTile(
                title: Text("개인정보처리방침"),
                trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.chevron_right),
                ),
              ),
              ListTile(
                title: Text("내 인증서"),
                trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.chevron_right),
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "100대 명산 완등인증",
          style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        actions: [
          Builder(builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
              icon: Icon(Icons.format_list_bulleted_outlined),
              color: Colors.black,
            );
          }),
        ],
      ),
      body: Stack(children: [
        mainPages[pageIndex],
        DraggableFab(
            securityBottom: 150.h,
            child: FloatingActionButton(
                backgroundColor: Color(0xff07635D),
                child: Icon(
                  Icons.nfc,
                  size: 30.w,
                ),
                elevation: 5,
                onPressed: () {
                  navigatorKey.currentState!.pushNamed(Routes.nfcRoute);
                }))
      ]),
      bottomNavigationBar: Column(
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
              )),
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

class MainInnerPage extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainInnerPage();
}

class _MainInnerPage extends ConsumerState<MainInnerPage> {
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
    final mountainInfoLoad = ref.watch(isLoadingProvider);
    print(recentMountainInfo);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            mountainInfoLoad?Container():
            Container(
              color: Colors.red,
              child: Row(
                children: [
                  Text("산 정보를 불러오는 중입니다. 일부 기능이 동작하지 않을 수 있습니다. ",style: TextStyle(fontSize: 10.sp),),
                  SizedBox(
                      width:12,
                      height: 12,
                      child: CircularProgressIndicator(strokeWidth: 2,)),
                ],
              ),
            ),
            Divider(height: 15,color: Colors.white,),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.7),
                      blurRadius: 5.0,
                      offset: Offset(3, 10), // changes position of shadow
                    )
                  ]),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: CarouselSlider(
                    items: [
                      Container(
                        color: Colors.blue,
                        child: Text("Banner1"),
                        width: double.infinity,
                      ),
                      Container(
                        color: Colors.red,
                        child: Text("Banner2"),
                        width: double.infinity,
                      ),
                      Container(
                        color: Colors.green,
                        child: Text("Banner3"),
                        width: double.infinity,
                      ),
                    ],
                    options: CarouselOptions(
                      viewportFraction: 1,
                      height: 120.h,
                      autoPlay: true,
                    )),
              ),
            ),
            Divider(
              height: 30.h,
              color: Colors.white,
            ),
            InkWell(
              onTap: (){
                navigatorKey.currentState!.pushNamed(Routes.myMountainDetailRoute);
              },
              child: Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "내 인증 현황",
                          style: TextStyle(
                              fontSize: AppSettings.FONTSIZE_TITLE,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "자세히",
                          style: TextStyle(color: Colors.black54),
                        ),
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
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text(userInfo!.userInfo.nickname,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.sp,),),
                              ]
                                  .map((e) => Padding(
                                        padding:
                                            EdgeInsets.only(left: 5, right: 5),
                                        child: e,
                                      ))
                                  .toList(),
                            ),
                            Row(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.check_circle_outline,
                                      color: Colors.green,
                                    ),
                                    Text(
                                      "완료",
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Text(
                                  userInfo.climbCompleteList.length.toString(),
                                  style: TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.highlight_off_outlined,
                                      color: Colors.red,
                                    ),
                                    Text(
                                      "미완료",
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Text(
                                  (100 - userInfo.climbCompleteList.length)
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                              ]
                                  .map((e) => Padding(
                                        padding: EdgeInsets.only(left: 10),
                                        child: e,
                                      ))
                                  .toList(),
                            )
                          ]
                              .map((e) => Padding(
                                    padding: EdgeInsets.only(left: 10, right: 5),
                                    child: e,
                                  ))
                              .toList(),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Divider(
              height: 30.h,
              color: Colors.white,
            ),
            Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("최근 인증",
                          style: TextStyle(
                              fontSize: AppSettings.FONTSIZE_TITLE,
                              fontWeight: FontWeight.bold)),
                      Row(
                        children: [Text("더보기"), Icon(Icons.chevron_right)],
                      )
                    ],
                  ),

                  Container(
                    height: 200.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 2,
                        itemBuilder: (context,index){
                      return Container(
                        width: 150.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          ],
                        ),
                      );
                    }),
                  ),
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
