import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart';
import 'package:mountain100/app/app.dart';
import 'package:mountain100/data/model/mountain/mountain_model.dart';
import 'package:mountain100/page/info/info_detail_provider.dart';
import 'package:mountain100/page/main/main_provider.dart';

class InfoDetailPage extends ConsumerStatefulWidget{
  late MountainModel model;
  InfoDetailPage({required this.model});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _InfoDetailPageState(model: model);

}

class _InfoDetailPageState extends ConsumerState<InfoDetailPage>{
  late MountainModel model;
  late final shortDescription;
  late final longDescription;
  late final InfoDetailProvider provider;
  _InfoDetailPageState({required this.model});

  @override
  void initState() {
    provider = ref.read(infoDetailProvider);
    provider.getMountainImage(model.name);
    shortDescription = parse(model.description).body!.text.split(']')[0].split('[')[1];
    longDescription = parse(model.description).body!.text.split(']')[1];
  }

  @override
  Widget build(BuildContext context) {
    final mountainImages = ref.watch(mountainImageListProvider);
    final mountainSSR = ref.watch(mountainSSRProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("${model.name} 정보"),
        automaticallyImplyLeading: false,
        leading: IconButton(onPressed: (){navigatorKey.currentState!.pop();},icon: Icon(Icons.chevron_left),color: Colors.black,),
      ),
      body: Container(
        child: ListView(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(40.h),
              child: CarouselSlider(//items: mountainImages,
                items: mountainImages,
                  options: CarouselOptions(
                    height: 250.h,
                viewportFraction: 1,
              )),
            ),

           Divider(height: 15.h,color: Colors.white,),

           Row(children: [
             Text(model.name,style: TextStyle(fontSize: 25.sp,fontWeight: FontWeight.bold),),
             Text(" - "),
             Text(shortDescription),
           ],),

            Row(
              children: [
              Row(
                children: [
                  Icon(Icons.star),
                  Text(mountainSSR.toString())
                ],
              ),

                Container(width: 15.w,),

                Row(children: [
                  Icon(Icons.location_on),
                  Text("12.8km")
                ],),


                Divider(height: 15.h,color: Colors.white,),


              ],),
            Text("교통 정보",style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.bold),),
            Text(model.transInfo),


            Divider(height: 15.h,color: Colors.white,),


            Text("높이",style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.bold),),
            Text(model.height+'m'),


            Divider(height: 15.h,color: Colors.white,),


            Text("소재지",style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.bold),),
            Text(model.location),


            Divider(height: 15.h,color: Colors.white,),


            Text("산 개요",style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.bold),),
            Text(longDescription),


            Divider(height: 15.h,color: Colors.white,),


            Text("산행 포인트",style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.bold),),
            Text(model.point),

            Divider(height: 15.h,color: Colors.white,),

            Text("특징 및 선정 이유",style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.bold),),
            Text(model.selectedReason),

            Divider(height: 15.h,color: Colors.white,),
          ].map((e) => Padding(padding: EdgeInsets.only(left:15,right: 15),child: e,)).toList(),
        ),
      ),
    );
  }

}