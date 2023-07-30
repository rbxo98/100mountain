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
/*
_$_MountainModel _$$_MountainModelFromJson(Map<String, dynamic> json) =>
    _$_MountainModel(
      cordX: json['X좌표'] as String,
      cordY: json['Y좌표'] as String,
      transInfo: json['교통정보'] as String,
      difficult: json['난이도'] as String,
      height: json['명산_높이'] as String,
      location: json['명산_소재지'] as String,
      name: json['명산_이름'] as String,
      description: json['산_개요'] as String,
      course: json['산행코스'] as String,
      point: json['산행포인트'] as String,
      selectedReason: json['특징_및_선정_이유'] as String,
    );
 */