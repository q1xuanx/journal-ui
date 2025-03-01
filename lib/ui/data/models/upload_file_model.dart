import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'upload_file_model.g.dart';
@JsonSerializable()
class UploadFileModel{
  final String? title; 
  final String? content; 
  @FileConvert()
  final File? imageFile; 
  final int? userCreatedId;

  UploadFileModel(this.title, this.content, this.imageFile, this.userCreatedId);

  factory UploadFileModel.fromJson(Map<String, dynamic> json) => _$UploadFileModelFromJson(json);
  Map<String, dynamic> toJson() => _$UploadFileModelToJson(this);
}

class FileConvert implements JsonConverter<File?, String?> { 
  const FileConvert();
  @override
  File? fromJson(String? json) {
    if (json == null || json.isEmpty) return null;
    return File(json);
  }

  @override
  String? toJson(File? object) {
    return object?.path;
  }
}