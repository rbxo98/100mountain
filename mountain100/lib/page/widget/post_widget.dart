import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mountain100/app/app.dart';
import 'package:mountain100/page/comunity/comunity_post_detail_page.dart';
import 'package:mountain100/page/splash/splash_provider.dart';

import '../../data/model/post/post_model.dart';

class PostWidget extends ConsumerWidget{
  late final PostModel model;
  PostWidget({required this.model});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userInfo = ref.read(userInfoProvider);
    return Padding(
      padding: const EdgeInsets.only(top: 15,left: 5,right: 5),
      child: InkWell(
        onTap: (){
          navigatorKey.currentState!.push(MaterialPageRoute(builder: (_)=>ComunityPostDetailPage(model: model)));
        },
        child: Container(
          padding: EdgeInsets.only(left: 15,right: 15,bottom: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color(0x10000000),
          ),
          child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(model.title,style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.bold),),


                    Row(children: [
                      Text(DateFormat('yyyy-MM-dd hh-mm')
                          .format(model.date), style: TextStyle(fontSize: 12.sp,color: Colors.black54),),
                      IconButton(onPressed: (){}, icon: Icon(Icons.menu),color: Colors.grey,splashRadius: 15.w,)
                    ],)
                  ],
                ),

                CarouselSlider(
                    items: [
                      Container(
                        color: Colors.green,
                        height: 70.h,
                      ),
                      Container(
                        color: Colors.red,
                        height: 70.h,
                      )
                    ],
                    options: CarouselOptions(
                      viewportFraction: 1,
                    )),

                Divider(height: 10,color: Color(0x00000000),),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    model.content.length>50?
                    model.content
                        .substring(0, 50) +
                        "...자세히보기":model.content,style: TextStyle(fontSize: 13.sp),),
                ),

                Align(
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    child: Text(model.content.length>50?"더보기":"자세히보기",style: TextStyle(color: Color(0x6F000000)),),
                  ),
                ),

                Divider(height: 15,color: Color(0x00000000),),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${model.writer}님 작성",style: TextStyle(color: Color(0x6F000000)),),
                    Row(children: [
                      Icon(Icons.thumb_up),
                      Container(width: 8,),
                      Text(model.like.length.toString(),style: TextStyle(color: Color(0x6F000000)),),
                    ],)
                  ],)
              ]
          ),
        ),
      ),
    );
  }

}