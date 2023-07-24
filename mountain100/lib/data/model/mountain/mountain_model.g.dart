// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mountain_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MountainModel _$$_MountainModelFromJson(Map<String, dynamic> json) =>
    _$_MountainModel(
      cordX: json['cordX'] as String,
      cordY: json['cordY'] as String,
      transInfo: json['transInfo'] as String,
      difficult: json['difficult'] as String,
      height: json['height'] as String,
      location: json['location'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      course: json['course'] as String,
      point: json['point'] as String,
      selectedReason: json['selectedReason'] as String,
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
