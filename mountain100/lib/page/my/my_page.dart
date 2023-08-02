import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mountain100/app/app.dart';
import 'package:mountain100/page/my/my_provider.dart';
import 'package:mountain100/page/splash/splash_provider.dart';

class MyPage extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyPageState();

}

class _MyPageState extends ConsumerState<MyPage> {
  late final MyPageProvider provider;

  @override
  void initState() {
    provider = ref.read(myPageProvider);
  }

  @override
  Widget build(BuildContext context) {
    final userInfo = ref.read(userInfoProvider);
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text("회원정보 수정"),
            trailing: IconButton(
                onPressed: () {}, icon: Icon(Icons.chevron_right)),
          ),
          ListTile(
            title: Text("알림 설정"),
            trailing: IconButton(
                onPressed: () {}, icon: Icon(Icons.chevron_right)),
          ),
          ListTile(
            title: Text("내 스탬프 목록"),
            trailing: IconButton(
                onPressed: () {}, icon: Icon(Icons.chevron_right)),
          ),
          ListTile(
            title: Text("내 글 목록"),
            trailing: IconButton(
                onPressed: () {}, icon: Icon(Icons.chevron_right)),
          ),
          ListTile(
            title: Text("공지사항"),
            trailing: IconButton(
                onPressed: () {}, icon: Icon(Icons.chevron_right)),
          ),
          ListTile(
            title: Text("로그아웃"),
            trailing: IconButton(onPressed: () {
              showDialog(context: context, builder: (BuildContext context) {
                return Center(
                  child: Container(
                      color: Colors.white,
                      width: 270.w,
                      height: 120.h,
                      child: Scaffold(
                        body: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("로그아웃 하시겠습니까?", style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17.sp),),
                              Divider(height: 15, color: Colors.white,),
                              Text("로그아웃 시 앱이 종료됩니다."),
                            ],),
                        ),
                        bottomNavigationBar: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(onPressed: () {
                              navigatorKey.currentState!.pop();
                            }, child: Text("취소")),
                            TextButton(onPressed: provider.setLogOut,
                                child: Text("로그아웃"))
                          ],),
                      )
                  ),
                );
              });
            }, icon: Icon(Icons.chevron_right)),
          ),
          ListTile(
            title: Text("회원 탈퇴"),
            trailing: IconButton(onPressed: () {
              showDialog(context: context, builder: (BuildContext context) {
                return Center(
                  child: Container(
                      color: Colors.white,
                      width: 270.w,
                      height: 120.h,
                      child: Scaffold(
                        body: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("회원탈퇴 하시겠습니까?", style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17.sp),),
                              Divider(height: 15, color: Colors.white,),
                              Text("탈퇴 시 삭제된 정보는 복구할 수 없습니다."),
                            ],),
                        ),
                        bottomNavigationBar: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(onPressed: () {
                              navigatorKey.currentState!.pop();
                            }, child: Text("취소")),
                            FutureBuilder(
                                future: Future.delayed(Duration(seconds: 5),(){return true;}),
                                builder: (context, asyncSnapshot) {
                                  print(asyncSnapshot.data);
                                  if (asyncSnapshot.hasData){
                                    return TextButton(onPressed: provider.setDeleteUser,
                                        child: Text("회원탈퇴"));
                                  }
                                  else{
                                    return Text("5초 후 표시됩니다.",
                                      style: TextStyle(color: Colors.red,),);
                                  }
                                }),
                          ],),
                      )
                  ),
                );
              });
            }, icon: Icon(Icons.chevron_right)),
          ),


        ],
      ),
    );
  }

}