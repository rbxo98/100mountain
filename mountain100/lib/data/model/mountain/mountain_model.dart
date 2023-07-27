import 'package:freezed_annotation/freezed_annotation.dart';
part 'mountain_model.freezed.dart';
part 'mountain_model.g.dart';
@freezed
class MountainModel with _$MountainModel{
   factory MountainModel({
    required String cordX,
    required String cordY,
    required String transInfo,
    required String difficult,
    required String height,
    required String location,
    required String name,
    required String description,
    required String course,
    required String point,
    required String selectedReason,

  }) = _MountainModel;
  factory MountainModel.fromJson(Map<String, dynamic> json) =>
      _$MountainModelFromJson(json);

  MountainModel._();

  void method(){

  }

}

// flutter pub run build_runner build