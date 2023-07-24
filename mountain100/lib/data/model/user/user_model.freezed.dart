// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  List<String?> get climbCompleteList => throw _privateConstructorUsedError;
  List<Map<String, int>?> get commentList => throw _privateConstructorUsedError;
  List<String?> get likeMountainList => throw _privateConstructorUsedError;
  List<int?> get likePostList => throw _privateConstructorUsedError;
  List<int?> get postList => throw _privateConstructorUsedError;
  UserInfoModel get userInfo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {List<String?> climbCompleteList,
      List<Map<String, int>?> commentList,
      List<String?> likeMountainList,
      List<int?> likePostList,
      List<int?> postList,
      UserInfoModel userInfo});

  $UserInfoModelCopyWith<$Res> get userInfo;
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? climbCompleteList = null,
    Object? commentList = null,
    Object? likeMountainList = null,
    Object? likePostList = null,
    Object? postList = null,
    Object? userInfo = null,
  }) {
    return _then(_value.copyWith(
      climbCompleteList: null == climbCompleteList
          ? _value.climbCompleteList
          : climbCompleteList // ignore: cast_nullable_to_non_nullable
              as List<String?>,
      commentList: null == commentList
          ? _value.commentList
          : commentList // ignore: cast_nullable_to_non_nullable
              as List<Map<String, int>?>,
      likeMountainList: null == likeMountainList
          ? _value.likeMountainList
          : likeMountainList // ignore: cast_nullable_to_non_nullable
              as List<String?>,
      likePostList: null == likePostList
          ? _value.likePostList
          : likePostList // ignore: cast_nullable_to_non_nullable
              as List<int?>,
      postList: null == postList
          ? _value.postList
          : postList // ignore: cast_nullable_to_non_nullable
              as List<int?>,
      userInfo: null == userInfo
          ? _value.userInfo
          : userInfo // ignore: cast_nullable_to_non_nullable
              as UserInfoModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserInfoModelCopyWith<$Res> get userInfo {
    return $UserInfoModelCopyWith<$Res>(_value.userInfo, (value) {
      return _then(_value.copyWith(userInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$$_UserModelCopyWith(
          _$_UserModel value, $Res Function(_$_UserModel) then) =
      __$$_UserModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String?> climbCompleteList,
      List<Map<String, int>?> commentList,
      List<String?> likeMountainList,
      List<int?> likePostList,
      List<int?> postList,
      UserInfoModel userInfo});

  @override
  $UserInfoModelCopyWith<$Res> get userInfo;
}

/// @nodoc
class __$$_UserModelCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$_UserModel>
    implements _$$_UserModelCopyWith<$Res> {
  __$$_UserModelCopyWithImpl(
      _$_UserModel _value, $Res Function(_$_UserModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? climbCompleteList = null,
    Object? commentList = null,
    Object? likeMountainList = null,
    Object? likePostList = null,
    Object? postList = null,
    Object? userInfo = null,
  }) {
    return _then(_$_UserModel(
      climbCompleteList: null == climbCompleteList
          ? _value._climbCompleteList
          : climbCompleteList // ignore: cast_nullable_to_non_nullable
              as List<String?>,
      commentList: null == commentList
          ? _value._commentList
          : commentList // ignore: cast_nullable_to_non_nullable
              as List<Map<String, int>?>,
      likeMountainList: null == likeMountainList
          ? _value._likeMountainList
          : likeMountainList // ignore: cast_nullable_to_non_nullable
              as List<String?>,
      likePostList: null == likePostList
          ? _value._likePostList
          : likePostList // ignore: cast_nullable_to_non_nullable
              as List<int?>,
      postList: null == postList
          ? _value._postList
          : postList // ignore: cast_nullable_to_non_nullable
              as List<int?>,
      userInfo: null == userInfo
          ? _value.userInfo
          : userInfo // ignore: cast_nullable_to_non_nullable
              as UserInfoModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserModel implements _UserModel {
  const _$_UserModel(
      {required final List<String?> climbCompleteList,
      required final List<Map<String, int>?> commentList,
      required final List<String?> likeMountainList,
      required final List<int?> likePostList,
      required final List<int?> postList,
      required this.userInfo})
      : _climbCompleteList = climbCompleteList,
        _commentList = commentList,
        _likeMountainList = likeMountainList,
        _likePostList = likePostList,
        _postList = postList;

  factory _$_UserModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserModelFromJson(json);

  final List<String?> _climbCompleteList;
  @override
  List<String?> get climbCompleteList {
    if (_climbCompleteList is EqualUnmodifiableListView)
      return _climbCompleteList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_climbCompleteList);
  }

  final List<Map<String, int>?> _commentList;
  @override
  List<Map<String, int>?> get commentList {
    if (_commentList is EqualUnmodifiableListView) return _commentList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_commentList);
  }

  final List<String?> _likeMountainList;
  @override
  List<String?> get likeMountainList {
    if (_likeMountainList is EqualUnmodifiableListView)
      return _likeMountainList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_likeMountainList);
  }

  final List<int?> _likePostList;
  @override
  List<int?> get likePostList {
    if (_likePostList is EqualUnmodifiableListView) return _likePostList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_likePostList);
  }

  final List<int?> _postList;
  @override
  List<int?> get postList {
    if (_postList is EqualUnmodifiableListView) return _postList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_postList);
  }

  @override
  final UserInfoModel userInfo;

  @override
  String toString() {
    return 'UserModel(climbCompleteList: $climbCompleteList, commentList: $commentList, likeMountainList: $likeMountainList, likePostList: $likePostList, postList: $postList, userInfo: $userInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserModel &&
            const DeepCollectionEquality()
                .equals(other._climbCompleteList, _climbCompleteList) &&
            const DeepCollectionEquality()
                .equals(other._commentList, _commentList) &&
            const DeepCollectionEquality()
                .equals(other._likeMountainList, _likeMountainList) &&
            const DeepCollectionEquality()
                .equals(other._likePostList, _likePostList) &&
            const DeepCollectionEquality().equals(other._postList, _postList) &&
            (identical(other.userInfo, userInfo) ||
                other.userInfo == userInfo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_climbCompleteList),
      const DeepCollectionEquality().hash(_commentList),
      const DeepCollectionEquality().hash(_likeMountainList),
      const DeepCollectionEquality().hash(_likePostList),
      const DeepCollectionEquality().hash(_postList),
      userInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserModelCopyWith<_$_UserModel> get copyWith =>
      __$$_UserModelCopyWithImpl<_$_UserModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserModelToJson(
      this,
    );
  }
}

abstract class _UserModel implements UserModel {
  const factory _UserModel(
      {required final List<String?> climbCompleteList,
      required final List<Map<String, int>?> commentList,
      required final List<String?> likeMountainList,
      required final List<int?> likePostList,
      required final List<int?> postList,
      required final UserInfoModel userInfo}) = _$_UserModel;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$_UserModel.fromJson;

  @override
  List<String?> get climbCompleteList;
  @override
  List<Map<String, int>?> get commentList;
  @override
  List<String?> get likeMountainList;
  @override
  List<int?> get likePostList;
  @override
  List<int?> get postList;
  @override
  UserInfoModel get userInfo;
  @override
  @JsonKey(ignore: true)
  _$$_UserModelCopyWith<_$_UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

UserInfoModel _$UserInfoModelFromJson(Map<String, dynamic> json) {
  return _UserInfoModel.fromJson(json);
}

/// @nodoc
mixin _$UserInfoModel {
  String get nickname => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get rank => throw _privateConstructorUsedError;
  String get tel => throw _privateConstructorUsedError;
  String? get push_token => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserInfoModelCopyWith<UserInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserInfoModelCopyWith<$Res> {
  factory $UserInfoModelCopyWith(
          UserInfoModel value, $Res Function(UserInfoModel) then) =
      _$UserInfoModelCopyWithImpl<$Res, UserInfoModel>;
  @useResult
  $Res call(
      {String nickname,
      String address,
      String email,
      String rank,
      String tel,
      String? push_token});
}

/// @nodoc
class _$UserInfoModelCopyWithImpl<$Res, $Val extends UserInfoModel>
    implements $UserInfoModelCopyWith<$Res> {
  _$UserInfoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nickname = null,
    Object? address = null,
    Object? email = null,
    Object? rank = null,
    Object? tel = null,
    Object? push_token = freezed,
  }) {
    return _then(_value.copyWith(
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      rank: null == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as String,
      tel: null == tel
          ? _value.tel
          : tel // ignore: cast_nullable_to_non_nullable
              as String,
      push_token: freezed == push_token
          ? _value.push_token
          : push_token // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserInfoModelCopyWith<$Res>
    implements $UserInfoModelCopyWith<$Res> {
  factory _$$_UserInfoModelCopyWith(
          _$_UserInfoModel value, $Res Function(_$_UserInfoModel) then) =
      __$$_UserInfoModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String nickname,
      String address,
      String email,
      String rank,
      String tel,
      String? push_token});
}

/// @nodoc
class __$$_UserInfoModelCopyWithImpl<$Res>
    extends _$UserInfoModelCopyWithImpl<$Res, _$_UserInfoModel>
    implements _$$_UserInfoModelCopyWith<$Res> {
  __$$_UserInfoModelCopyWithImpl(
      _$_UserInfoModel _value, $Res Function(_$_UserInfoModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nickname = null,
    Object? address = null,
    Object? email = null,
    Object? rank = null,
    Object? tel = null,
    Object? push_token = freezed,
  }) {
    return _then(_$_UserInfoModel(
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      rank: null == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as String,
      tel: null == tel
          ? _value.tel
          : tel // ignore: cast_nullable_to_non_nullable
              as String,
      push_token: freezed == push_token
          ? _value.push_token
          : push_token // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserInfoModel implements _UserInfoModel {
  const _$_UserInfoModel(
      {required this.nickname,
      required this.address,
      required this.email,
      required this.rank,
      required this.tel,
      this.push_token});

  factory _$_UserInfoModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserInfoModelFromJson(json);

  @override
  final String nickname;
  @override
  final String address;
  @override
  final String email;
  @override
  final String rank;
  @override
  final String tel;
  @override
  final String? push_token;

  @override
  String toString() {
    return 'UserInfoModel(nickname: $nickname, address: $address, email: $email, rank: $rank, tel: $tel, push_token: $push_token)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserInfoModel &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.rank, rank) || other.rank == rank) &&
            (identical(other.tel, tel) || other.tel == tel) &&
            (identical(other.push_token, push_token) ||
                other.push_token == push_token));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, nickname, address, email, rank, tel, push_token);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserInfoModelCopyWith<_$_UserInfoModel> get copyWith =>
      __$$_UserInfoModelCopyWithImpl<_$_UserInfoModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserInfoModelToJson(
      this,
    );
  }
}

abstract class _UserInfoModel implements UserInfoModel {
  const factory _UserInfoModel(
      {required final String nickname,
      required final String address,
      required final String email,
      required final String rank,
      required final String tel,
      final String? push_token}) = _$_UserInfoModel;

  factory _UserInfoModel.fromJson(Map<String, dynamic> json) =
      _$_UserInfoModel.fromJson;

  @override
  String get nickname;
  @override
  String get address;
  @override
  String get email;
  @override
  String get rank;
  @override
  String get tel;
  @override
  String? get push_token;
  @override
  @JsonKey(ignore: true)
  _$$_UserInfoModelCopyWith<_$_UserInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}
