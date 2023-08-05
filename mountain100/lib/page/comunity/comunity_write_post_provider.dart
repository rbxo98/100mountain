import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:mountain100/app/app.dart';
import 'package:mountain100/data/model/post/post_model.dart';
import 'package:mountain100/page/comunity/comunity_provider.dart';
import 'package:mountain100/page/splash/splash_provider.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

final dropdownItemValueProvider = StateProvider.autoDispose<String>((
    ref) => "가리산");
final starValueProvider = StateProvider<double>((ref) => 5);
final titleTextController = StateProvider.autoDispose<TextEditingController>((
    ref) => TextEditingController());
final contentTextController = StateProvider.autoDispose<TextEditingController>((
    ref) => TextEditingController());
final selectDifficultValueProvider = StateProvider.autoDispose<int?>((
    ref) => null);
final selectDifficultColorProvider = StateProvider.autoDispose<List<bool>>((
    ref) => [false, false, false, false, false]);
final imagePickerProvider = StateProvider<List<Asset>>((ref) => []);
final imagePickerIndexProvider = StateProvider<int>((ref) => 0);

abstract class WritePostProviderProviderInterface {
  setSelectedMountainState(String value);

  setDropDownState(String value);

  setStarRatingValueState(double value);

  setDifficultState(int value);

  setPost();

  getImageFromGallery(BuildContext context);
}

final writePostProvider = Provider<WritePostProvider>((ref) =>
    WritePostProvider(ref: ref));

class WritePostProvider with WritePostProviderProviderInterface {
  final ProviderRef ref;

  WritePostProvider({required this.ref});

  @override
  setDropDownState(String? value) {
    ref
        .read(dropdownItemValueProvider.notifier)
        .state = value!;
  }

  @override
  setStarRatingValueState(double value) {
    ref
        .read(starValueProvider.notifier)
        .state = value;
  }

  @override
  setSelectedMountainState(String value) {
    ref
        .read(dropdownItemValueProvider.notifier)
        .state = value;
  }

  @override
  setDifficultState(int value) {
    ref
        .read(selectDifficultValueProvider.notifier)
        .state = value;
    final newColor = [false, false, false, false, false];
    newColor[value] = true;
    ref
        .read(selectDifficultColorProvider.notifier)
        .state = newColor;
  }

  @override
  getImageFromGallery(BuildContext context) async {
    final resultList =
    await MultiImagePicker.pickImages(maxImages: 5, enableCamera: false,
        materialOptions: MaterialOptions());
    ref
        .read(imagePickerProvider.notifier)
        .state = resultList;
  }

  @override
  setPost() async {
    final now = DateTime.now();
    final docName = DateFormat('yyyyMMddhhmmss').format(now)+now.microsecond.toString();
    PostModel model = PostModel(
      id: docName,
        title: ref.read(titleTextController.notifier).state.text,
        SSR: ref.read(starValueProvider.notifier).state,
        content: ref.read(contentTextController.notifier).state.text,
        date: DateTime.now(),
        writer: ref.read(userInfoProvider.notifier).state!.userInfo.nickname,
        like: [],
        mountain: ref.read(dropdownItemValueProvider.notifier).state,
        comment: []);
    await FirebaseFirestore.instance.collection('Posts').doc(docName).set(model.toJson()).then((_) async {
      final pastUserModel = ref.read(userInfoProvider.notifier).state;
      ref.read(userInfoProvider.notifier).state=pastUserModel!.copyWith(postList: [docName,...pastUserModel.postList,]);
      await FirebaseFirestore.instance.collection('UserInfo').doc(ref.read(userCredentialProvider.notifier).state!.user!.uid).update(
        {'postList': [docName,...pastUserModel.postList,]}
      );
      final pastPostList = ref.read(postListProivder.notifier).state;
      ref.read(postListProivder.notifier).state=[model,...pastPostList];
      Fluttertoast.showToast(msg: "게시글이 등록되었습니다.");
      navigatorKey.currentState!.pop();
    });
  }

}

