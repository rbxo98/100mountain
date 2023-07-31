import 'package:freezed_annotation/freezed_annotation.dart';

import '../mountain/mountain_model.dart';
part 'user_model.freezed.dart';
part 'user_model.g.dart';


@freezed
class UserModel with _$UserModel{
  const factory UserModel({
    required List<String?> climbCompleteList,
    required List<Map<String, int>?> commentList,
    required List<String?> likeMountainList,
    required List<int?> likePostList,
    required List<int?> postList,
    required UserInfoModel userInfo,
  }) = _UserModel;
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

@freezed
class UserInfoModel with _$UserInfoModel{
  const factory UserInfoModel({
    required String nickname,
    required String address,
    required String email,
    required String rank,
    required String tel,
    String? push_token
  }) = _UserInfoModel;
  factory UserInfoModel.fromJson(Map<String, dynamic> json) =>
      _$UserInfoModelFromJson(json);
}