import 'package:freezed_annotation/freezed_annotation.dart';
part 'post_model.freezed.dart';
part 'post_model.g.dart';
@freezed
class PostModel with _$PostModel{
  factory PostModel({
    required String id,
    required String title,
    required double SSR,
    required String content,
    required DateTime date,
    required String writer,
    required List<String> like,
    required String mountain,
    required List<CommentModel> comment,
  }) = _PostModel;
  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);
}


@freezed
class CommentModel with _$CommentModel{
  factory CommentModel({
    required int id,
    required DateTime date,
    required String writer,
    required String content,
  }) = _CommentModel;
  factory CommentModel.fromJson(Map<String, dynamic> json) =>
      _$CommentModelFromJson(json);
}

// flutter pub run build_runner build

/*
_$_PostModel _$$_PostModelFromJson(Map<String, dynamic> json) => _$_PostModel(
    id: json['id'] as String,
    title : (json['title'] as String),
    SSR: (json['SSR'] as num).toDouble(),
    content: json['content'] as String,
    date: json['date'].toDate(),
    writer: json['writer'] as String,
    like: (json['like'] as List<dynamic>).map((e) => e as String).toList(),
    mountain: json['mountain'] as String,
    comment: (json['comment'] as List<dynamic>)
        .map((e) => CommentModel.fromJson(e)).toList()
);
Map<String, dynamic> _$$_PostModelToJson(_$_PostModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'SSR': instance.SSR,
      'content': instance.content,
      'date': instance.date,
      'writer': instance.writer,
      'like': instance.like,
      'mountain': instance.mountain,
      'comment': instance.comment,
    };

_$_CommentModel _$$_CommentModelFromJson(Map<String, dynamic> json) =>
    _$_CommentModel(
      id: json['id'] as int,
      date: json['date'].toDate(),
      writer: json['writer'] as String,
      content: json['content'] as String,
    );
    Map<String, dynamic> _$$_CommentModelToJson(_$_CommentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'writer': instance.writer,
      'content': instance.content,
    };
*/