// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      climbCompleteList: (json['climbCompleteList'] as List<dynamic>)
          .map((e) => e as String?)
          .toList(),
      commentList: (json['commentList'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>?)
          .toList(),
      likeMountainList: (json['likeMountainList'] as List<dynamic>)
          .map((e) => e as String?)
          .toList(),
      likePostList: (json['likePostList'] as List<dynamic>)
          .map((e) => e as int?)
          .toList(),
      postList:
          (json['postList'] as List<dynamic>).map((e) => e as String?).toList(),
      userInfo:
          UserInfoModel.fromJson(json['userInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'climbCompleteList': instance.climbCompleteList,
      'commentList': instance.commentList,
      'likeMountainList': instance.likeMountainList,
      'likePostList': instance.likePostList,
      'postList': instance.postList,
      'userInfo': instance.userInfo,
    };

_$_UserInfoModel _$$_UserInfoModelFromJson(Map<String, dynamic> json) =>
    _$_UserInfoModel(
      nickname: json['nickname'] as String,
      address: json['address'] as String?,
      email: json['email'] as String,
      rank: json['rank'] as String,
      tel: json['tel'] as String?,
      push_token: json['push_token'] as String?,
    );

Map<String, dynamic> _$$_UserInfoModelToJson(_$_UserInfoModel instance) =>
    <String, dynamic>{
      'nickname': instance.nickname,
      'address': instance.address,
      'email': instance.email,
      'rank': instance.rank,
      'tel': instance.tel,
      'push_token': instance.push_token,
    };
