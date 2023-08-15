import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mountain100/data/model/post/post_model.dart';
import 'package:mountain100/page/splash/splash_provider.dart';

final thumbColorProvider = StateProvider<Color>((ref) => Colors.white);

abstract class ComunityPostDetailProviderInterface {
  setThumbUp(PostModel model);
  postComment();
  EditPost();
  DeletePost();
  DeleteComment();

}
final comunityProvider = Provider<ComunityPostDetailProvider>((ref) => ComunityPostDetailProvider(ref: ref));

class ComunityPostDetailProvider with ComunityPostDetailProviderInterface {
  final ProviderRef ref;

  ComunityPostDetailProvider({required this.ref});

  @override
  DeleteComment() {

  }

  @override
  DeletePost() {
    // TODO: implement DeletePost
    throw UnimplementedError();
  }

  @override
  EditPost() {
    // TODO: implement EditPost
    throw UnimplementedError();
  }

  @override
  postComment() {
    // TODO: implement postComment
    throw UnimplementedError();
  }

  @override
  setThumbUp(PostModel model) async {

  }
}