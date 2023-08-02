import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mountain100/page/main/main_provider.dart';

import '../../data/model/post/post_model.dart';

final dropdownItemValueProvider = StateProvider<String>((ref) => "가리산");
final postListProivder=StateProvider<List<PostModel>>((ref)=>[]);
final comunityProvider = Provider<ComunityProvider>((ref)=>ComunityProvider(ref: ref));

abstract class ComunityProviderInterface {
  void getPostListByMountainName(String name);
  getPostListByMountainNameMore(String name,int lastId);
}

class ComunityProvider with ComunityProviderInterface {
  final ProviderRef ref;

  ComunityProvider({required this.ref});

  @override
  void getPostListByMountainName(String? name) {
    print(name);
    ref.read(dropdownItemValueProvider.notifier).state = name!;
    List<PostModel> posts = [];
    FirebaseFirestore.instance.collection('Posts').where("mountain",isEqualTo:name).limit(10).get().then((value) {
      for(dynamic data in value.docs){
        posts.add(PostModel.fromJson(data.data()));
      }
      print(posts);
      ref.read(postListProivder.notifier).state=posts;
    });
  }

  @override
  getPostListByMountainNameMore(String name, int lastId) {
    List<PostModel> posts = [];
    FirebaseFirestore.instance.collection('Posts').where("mountain",isEqualTo:name).where('id',isGreaterThan: lastId).limit(10).get().then((value) {
      for(dynamic data in value.docs){
        posts.add(data.data());
      }
      final origin = ref.read(postListProivder.notifier).state;
      ref.read(postListProivder.notifier).state=[...origin,...posts];
    });
  }
}