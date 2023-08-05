import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mountain100/app/app.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

import '../main/main_provider.dart';
import '../splash/splash_provider.dart';
import 'comunity_write_post_provider.dart';

class WritePostpage extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WritePostpageState();
}

class _WritePostpageState extends ConsumerState<WritePostpage> {
  late final WritePostProvider provider;
  final titleController = TextEditingController();
  final contentController = TextEditingController();

  @override
  void initState() {
    provider = ref.read(writePostProvider);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final SSR = ref.watch(starValueProvider);
    final mountainList = ref.watch(mountainListProvider);
    final userInfo = ref.read(userInfoProvider);
    final itemValue = ref.watch(dropdownItemValueProvider);
    final selectDifficultValue = ref.watch(selectDifficultValueProvider);
    final imageList = ref.watch(imagePickerProvider);
    final imageListIndex = ref.watch(imagePickerIndexProvider);
    final selectDifficultColor = ref.watch(selectDifficultColorProvider);
    // final titleController = ref.watch(titleTextController);
    // final contentController = ref.watch(contentTextController);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              navigatorKey.currentState!.pop();
            },
            icon: Icon(Icons.chevron_left)),
        title: Text("후기 쓰기"),
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                style: TextStyle(fontSize: 18.sp),
                decoration: InputDecoration(
                    hintText: "제목",
                    contentPadding: EdgeInsets.only(left: 15, right: 15),
                    focusedBorder:
                        UnderlineInputBorder(borderSide: BorderSide(width: 2))),
                controller: titleController,
              ),
              Divider(
                height: 10.h,
                color: Colors.white,
              ),
              TextField(
                keyboardType: TextInputType.multiline,
                maxLines: 20,
                style: TextStyle(fontSize: 18.sp),
                decoration: InputDecoration(
                    hintText: "내용",
                    contentPadding: EdgeInsets.only(left: 15, right: 15),
                    focusedBorder:
                        UnderlineInputBorder(borderSide: BorderSide(width: 2))),
                controller: contentController,
              ),
              Divider(
                height: 15,
                color: Colors.white,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "산 종류",
                        style: TextStyle(
                            fontSize: 18.sp, fontWeight: FontWeight.bold),
                      ),
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
              Divider(
                height: 15,
                color: Colors.white,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "난이도",
                    style:
                        TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                  ),

                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          child: Icon(
                            Icons.sentiment_very_dissatisfied_outlined,
                            size: 45,
                            color: selectDifficultColor[4]?Colors.yellow:null,
                          ),
                          onTap: () {
                            provider.setDifficultState(4);
                          },
                        ),
                        InkWell(
                          child: Icon(
                            Icons.sentiment_dissatisfied_outlined,
                            size: 45,
                            color: selectDifficultColor[3]?Colors.yellow:null,
                          ),
                          onTap: () {
                            provider.setDifficultState(3);
                          },
                          ),
                        InkWell(
                          child: Icon(
                            Icons.sentiment_neutral_outlined,
                            size: 45,color: selectDifficultColor[2]?Colors.yellow:null,
                          ),
                          onTap: () {
                            provider.setDifficultState(2);
                          },
                        ),
                        InkWell(
                          child: Icon(
                            Icons.sentiment_satisfied_outlined,
                            size: 45,color: selectDifficultColor[1]?Colors.yellow:null,
                          ),
                          onTap: () {
                            provider.setDifficultState(1);
                          },
                        ),
                        InkWell(
                          child: Icon(
                            Icons.sentiment_very_satisfied_outlined,
                            size: 45,color: selectDifficultColor[0]?Colors.yellow:null,
                          ),
                          onTap: () {
                            provider.setDifficultState(0);
                          },
                        ),
                      ]),

                  Padding(
                    padding: const EdgeInsets.only(left: 5,right: 9),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("어려움"),
                        Text("쉬움")
                      ],),
                  ),
                ],
              ),
              Text("별점", style:
              TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),),

              RatingStars(
                  valueLabelVisibility: false,
                  starSize: 40.w,
                  value: SSR,
                  onValueChanged: provider.setStarRatingValueState),


              Text("사진", style:
              TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),),
              imageList.isEmpty?Container():
                  ListView.builder(
                    itemCount: imageList.length,
                      itemBuilder: (context,index){
                      final asset = imageList[index];
                      return AssetThumb(asset: asset, width: MediaQuery.of(context).size.width.toInt(), height: 100);
                      }
                  ),
              ElevatedButton(onPressed: provider.getImageFromGallery, child: Text("갤러리")),




              Align(alignment:Alignment.center,child: ElevatedButton(onPressed: (){}, child: Text("등록"))),
            ]
                .map((e) => Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: e,
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
