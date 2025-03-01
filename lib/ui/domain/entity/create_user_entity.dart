

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_user_entity.g.dart';

@JsonSerializable()
class CreateUserEntity{
  final String? username; 
  final String? password; 
  final String? fullName; 

  CreateUserEntity(this.username, this.password, this.fullName); 
  factory CreateUserEntity.fromJson(Map<String, dynamic> json) => _$CreateUserEntityFromJson(json); 
  Map<String, dynamic> toJson() => _$CreateUserEntityToJson(this);
}