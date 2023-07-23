// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BaseResponse _$$_BaseResponseFromJson(Map<String, dynamic> json) =>
    _$_BaseResponse(
      currentCount: json['currentCount'] as int,
      matchCount: json['matchCount'] as int,
      page: json['page'] as int,
      perPage: json['perPage'] as int,
      totalCount: json['totalCount'] as int,
      data: json['data'],
    );

Map<String, dynamic> _$$_BaseResponseToJson(_$_BaseResponse instance) =>
    <String, dynamic>{
      'currentCount': instance.currentCount,
      'matchCount': instance.matchCount,
      'page': instance.page,
      'perPage': instance.perPage,
      'totalCount': instance.totalCount,
      'data': instance.data,
    };
