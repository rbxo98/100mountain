import 'package:freezed_annotation/freezed_annotation.dart';

part 'applicant_model.freezed.dart';
part 'applicant_model.g.dart';


@freezed
class ApplicantSouvenirModel with _$ApplicantSouvenirModel{
  const factory ApplicantSouvenirModel({
    required String name,
    required String address,
    required String info,
    required String tel,
    required String waybill,
    required String nickname,
  }) = _ApplicantSouvenirModel;
  factory ApplicantSouvenirModel.fromJson(Map<String, dynamic> json) =>
      _$ApplicantSouvenirModelFromJson(json);
}

@freezed
class ApplicantCertificationModel with _$ApplicantCertificationModel{
  const factory ApplicantCertificationModel({
    required DateTime date,
    required String grade,
    required String name,
    required String state,
    required String nickname,
  }) = _ApplicantCertificationModel;
  factory ApplicantCertificationModel.fromJson(Map<String, dynamic> json) =>
      _$ApplicantCertificationModelFromJson(json);
}

/*
_$_ApplicantCertificationModel _$$_ApplicantCertificationModelFromJson(
        Map<String, dynamic> json) =>
    _$_ApplicantCertificationModel(
      date: json['date'].toDate(),
      grade: json['grade'] as String,
      name: json['name'] as String,
      state: json['state'] as String,
      nickname: json['nickname'] as String,
    );

Map<String, dynamic> _$$_ApplicantCertificationModelToJson(
        _$_ApplicantCertificationModel instance) =>
    <String, dynamic>{
      'date': instance.date,
      'grade': instance.grade,
      'name': instance.name,
      'state': instance.state,
      'nickname': instance.nickname,
    };

* */