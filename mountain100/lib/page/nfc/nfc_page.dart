import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mountain100/app/app.dart';
import 'package:mountain100/page/main/main_provider.dart';
import 'package:mountain100/page/splash/splash_provider.dart';
import 'package:nfc_manager/nfc_manager.dart';

import '../../data/model/user/user_model.dart';

class NfcPage extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NfcPageState();
}

final data = {
  'nfca': {
    'identifier': [4, 35, 157, 234, 192, 116, 128],
    'atqa': [68, 0],
    'maxTransceiveLength': 253,
    'sak': 0,
    'timeout': 618
  },
  'mifareultralight': {
    'identifier': [4, 35, 157, 234, 192, 116, 128],
    'maxTransceiveLength': 253,
    'timeout': 618,
    'type': 2
  },
  'ndef': {
    'identifier': [4, 35, 157, 234, 192, 116, 128],
    'isWritable': true,
    'maxSize': 137,
    'canMakeReadOnly': true,
    'cachedMessage': null,
    'type': 'org.nfcforum.ndef.type2'
  }
};
final data2 = {
  'nfca': {
    'identifier': [4, 75, 157, 234, 192, 116, 128],
    'atqa': [68, 0],
    'maxTransceiveLength': 253,
    'sak': 0,
    'timeout': 618
  },
  'mifareultralight': {
    'identifier': [4, 75, 157, 234, 192, 116, 128],
    'maxTransceiveLength': 253,
    'timeout': 618,
    'type': 2
  },
  'ndef': {
    'identifier': [4, 75, 157, 234, 192, 116, 128],
    'isWritable': true,
    'maxSize': 137,
    'canMakeReadOnly': true,
    'cachedMessage': {
      'records': [
        {
          'typeNameFormat': 1,
          'type': [84],
          'identifier': [],
          'payload': [
            2,
            101,
            110,
            234,
            176,
            128,
            235,
            166,
            172,
            236,
            153,
            149,
            236,
            130,
            176
          ]
        }
      ]
    },
    'type': ' org.nfcforum.ndef.type2'
  }
};

class _NfcPageState extends ConsumerState<NfcPage> {
  @override
  void initState() {
    super.initState();
    NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
      List<int> rowData = tag
          .data['ndef']['cachedMessage']['records'][0]['payload'];
      final mountainName = utf8.decode(rowData.sublist(2));
      final checkMountainName = await FirebaseFirestore.instance.collection('mountainInfo').doc(mountainName).get();
      if (checkMountainName.data()!=null){
        final uid = ref.read(userCredentialProvider)!.user!.uid;
        final user = ref.read(userInfoProvider);
        FirebaseFirestore.instance.collection('UserInfo').doc(uid).set({
          'climbCompleteList':[...user!.climbCompleteList,mountainName]
        }).then((value) {
          UserModel model = user.copyWith(climbCompleteList: [mountainName,...user.climbCompleteList]);
          ref.watch(userInfoProvider.notifier).state=model;
          Fluttertoast.showToast(msg: "스탬프 적립!");
          navigatorKey.currentState!.pop();
        });
      }
    });

  }

  @override
  void dispose() {
    super.dispose();
    NfcManager.instance.stopSession();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "NFC 태그",
          style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            color: Colors.black,
          ),
          onPressed: () {
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
              Icon(
                Icons.nfc,
                size: 200.w,
              ),
              Text(
                "주변의 NFC태그를 찾아 태그 해주세요!",
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
