import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mountain100/app/app.dart';
import 'package:nfc_manager/nfc_manager.dart';

class NfcPage extends ConsumerStatefulWidget{
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NfcPageState();
}

class _NfcPageState extends ConsumerState<NfcPage>{

  @override
  void initState() {
    super.initState();
    NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
      FirebaseFirestore.instance.collection("NFCTestCollection").doc('test').set({
        "test":"success"
      });
      print(tag.data);
    });
  }

  @override
  void dispose() {
    super.dispose();
    NfcManager.instance.stopSession();
    print(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NFC 태그",style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.bold,color: Colors.black),),
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.chevron_left,color: Colors.black,),
          onPressed: (){
            navigatorKey.currentState!.pop();
          },
        ),

      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            Icon(Icons.nfc,size: 200.w,),
            Text("주변의 NFC태그를 찾아 태그 해주세요!",style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.bold),)
          ],),
        ),
      ),
    );
  }

}