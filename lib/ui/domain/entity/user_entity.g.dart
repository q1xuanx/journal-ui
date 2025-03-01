// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserEntity _$UserEntityFromJson(Map<String, dynamic> json) => UserEntity(
      (json['idUser'] as num).toInt(),
      json['username'] as String,
      json['password'] as String,
      json['fullName'] as String,
    );

Map<String, dynamic> _$UserEntityToJson(UserEntity instance) => <String, dynamic>{
      'idUser': instance.id,
      'username': instance.username,
      'password': instance.password,
      'fullName': instance.fullName,
    };
