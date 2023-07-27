import 'package:freezed_annotation/freezed_annotation.dart';

import '../mountain/mountain_model.dart';
part 'base_model.freezed.dart';
part 'base_model.g.dart';


@freezed
class BaseResponse with _$BaseResponse{
  const factory BaseResponse({
    required int currentCount,
    required int matchCount,
    required int page,
    required int perPage,
    required int totalCount,
    dynamic data,
  }) = _BaseResponse;
  factory BaseResponse.fromJson(Map<String, dynamic> json) =>
      _$BaseResponseFromJson(json);
}