import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mountain100/app/app.dart';

import '../main/main_provider.dart';
import '../splash/splash_provider.dart';
import 'comunity_write_post_provider.dart';

class WritePostpage extends ConsumerStatefulWidget{
  @override
  ConsumerState<ConsumerStatefulWidget> createState()=>_WritePostpageState();

}

class _WritePostpageState extends ConsumerState<WritePostpage>{
  late final WritePostProvider provider;
  final titleController = TextEditingController();
  final contentController = TextEditingController();
  @override
  void initState() {
    provider=ref.read(writePostProvider);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final SSR=ref.watch(starValueProvider);
    final mountainList = ref.watch(mountainListProvider);
    final userInfo = ref.read(userInfoProvider);
    final itemValue = ref.watch(dropdownItemValueProvider);
    // final titleController = ref.watch(titleTextController);
    // final contentController = ref.watch(contentTextController);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading:
          IconButton(onPressed: (){
            navigatorKey.currentState!.pop();
          }, icon: Icon(Icons.chevron_left)),
        title: Text("후기 쓰기"),
        iconTheme: IconThemeData(
          color: Colors.black
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              TextField(
                style: TextStyle(
                  fontSize: 18.sp
                ),
                decoration: InputDecoration(
                  hintText: "제목",
                  contentPadding: EdgeInsets.only(left:15,right: 15),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(width: 2)
                  )
                ),
                controller: titleController,
              ),

              Divider(height: 10.h,color: Colors.white,),
              TextField(
                keyboardType: TextInputType.multiline,
                maxLines: 20,
                style: TextStyle(
                  fontSize: 18.sp
              ),
                decoration: InputDecoration(
                    hintText: "내용",
                    contentPadding: EdgeInsets.only(left:15,right: 15),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(width: 2)
                    )
                ),

                controller: contentController,
              ),

              Divider(height: 15,color: Colors.white,),

              Align(alignment:Alignment.centerLeft, child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("산 종류",style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.bold),),
                  SizedBox(
                    child: DropdownButton(
                      menuMaxHeight: 150.h,
                      isExpanded: true,
                        value: itemValue,
                        items: mountainList
                            .map((e) => DropdownMenuItem(
                          child: Text(e.name),
                          value: e.name,
                        ))
                            .toList(),
                        onChanged: provider.setDropDownState),
                  ),
                ],
              )),

              Divider(height: 15,color: Colors.white,),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("난이도",style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.bold),),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.sentiment_very_dissatisfied_outlined,size: 45,),
                        Icon(Icons.sentiment_dissatisfied_outlined,size: 45,),
                        Icon(Icons.sentiment_neutral_outlined,size: 45,),
                        Icon(Icons.sentiment_satisfied_outlined,size: 45,),
                        Icon(Icons.sentiment_very_satisfied_outlined,size: 45,),

                      ]),
                ],
              ),

              Text("별점"),
              RatingStars(
                  valueLabelVisibility: false,
                  starSize: 30.w,
                  value: SSR,
                  onValueChanged: provider.setStarRatingValueState
              ),

              Text("사진")
            ].map((e) => Padding(padding: EdgeInsets.only(left:20,right: 20),child: e,)).toList(),
          ),
        ),
      ),
    );
  }

}