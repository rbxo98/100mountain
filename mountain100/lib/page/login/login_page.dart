import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mountain100/app/app.dart';
import 'package:mountain100/page/login/user_info_page.dart';
import 'package:mountain100/util/route_provier.dart';

import 'join_page.dart';
import 'login_provider.dart';

class LoginPage extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  late final LoginPageProvider provider;
  @override
  void initState() {
    provider = ref.read(loginProvider);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Mountain100",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 45.sp,color: Color(0xff07635D)),
                )),
            height: 200.h,
          ),
          TextField(
            decoration: InputDecoration(
                hintText: "이메일",
              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(width: 2)),
            ),
          ),

          Divider(height: 15.h,color: Colors.white,),

          TextField(
            obscureText: true,
            decoration: InputDecoration(
                hintText: "비밀번호",
              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(width: 2)),
            ),

          ),

          Divider(height: 15.h,color: Colors.white,),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.only(top: 15,bottom: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)
              ),
              backgroundColor: Color(0xff07635D)
            ),
              onPressed: () {},
              child: Text(
                "로그인",
                style: TextStyle(fontSize: 17.sp,fontWeight: FontWeight.bold),
              )),

          Divider(height: 15.h,color: Colors.white,),


          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(onPressed: () {}, child: Image.asset('assets/facebook.png'),style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black26 ,
                padding: EdgeInsets.only(left: 50,right: 50,top: 20,bottom: 20),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)
                ),
              ),),
              ElevatedButton(onPressed: provider.loginByGoogle, child: Image.asset('assets/google.png'),style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black26 ,
                  padding: EdgeInsets.only(left: 50,right: 50,top: 20,bottom: 20),
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)
                ),
    ),),
            ].map((e) => Padding(padding: EdgeInsets.only(left: 25,right: 25),child: e)).toList(),
          ),

          Divider(height: 15.h,color: Colors.white,),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: (){},
                  child: Text("회원가입",style: TextStyle(color: Color(0xff07635D)),)),
              TextButton(onPressed: () {}, child: Text("비밀번호 찾기",style: TextStyle(color: Color(0xff07635D)),)),
            ]
          )
        ].map((e) => Padding(padding: EdgeInsets.only(left: 15,right: 15),child: e,)).toList(),
      ),
    );
  }
}
