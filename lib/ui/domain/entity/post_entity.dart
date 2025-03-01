import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_entity.g.dart';
@JsonSerializable()
class PostEntity{
  final int? idPost;
  final String? title;
  final String? content;
  final String? urlImage;
  final DateTime? createdAt;

  PostEntity(this.idPost, this.title, this.content, this.urlImage, this.createdAt);
  factory PostEntity.fromJson(Map<String, dynamic> json) => _$PostEntityFromJson(json); 
  Map<String, dynamic> toJson() => _$PostEntityToJson(this);
}