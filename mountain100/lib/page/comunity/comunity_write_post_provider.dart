import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dropdownItemValueProvider = StateProvider<String>((ref) => "가리산");
final starValueProvider = StateProvider<double>((ref) => 5);
final titleTextController = StateProvider<TextEditingController>((ref) => TextEditingController());
final contentTextController = StateProvider<TextEditingController>((ref) => TextEditingController());

abstract class WritePostProviderProviderInterface {
  setDropDownState(String value);
  setStarRatingValueState(double value);
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
}

