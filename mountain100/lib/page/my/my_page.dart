import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyPage extends ConsumerStatefulWidget{
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>_MyPageState();

}

class _MyPageState extends ConsumerState<MyPage>{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("마이페이지",style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.bold),),


        ],
      ),
    );
  }

}