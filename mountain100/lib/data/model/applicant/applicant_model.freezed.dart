// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'applicant_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ApplicantSouvenirModel _$ApplicantSouvenirModelFromJson(
    Map<String, dynamic> json) {
  return _ApplicantSouvenirModel.fromJson(json);
}

/// @nodoc
mixin _$ApplicantSouvenirModel {
  String get name => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get info => throw _privateConstructorUsedError;
  String get tel => throw _privateConstructorUsedError;
  String get waybill => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApplicantSouvenirModelCopyWith<ApplicantSouvenirModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApplicantSouvenirModelCopyWith<$Res> {
  factory $ApplicantSouvenirModelCopyWith(ApplicantSouvenirModel value,
          $Res Function(ApplicantSouvenirModel) then) =
      _$ApplicantSouvenirModelCopyWithImpl<$Res, ApplicantSouvenirModel>;
  @useResult
  $Res call(
      {String name, String address, String info, String tel, String waybill});
}

/// @nodoc
class _$ApplicantSouvenirModelCopyWithImpl<$Res,
        $Val extends ApplicantSouvenirModel>
    implements $ApplicantSouvenirModelCopyWith<$Res> {
  _$ApplicantSouvenirModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? address = null,
    Object? info = null,
    Object? tel = null,
    Object? waybill = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as String,
      tel: null == tel
          ? _value.tel
          : tel // ignore: cast_nullable_to_non_nullable
              as String,
      waybill: null == waybill
          ? _value.waybill
          : waybill // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ApplicantSouvenirModelCopyWith<$Res>
    implements $ApplicantSouvenirModelCopyWith<$Res> {
  factory _$$_ApplicantSouvenirModelCopyWith(_$_ApplicantSouvenirModel value,
          $Res Function(_$_ApplicantSouvenirModel) then) =
      __$$_ApplicantSouvenirModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name, String address, String info, String tel, String waybill});
}

/// @nodoc
class __$$_ApplicantSouvenirModelCopyWithImpl<$Res>
    extends _$ApplicantSouvenirModelCopyWithImpl<$Res,
        _$_ApplicantSouvenirModel>
    implements _$$_ApplicantSouvenirModelCopyWith<$Res> {
  __$$_ApplicantSouvenirModelCopyWithImpl(_$_ApplicantSouvenirModel _value,
      $Res Function(_$_ApplicantSouvenirModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? address = null,
    Object? info = null,
    Object? tel = null,
    Object? waybill = null,
  }) {
    return _then(_$_ApplicantSouvenirModel(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as String,
      tel: null == tel
          ? _value.tel
          : tel // ignore: cast_nullable_to_non_nullable
              as String,
      waybill: null == waybill
          ? _value.waybill
          : waybill // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ApplicantSouvenirModel implements _ApplicantSouvenirModel {
  const _$_ApplicantSouvenirModel(
      {required this.name,
      required this.address,
      required this.info,
      required this.tel,
      required this.waybill});

  factory _$_ApplicantSouvenirModel.fromJson(Map<String, dynamic> json) =>
      _$$_ApplicantSouvenirModelFromJson(json);

  @override
  final String name;
  @override
  final String address;
  @override
  final String info;
  @override
  final String tel;
  @override
  final String waybill;

  @override
  String toString() {
    return 'ApplicantSouvenirModel(name: $name, address: $address, info: $info, tel: $tel, waybill: $waybill)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ApplicantSouvenirModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.info, info) || other.info == info) &&
            (identical(other.tel, tel) || other.tel == tel) &&
            (identical(other.waybill, waybill) || other.waybill == waybill));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, address, info, tel, waybill);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ApplicantSouvenirModelCopyWith<_$_ApplicantSouvenirModel> get copyWith =>
      __$$_ApplicantSouvenirModelCopyWithImpl<_$_ApplicantSouvenirModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ApplicantSouvenirModelToJson(
      this,
    );
  }
}

abstract class _ApplicantSouvenirModel implements ApplicantSouvenirModel {
  const factory _ApplicantSouvenirModel(
      {required final String name,
      required final String address,
      required final String info,
      required final String tel,
      required final String waybill}) = _$_ApplicantSouvenirModel;

  factory _ApplicantSouvenirModel.fromJson(Map<String, dynamic> json) =
      _$_ApplicantSouvenirModel.fromJson;

  @override
  String get name;
  @override
  String get address;
  @override
  String get info;
  @override
  String get tel;
  @override
  String get waybill;
  @override
  @JsonKey(ignore: true)
  _$$_ApplicantSouvenirModelCopyWith<_$_ApplicantSouvenirModel> get copyWith =>
      throw _privateConstructorUsedError;
}

ApplicantCertificationModel _$ApplicantCertificationModelFromJson(
    Map<String, dynamic> json) {
  return _ApplicantCertificationModel.fromJson(json);
}

/// @nodoc
mixin _$ApplicantCertificationModel {
  DateTime get date => throw _privateConstructorUsedError;
  String get grade => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get state => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApplicantCertificationModelCopyWith<ApplicantCertificationModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApplicantCertificationModelCopyWith<$Res> {
  factory $ApplicantCertificationModelCopyWith(
          ApplicantCertificationModel value,
          $Res Function(ApplicantCertificationModel) then) =
      _$ApplicantCertificationModelCopyWithImpl<$Res,
          ApplicantCertificationModel>;
  @useResult
  $Res call({DateTime date, String grade, String name, String state});
}

/// @nodoc
class _$ApplicantCertificationModelCopyWithImpl<$Res,
        $Val extends ApplicantCertificationModel>
    implements $ApplicantCertificationModelCopyWith<$Res> {
  _$ApplicantCertificationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? grade = null,
    Object? name = null,
    Object? state = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      grade: null == grade
          ? _value.grade
          : grade // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ApplicantCertificationModelCopyWith<$Res>
    implements $ApplicantCertificationModelCopyWith<$Res> {
  factory _$$_ApplicantCertificationModelCopyWith(
          _$_ApplicantCertificationModel value,
          $Res Function(_$_ApplicantCertificationModel) then) =
      __$$_ApplicantCertificationModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime date, String grade, String name, String state});
}

/// @nodoc
class __$$_ApplicantCertificationModelCopyWithImpl<$Res>
    extends _$ApplicantCertificationModelCopyWithImpl<$Res,
        _$_ApplicantCertificationModel>
    implements _$$_ApplicantCertificationModelCopyWith<$Res> {
  __$$_ApplicantCertificationModelCopyWithImpl(
      _$_ApplicantCertificationModel _value,
      $Res Function(_$_ApplicantCertificationModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? grade = null,
    Object? name = null,
    Object? state = null,
  }) {
    return _then(_$_ApplicantCertificationModel(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      grade: null == grade
          ? _value.grade
          : grade // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ApplicantCertificationModel implements _ApplicantCertificationModel {
  const _$_ApplicantCertificationModel(
      {required this.date,
      required this.grade,
      required this.name,
      required this.state});

  factory _$_ApplicantCertificationModel.fromJson(Map<String, dynamic> json) =>
      _$$_ApplicantCertificationModelFromJson(json);

  @override
  final DateTime date;
  @override
  final String grade;
  @override
  final String name;
  @override
  final String state;

  @override
  String toString() {
    return 'ApplicantCertificationModel(date: $date, grade: $grade, name: $name, state: $state)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ApplicantCertificationModel &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.grade, grade) || other.grade == grade) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.state, state) || other.state == state));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, date, grade, name, state);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ApplicantCertificationModelCopyWith<_$_ApplicantCertificationModel>
      get copyWith => __$$_ApplicantCertificationModelCopyWithImpl<
          _$_ApplicantCertificationModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ApplicantCertificationModelToJson(
      this,
    );
  }
}

abstract class _ApplicantCertificationModel
    implements ApplicantCertificationModel {
  const factory _ApplicantCertificationModel(
      {required final DateTime date,
      required final String grade,
      required final String name,
      required final String state}) = _$_ApplicantCertificationModel;

  factory _ApplicantCertificationModel.fromJson(Map<String, dynamic> json) =
      _$_ApplicantCertificationModel.fromJson;

  @override
  DateTime get date;
  @override
  String get grade;
  @override
  String get name;
  @override
  String get state;
  @override
  @JsonKey(ignore: true)
  _$$_ApplicantCertificationModelCopyWith<_$_ApplicantCertificationModel>
      get copyWith => throw _privateConstructorUsedError;
}
