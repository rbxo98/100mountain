import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mountain100/data/model/mountain/mountain_model.dart';
import 'package:mountain100/page/main/main_provider.dart';

final infoProvider = Provider((ref) => InfoPageProvider(ref: ref));
final infoPageIndex = StateProvider<int>((ref) => 0);
final infoTextControllerProvider = StateProvider<TextEditingController>((ref)=>TextEditingController());
final infoSearchSortedProvider = StateProvider<List<MountainModel>>((ref)=>ref.read(mountainListProvider).keys.toList());
final infoTabControllerProvider = StateProvider.family<TabController,TickerProvider>((ref,vsync)=>TabController(length: 3, vsync: vsync));

abstract class InfoPageProviderInterface {
  setTap(int index);
  filterByKeyword(String keyword);
}

class InfoPageProvider with InfoPageProviderInterface {
  final ProviderRef ref;

  InfoPageProvider({required this.ref});

  @override
  setTap(int index) {
    ref.read(infoPageIndex.notifier).state = index;
  }

  @override
  filterByKeyword(String keyword) {
    print("#############");
    print(keyword);
    ref.read(infoSearchSortedProvider.notifier).state=[];
    if (keyword!=""){
      for (MountainModel model in ref.read(mountainListProvider).keys){
        if (model.name.contains(keyword)){
          ref.read(infoSearchSortedProvider.notifier).state.add(model);
          print(ref.read(infoSearchSortedProvider.notifier).state.length);
        }
      }
    }
    else{
      ref.read(infoSearchSortedProvider.notifier).state=ref.read(mountainListProvider).keys.toList();
    }

  }


}
