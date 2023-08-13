import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mountain100/data/model/mountain/mountain_model.dart';
import 'package:mountain100/data/network/service/base_service.dart';
import 'package:mountain100/page/splash/splash_provider.dart';
import 'package:permission_handler/permission_handler.dart';

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
  getRecentMountainImage();
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

    @override
    getRecentMountainImage() async {
    print(";;;");
      print(ref.read(mainRecentClimbMountainListProvider));
      final image1 = await FirebaseStorage.instance.ref().child('mountain/${ref.read(mainRecentClimbMountainListProvider)[0]}/image1.jpg').getData();
      final image2 = await FirebaseStorage.instance.ref().child('mountain/${ref.read(mainRecentClimbMountainListProvider)[1]}/image1.jpg').getData();
    ref.read(mainRecentClimbMountainFirst.notifier).state=Image.memory(image1!,fit:BoxFit.fill,width: 200.w,height: 150.h,);
    ref.read(mainRecentClimbMountainSecond.notifier).state=Image.memory(image2!,fit:BoxFit.fill,width: 200.w,height: 150.h,);
  }

}
