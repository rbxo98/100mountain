// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PostModel _$$_PostModelFromJson(Map<String, dynamic> json) => _$_PostModel(
  id: json['id'] as int,
  title : (json['title'] as String),
  SSR: (json['SSR'] as num).toDouble(),
  content: json['content'] as String,
  date: json['date'].toDate(),
  writer: json['writer'] as String,
  like: (json['like'] as List<dynamic>).map((e) => e as String).toList(),
  mountain: json['mountain'] as String,
    comment: (json['comment'] as List<dynamic>)
        .map((e) => e as Map<String, dynamic>).toList()
);

Map<String, dynamic> _$$_PostModelToJson(_$_PostModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'SSR': instance.SSR,
      'content': instance.content,
      'date': instance.date.toIso8601String(),
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
      'date': instance.date.toIso8601String(),
      'writer': instance.writer,
      'content': instance.content,
    };
