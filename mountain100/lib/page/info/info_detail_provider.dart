
import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mountain100/data/network/dio_factory.dart';

final mountainImageListProvider = StateProvider.autoDispose<List<Widget>>((ref) => []);
final mountainSSRProvider = StateProvider.autoDispose<double>((ref) => 0);

abstract class InfoDetailProviderInterface {

  getMountainImage(String name);
}

final infoDetailProvider = Provider<InfoDetailProvider>((ref) => InfoDetailProvider(ref:ref));

class InfoDetailProvider with InfoDetailProviderInterface{
  final ProviderRef ref;
  InfoDetailProvider({required this.ref});

  @override
  getMountainImage(String name) async {
    final result = await FirebaseStorage.instance.ref().child('mountain/$name').listAll();
    for (var item in result.items){
      item.getData().then((value) {
        final pastState =  ref.read(mountainImageListProvider.notifier).state;
        ref.read(mountainImageListProvider.notifier).state=[...pastState,Image.memory(value!)];
      });
    }
  }
}