import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mountain100/app/app.dart';
import 'package:mountain100/page/splash/splash_provider.dart';

import 'applicant_provider.dart';

class ApplicantPage extends ConsumerStatefulWidget{
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ApplicantPageState();

}

class _ApplicantPageState extends ConsumerState<ApplicantPage>{
  late final ApplicantPageProvider provider;
  @override
  void initState() {
    provider = ref.read(applicantProvider);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final userInfo = ref.watch(userInfoProvider);
    final checkSouvenirStatus = ref.watch(applicantCheckSouvenirProvider);
    final checkCertificationStatus = ref.watch(applicantCheckCertificationProvider);
    final nameController = ref.watch(applicantNameTextControllerProvider);
    final addressController = ref.watch(applicantAddressTextControllerProvider);
    final addressDetailController = ref.watch(applicantAddressDetailTextControllerProvider);
    final telController = ref.watch(applicantTelTextControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("기념품 신청"),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.chevron_left,color: Colors.black,),
          onPressed: (){
            navigatorKey.currentState!.pop();
          },
        ),
      ),
      body: ListView(
        children: [
          Divider(height: 15,color: Colors.white,),

          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("신청 종류",style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.bold),),
                Row(
                  children: [
                    Checkbox(value: checkSouvenirStatus, onChanged: provider.setSouvState),
                    Text("기념품"),
                  ],
                ),

                Row(
                  children: [
                    Checkbox(value: checkCertificationStatus, onChanged: provider.setCertState),
                    Text("인증서"),
                  ],
                ),
              ],
            ),
          ),
          
          TextField(
            controller: nameController,
            decoration: InputDecoration(
              hintText: "이름",
              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(width: 2)),
            ),
          ),

          Divider(height: 15,color: Colors.white,),

          TextField(
            controller: addressController,
            decoration: InputDecoration(
              hintText: "주소",
              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(width: 2)),
            ),
          ),

          Divider(height: 15,color: Colors.white,),

          TextField(
            controller: addressDetailController,
            decoration: InputDecoration(
              hintText: "상세 주소",
              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(width: 2)),
            ),
          ),

          Divider(height: 15,color: Colors.white,),

          TextField(
            controller: telController,
            maxLength: 11,
            decoration: InputDecoration(
              hintText: "연락처",
              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(width: 2)),
            ),
          ),

          Divider(height: 15,color: Colors.white,),
 
          ElevatedButton(
              onPressed: provider.setApplicant,
              child: Text("신청",style: TextStyle(fontSize: 15.sp,color: Colors.black,fontWeight: FontWeight.bold),),
            style: ElevatedButton.styleFrom(
                elevation: 6,
                backgroundColor: Color(0xFFF3F384),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                )
            ),
          ),
        ].map((e) => Padding(padding: EdgeInsets.only(left: 15.w,right: 15.w),child: e,)).toList(),
      ),
    );
  }

}