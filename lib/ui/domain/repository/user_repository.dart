

import 'package:journal_app/ui/data/models/upload_file_model.dart';
import 'package:journal_app/ui/domain/entity/create_user_entity.dart';
import 'package:journal_app/ui/domain/entity/post_entity.dart';
import 'package:journal_app/ui/domain/entity/user_entity.dart';
import 'package:journal_app/ui/data/models/user_model.dart';

abstract class UserRepository {
  Future<UserEntity> login(UserModel userRequest);
  Future<String> createUser(CreateUserEntity createUser);
  Future<String> uploadDiary(UploadFileModel uploadFile); 
  Future<String> deleteDiary(int idPost, int idUser);
  Future<List<PostEntity>> getAllPostOfUser(int idUser);
}
