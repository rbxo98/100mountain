import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mountain100/data/model/mountain/mountain_model.dart';
import 'package:mountain100/data/network/service/base_service.dart';

final mainProvider = Provider((ref) => MainPageProvider(ref: ref));
final mainPageIndex = StateProvider<int>((ref) => 0);
final mountainListProvider = StateProvider<List<MountainModel>>((ref) => []);
final mainTabControllerProvider = StateProvider.family<TabController,TickerProvider>((ref,vsync)=>TabController(length: 5, vsync: vsync));
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
      mountainList.fold((l) => Exception("Error"), (r) {
        ref.read(mountainListProvider.notifier).state=r;
      });
    }
    catch(e){
      print(e.toString());
      Fluttertoast.showToast(msg: "산 정보를 불러오는데 실패했습니다. 앱을 종료하고 잠시 후에 다시 실행해주세요.");
    }
  }


  // @override
  // setTap(int index) {
  //   ref.read(mainPageIndex.notifier).state = index;
  // }
}
