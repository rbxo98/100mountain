import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mountain100/app/app.dart';
import 'package:mountain100/main.dart';
import 'package:mountain100/page/comunity/comunity_provider.dart';
import 'package:mountain100/page/comunity/comunity_write_post_page.dart';
import 'package:mountain100/page/main/main_provider.dart';
import 'package:mountain100/page/splash/splash_provider.dart';
import 'package:mountain100/page/widget/post_widget.dart';
import 'package:mountain100/util/route_provier.dart';

class ComunityPage extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ComunityPageState();
}

class _ComunityPageState extends ConsumerState<ComunityPage> {
  late final ComunityProvider provider;

  @override
  void initState() {
    provider = ref.read(comunityProvider);
    provider.getPostListByMountainName(ref.read(dropdownItemValueProvider.notifier).state);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mountainList = ref.watch(mountainListProvider);
    final userInfo = ref.read(userInfoProvider);
    final itemValue = ref.watch(dropdownItemValueProvider);
    final postList = ref.watch(postListProivder);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DropdownButton(
                      value: itemValue,
                      items: mountainList
                          .map((e) => DropdownMenuItem(
                                child: Text(e.name),
                                value: e.name,
                              ))
                          .toList(),
                      onChanged: provider.getPostListByMountainName),
                  Row(
                    children: [
                      Text(
                        "내 활동 ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        userInfo!.postList.length.toString(),
                        style: TextStyle(
                            color: Colors.amber, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              height: 15,
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Text("$itemValue 등산 후기",
                    style: TextStyle(
                        fontSize: 18.sp, fontWeight: FontWeight.bold))),

            Divider(
              height: 15,
            ),

            NotificationListener<ScrollNotification>(
              onNotification: (notification) {
                return false;
              },
              child: Expanded(
                child: ListView(
                    //controller: scrollController,
                    children: postList.isEmpty?[Container(
                      child: Center(
                        child: Text("$itemValue에 대한 등산 후기가 없습니다."),
                      ),
                      height: 400.h,
                    )]:postList.map((e) => PostWidget(model: e)).toList()
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 30,right: 30,bottom: 15),
        child: ElevatedButton(
            onPressed: () {
              navigatorKey.currentState?.push(MaterialPageRoute(builder: (_)=>WritePostpage()));
            },
            child: Text("글쓰기",style: TextStyle(fontSize: 15.sp,color: Colors.black,fontWeight: FontWeight.bold),),
        style: ElevatedButton.styleFrom(
          elevation: 6,
          backgroundColor: Color(0xFFF3F384),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          )
        ),),
      ),
    );
  }
}
