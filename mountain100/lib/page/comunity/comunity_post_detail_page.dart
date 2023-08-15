import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mountain100/app/app.dart';
import 'package:mountain100/page/splash/splash_provider.dart';

import '../../data/model/post/post_model.dart';
import 'comunity_post_detail_provider.dart';

class ComunityPostDetailPage extends ConsumerStatefulWidget {
  late final PostModel model;

  ComunityPostDetailPage({required this.model});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ComunityPostDetailPage(model: model);
}

class _ComunityPostDetailPage extends ConsumerState<ComunityPostDetailPage> {
  late final PostModel model;
  late final ComunityPostDetailProvider provider;

  _ComunityPostDetailPage({required this.model});
  @override
  void initState() {
    provider = ref.read(comunityProvider);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userInfo = ref.read(userInfoProvider);
    final thumbColor = ref.watch(thumbColorProvider);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text("자세히보기"),
        leading: IconButton(
          onPressed: () {
            navigatorKey.currentState!.pop();
          },
          icon: Icon(Icons.chevron_left,color: Colors.black,),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: ListView(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "닉네임",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Text(
                    "2023-08-13",
                    style: TextStyle(color: Colors.black45),
                  ),
                ],
              ),
            ),
            Text(
              model.title,
              style: TextStyle(
                fontSize: 23.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Divider(
              height: 15.h,
              color: Colors.white,
            ),
            CarouselSlider(items: [
              Container(
                height: 200.h,
                child: Text("사진 영역"),
              )
            ], options: CarouselOptions()),
            Divider(
              height: 15.h,
              color: Colors.white,
            ),
            Text(
              model.content,
              style: TextStyle(fontSize: 17.sp),
            ),
            Divider(
              height: 15.h,
              color: Colors.white,
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(2),
                  color: model.SSR == 5
                      ? Colors.green
                      : model.SSR == 4
                          ? Colors.blue
                          : model.SSR > 3
                              ? Colors.yellow
                              : model.SSR == 2
                                  ? Colors.deepOrange
                                  : Colors.red,
                  child: model.SSR == 5
                      ? Text("별점 5점, 등산 필수!")
                      : model.SSR == 4
                          ? Text("별점 4점, 좋아요!")
                          : model.SSR > 3
                              ? Text("별점 3점, 나쁘지 않아요")
                              : model.SSR == 2
                                  ? Text("별점 2점, 천천히 가도 돼요")
                                  : Text("별점 1점, 별로였어요"),
                ),
                // 난이도 데이터
                // Container(
                //   color: model.SSR == 5
                //       ? Colors.green
                //       : model.SSR == 4
                //           ? Colors.blue
                //           : model.SSR > 3
                //               ? Colors.yellow
                //               : model.SSR == 2
                //                   ? Colors.deepOrange
                //                   : Colors.red,
                //   child: model.SSR == 5
                //       ? Text("별점 5점, 등산 필수!")
                //       : model.SSR == 4
                //           ? Text("별점 4점, 좋아요!")
                //           : model.SSR > 3
                //               ? Text("별점 3점, 나쁘지 않아요")
                //               : model.SSR == 2
                //                   ? Text("별점 2점, 천천히 가도 돼요")
                //                   : Text("별점 1점, 별로였어요"),
                // )
              ],
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: (){
                          provider.setThumbUp(model);
                        },
                        child:
                            Icon(
                                Icons.thumb_up,
                              color: thumbColor,
                            ),
                      ),
                      Text(model.like.length.toString()),
                    ],
                  ),

                  Row(
                    children: [
                      Icon(Icons.comment),
                      Text(model.comment.length.toString()),
                    ],
                  ),
                ].map((e) => Padding(padding: EdgeInsets.only(right: 15,),child: e,)).toList(),
              ),
              ElevatedButton(
                child: Text(
                  "추천",
                  style: TextStyle(fontSize: 10.sp),
                ),
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black26,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
              Divider(
                height: 15.h,
                color: Colors.white,
              ),
              Container(
                child: Column(
                  children: [
                    // ...model.comment.map((e) {return
                    Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(color: Colors.black12, width: 1))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "작성자",
                                style: TextStyle(
                                    fontSize: 15.sp, fontWeight: FontWeight.bold),
                              ),
                              InkWell(child: Icon(Icons.menu)),
                            ],
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          ),
                          Text("내용"),
                          Divider(
                            height: 10.h,
                            color: Colors.white,
                          ),
                          Text("2023-08-13"),
                        ],
                      ),
                    )
                    // ;}).toList(),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    // ...model.comment.map((e) {return
                    Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom:
                              BorderSide(color: Colors.black12, width: 1))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "작성자",
                                style: TextStyle(
                                    fontSize: 15.sp, fontWeight: FontWeight.bold),
                              ),
                              InkWell(child: Icon(Icons.menu)),
                            ],
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          ),
                          Text("내용"),
                          Divider(
                            height: 10.h,
                            color: Colors.white,
                          ),
                          Text("2023-08-13"),
                        ],
                      ),
                    )
                    // ;}).toList(),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    // ...model.comment.map((e) {return
                    Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom:
                              BorderSide(color: Colors.black12, width: 1))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "작성자",
                                style: TextStyle(
                                    fontSize: 15.sp, fontWeight: FontWeight.bold),
                              ),
                              InkWell(child: Icon(Icons.menu)),
                            ],
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          ),
                          Text("내용"),
                          Divider(
                            height: 10.h,
                            color: Colors.white,
                          ),
                          Text("2023-08-13"),
                        ],
                      ),
                    )
                    // ;}).toList(),
                  ],
                ),
              ),
            ])
          ]
              .map(
                (e) => Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: e,
                ),
              )
              .toList(),
        ),
      ),
      bottomNavigationBar: Container(
          padding: EdgeInsets.all(10),
          height: 40.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                flex: 9,
                child: TextField(
                  cursorColor: Color(0xff07635D),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.black12,
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              ),
              Flexible(
                  flex: 1,
                  child: IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () {},
                    splashRadius: 10,
                    color: Color(0xff07635D),
                  ))
            ],
          )),
    );
  }
}
