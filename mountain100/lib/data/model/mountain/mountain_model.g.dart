// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mountain_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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

Map<String, dynamic> _$$_MountainModelToJson(_$_MountainModel instance) =>
    <String, dynamic>{
      'cordX': instance.cordX,
      'cordY': instance.cordY,
      'transInfo': instance.transInfo,
      'difficult': instance.difficult,
      'height': instance.height,
      'location': instance.location,
      'name': instance.name,
      'description': instance.description,
      'course': instance.course,
      'point': instance.point,
      'selectedReason': instance.selectedReason,
    };
