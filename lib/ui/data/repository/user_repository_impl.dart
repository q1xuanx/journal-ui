
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:journal_app/ui/data/datasources/api/user_api.dart';
import 'package:journal_app/ui/data/models/upload_file_model.dart';
import 'package:journal_app/ui/domain/entity/create_user_entity.dart';
import 'package:journal_app/ui/domain/entity/post_entity.dart';
import 'package:journal_app/ui/domain/entity/user_entity.dart';
import 'package:journal_app/ui/data/models/user_model.dart';
import 'package:journal_app/ui/domain/repository/user_repository.dart';
import 'package:retrofit/retrofit.dart';


@LazySingleton(as: UserRepository)
class UserRepositoryImpl implements UserRepository {

  final UserApi userApi = UserApi(Dio(BaseOptions(contentType: "application/json")), baseUrl: "https://e5cc-45-122-246-19.ngrok-free.app/user-service");
  final UserApi diaryApi = UserApi(Dio(BaseOptions(contentType: "application/json")), baseUrl: "https://e5cc-45-122-246-19.ngrok-free.app/post-service");
  @override
  Future<UserEntity> login (UserModel userRequest) async {
    UserEntity getUser = await userApi.loginRequest(userRequest);
    return getUser;
  }

  @override
  Future<String> createUser(CreateUserEntity createUser) {
    // TODO: implement createUser
    throw UnimplementedError();
  }
  @override
  Future<String> deleteDiary(int idPost, int idUser) {
    // TODO: implement deleteDiary
    throw UnimplementedError();
  }
  @override
  Future<List<PostEntity>> getAllPostOfUser(int idUser) async {
    List<PostEntity> listPost = await diaryApi.getListPostOfUser(idUser);
    return listPost;
  }
  @override
  Future<String> uploadDiary(UploadFileModel uploadFile) {
    // TODO: implement uploadDiary
    throw UnimplementedError();
  }

}