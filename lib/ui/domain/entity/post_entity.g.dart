// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostEntity _$PostEntityFromJson(Map<String, dynamic> json) => PostEntity(
      (json['idPost'] as num?)?.toInt(),
      json['title'] as String?,
      json['content'] as String?,
      json['urlImage'] as String?,
      json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$PostEntityToJson(PostEntity instance) =>
    <String, dynamic>{
      'idPost': instance.idPost,
      'title': instance.title,
      'content': instance.content,
      'urlImage': instance.urlImage,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
