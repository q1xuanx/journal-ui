// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateUserEntity _$CreateUserEntityFromJson(Map<String, dynamic> json) =>
    CreateUserEntity(
      json['username'] as String?,
      json['password'] as String?,
      json['fullName'] as String?,
    );

Map<String, dynamic> _$CreateUserEntityToJson(CreateUserEntity instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
      'fullName': instance.fullName,
    };
