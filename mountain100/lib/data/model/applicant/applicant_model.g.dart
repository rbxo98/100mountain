// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'applicant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ApplicantSouvenirModel _$$_ApplicantSouvenirModelFromJson(
        Map<String, dynamic> json) =>
    _$_ApplicantSouvenirModel(
      name: json['name'] as String,
      address: json['address'] as String,
      info: json['info'] as String,
      tel: json['tel'] as String,
      waybill: json['waybill'] as String,
    );

Map<String, dynamic> _$$_ApplicantSouvenirModelToJson(
        _$_ApplicantSouvenirModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'address': instance.address,
      'info': instance.info,
      'tel': instance.tel,
      'waybill': instance.waybill,
    };

_$_ApplicantCertificationModel _$$_ApplicantCertificationModelFromJson(
        Map<String, dynamic> json) =>
    _$_ApplicantCertificationModel(
      date: json['date'].toDate(),
      grade: json['grade'] as String,
      name: json['name'] as String,
      state: json['state'] as String,
    );

Map<String, dynamic> _$$_ApplicantCertificationModelToJson(
        _$_ApplicantCertificationModel instance) =>
    <String, dynamic>{
      'date': instance.date,
      'grade': instance.grade,
      'name': instance.name,
      'state': instance.state,
    };
