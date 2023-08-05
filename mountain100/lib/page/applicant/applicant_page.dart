import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
      body: Column(
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("신청 종류"),
                Row(
                  children: [
                    // Checkbox(value: applicantSouvenir, onChanged: (value){
                    //   setState(() {
                    //   applicantSouvenir=value!;
                    // });}),
                    Text("기념품"),
                  ],
                ),

                Row(
                  children: [
                    // Checkbox(value: appliCertification, onChanged: (value){}),
                    Text("인증서"),
                  ],
                ),
              ],
            ),
          ),
          
          Container(
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("이름"),
                TextField(),
              ],
            ),
          ),

          Container(
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("주소"),
                TextField(),
              ],
            ),
          ),

          Container(
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("상세주소"),
                TextField(),
              ],
            ),
          ),

          Container(
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("연락처"),
                TextField(),
              ],
            ),
          ),

          ElevatedButton(onPressed: provider.setApplicant, child: Text("신청")),
        ],
      ),
    );
  }

}