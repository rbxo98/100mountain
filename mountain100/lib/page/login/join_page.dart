import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mountain100/page/login/login_provider.dart';
import 'package:mountain100/util/route_provier.dart';

import '../../app/app.dart';

class JoinPage extends ConsumerStatefulWidget{
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>_JoinPageState();

}

class _JoinPageState extends ConsumerState<JoinPage>{
  late final LoginPageProvider provider;
  @override
  void initState() {
    provider = ref.read(loginProvider);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(
          color: Colors.black
        ),
        elevation: 0,
        leading: IconButton(onPressed: (){
          navigatorKey.currentState!.pop();
        },icon: Icon(Icons.chevron_left),),
      ),
      body: ListView(
        children: [
          Container(
            child: Align(
                alignment: Alignment.center,
                child: Text(
                  "회원 가입",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 45.sp,color:Color(0xff07635D)),
                  textAlign: TextAlign.center,
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

          TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: "비밀번호 확인",
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
              onPressed: () {
                navigatorKey.currentState!.pushNamedAndRemoveUntil(Routes.userinfoInput, (route) => false);
              },
              child: Text(
                "회원 가입",
                style: TextStyle(fontSize: 17.sp,fontWeight: FontWeight.bold),
              )),

          Divider(height: 15.h,color: Colors.white,),


        ].map((e) => Padding(padding: EdgeInsets.only(left: 15,right: 15),child: e,)).toList(),
      ),
    );
  }

}