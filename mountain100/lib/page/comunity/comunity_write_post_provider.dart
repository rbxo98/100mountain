import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dropdownItemValueProvider = StateProvider.autoDispose<String>((ref) => "가리산");
final starValueProvider = StateProvider<double>((ref) => 5);
final titleTextController = StateProvider.autoDispose<TextEditingController>((ref) => TextEditingController());
final contentTextController = StateProvider.autoDispose<TextEditingController>((ref) => TextEditingController());
final selectDifficultValueProvider = StateProvider.autoDispose<int?>((ref) => null);
final selectDifficultColorProvider =  StateProvider.autoDispose<List<bool>>((ref) => [false,false,false,false,false]);

abstract class WritePostProviderProviderInterface {
  setSelectedMountainState(String value);
  setDropDownState(String value);
  setStarRatingValueState(double value);
  setDifficultState(int value);
}

final writePostProvider = Provider<WritePostProvider>((ref)=>WritePostProvider(ref: ref));

class WritePostProvider with WritePostProviderProviderInterface {
  final ProviderRef ref;

    WritePostProvider({required this.ref});

    @override
    setDropDownState(String? value) {
      ref.read(dropdownItemValueProvider.notifier).state=value!;
  }

  @override
  setStarRatingValueState(double value) {
      ref.read(starValueProvider.notifier).state=value;
  }

  @override
  setSelectedMountainState(String value) {
      ref.read(dropdownItemValueProvider.notifier).state=value;
  }

  @override
  setDifficultState(int value) {
      ref.read(selectDifficultValueProvider.notifier).state=value;
      final newColor=[false,false,false,false,false];
      newColor[value]=true;
      ref.read(selectDifficultColorProvider.notifier).state=newColor;
  }
}

