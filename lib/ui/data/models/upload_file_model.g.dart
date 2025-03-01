// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_file_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadFileModel _$UploadFileModelFromJson(Map<String, dynamic> json) =>
    UploadFileModel(
      json['title'] as String?,
      json['content'] as String?,
      const FileConvert().fromJson(json['imageFile'] as String?),
      (json['userCreatedId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$UploadFileModelToJson(UploadFileModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
      'imageFile': const FileConvert().toJson(instance.imageFile),
      'userCreatedId': instance.userCreatedId,
    };
