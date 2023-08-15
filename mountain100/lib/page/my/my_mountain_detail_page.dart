import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mountain100/app/app.dart';
import 'package:mountain100/page/info/info_detail_page.dart';
import 'package:mountain100/page/info/info_page.dart';
import 'package:mountain100/page/splash/splash_provider.dart';

import '../main/main_provider.dart';

class MyMountainDetailPage extends ConsumerStatefulWidget{
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>_MyMountainDetailPageState();

}

class _MyMountainDetailPageState extends ConsumerState<MyMountainDetailPage>{
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final mountainList = ref.read(mountainListProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("내 인증 현황"),
        automaticallyImplyLeading: false,
        leading: IconButton(onPressed: navigatorKey.currentState!.pop,icon: Icon(Icons.chevron_left,color: Colors.black,),),
      ),
      body: SafeArea(
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
                  mainAxisSpacing: 10,
            crossAxisSpacing: 10
          ),
          children: [
            ...mountainList.keys.map((e) {
              return InkWell(
                onTap: (){
                  navigatorKey.currentState!.push(MaterialPageRoute(builder: (_)=>InfoDetailPage(model: e)));
                },
                child: Container(
                  child: Column(
                    children: [
                      Text(e.name),
                      Image.memory(mountainList[e]![0],fit:BoxFit.cover,width: 100,height: 100,
                        color: ref.read(userInfoProvider)!.climbCompleteList.contains(e.name)?null:Colors.grey,
                        colorBlendMode: ref.read(userInfoProvider)!.climbCompleteList.contains(e.name)?null:BlendMode.saturation,),
                    ],
                  ),
                ),
              );
            }).toList(),
          ]
        ),
      ),
    );
  }

}