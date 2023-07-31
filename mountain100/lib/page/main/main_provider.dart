import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mountain100/data/model/mountain/mountain_model.dart';
import 'package:mountain100/data/network/service/base_service.dart';
import 'package:mountain100/page/splash/splash_provider.dart';

final mainProvider = Provider((ref) => MainPageProvider(ref: ref));
final mainPageIndex = StateProvider<int>((ref) => 0);
final mountainListProvider = StateProvider<List<MountainModel>>((ref) => []);
final mainTabControllerProvider = StateProvider.family<TabController,TickerProvider>((ref,vsync)=>TabController(length: 5, vsync: vsync));
final mainRecentClimbMountainListProvider = StateProvider<List<String?>>((ref) => []);
final mainRecentClimbMountainFirst = StateProvider<Image?>((ref)=>null);
final mainRecentClimbMountainSecond = StateProvider<Image?>((ref)=>null);
final BaseService baseService = BaseService();
abstract class MainPageProviderInterface {
  setTap(int index);
  getMountainList();
}

class MainPageProvider with MainPageProviderInterface {
  final ProviderRef ref;
  MainPageProvider({required this.ref});

  @override
  setTap(int index) {
    ref.read(mainPageIndex.notifier).state = index;
  }

  @override
  getMountainList() async {
    try{
      final mountainList =  await baseService.getMountainList(page: 1,perPage: 100);
      mountainList.fold((l){ Exception("Error"); print(l);}, (r) {
        ref.read(mountainListProvider.notifier).state=r;
      });
    }
    catch(e){
      print(e.toString());
      Fluttertoast.showToast(msg: "산 정보를 불러오는데 실패했습니다. 앱을 종료하고 잠시 후에 다시 실행해주세요.");
    }
  }

}
