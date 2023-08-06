import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mountain100/page/login/login_provider.dart';
import 'package:mountain100/page/main/main_page.dart';

import '../../app/app.dart';
import '../../util/route_provier.dart';

class UserInfoPage extends ConsumerStatefulWidget{
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserInfoPageState();

}

class _UserInfoPageState extends ConsumerState<UserInfoPage>{
  late final LoginPageProvider provider;
  TextEditingController _nicknameController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _telController = TextEditingController();
  @override
  void initState() {
    provider = ref.read(loginProvider);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final notificationAgree = ref.watch(loginNotificationAgreeProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("추가 정보 입력"),
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        children: [
          Divider(height: 15.h,color: Colors.white,),

          Text("* 표시된 항목은 필수 항목입니다."),

          Divider(height: 15.h,color: Colors.white,),

          TextField(
            controller: _nicknameController,
            decoration: InputDecoration(
              hintText: "* 닉네임 (2글자 이상)",
              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(width: 2)),
            ),
          ),

          Divider(height: 15.h,color: Colors.white,),
          
          TextField(
            controller: _addressController,

            decoration: InputDecoration(
              hintText: "주소",
              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(width: 2)),
            ),
          ),

          Divider(height: 15.h,color: Colors.white,),

          TextField(
            controller: _telController,
            decoration: InputDecoration(
              hintText: "전화번호 ( - 는 빼고 입력)",
              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(width: 2)),
            ),
          ),

          Divider(height: 15.h,color: Colors.white,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Text("알림 수신 동의"),
            Switch(value: notificationAgree, onChanged: provider.setNotificationAgreeState),
          ],),


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
                provider.setUserInfo(_nicknameController.text,address: _addressController.text,tel:_telController.text);
              },
              child: Text(
                "회원 가입 완료",
                style: TextStyle(fontSize: 17.sp,fontWeight: FontWeight.bold),
              )),

          Divider(height: 15.h,color: Colors.white,),
        ].map((e) => Padding(padding: EdgeInsets.only(left: 15,right: 15),child: e,)).toList(),
      ),
    );
  }

}