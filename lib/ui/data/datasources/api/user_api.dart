import 'package:dio/dio.dart';
import 'package:journal_app/ui/data/models/upload_file_model.dart';
import 'package:journal_app/ui/domain/entity/post_entity.dart';
import 'package:retrofit/retrofit.dart';
import 'package:journal_app/ui/data/models/user_model.dart';
import 'package:journal_app/ui/domain/entity/user_entity.dart';
import 'package:journal_app/ui/domain/entity/create_user_entity.dart';

part 'user_api.g.dart';

@RestApi()
abstract class UserApi {
  factory UserApi(Dio dio, {String baseUrl}) = _UserApi;
  @POST('/login')
  Future<UserEntity> loginRequest(@Body() UserModel userRequest);
  @POST('/create')
  Future<String> signUp (@Body() CreateUserEntity createUser);
  @POST('/upload-diary')
  Future<String> uploadDiary(@Body() UploadFileModel uploadModel);
  @GET('/get-list/{idUser}')
  Future<List<PostEntity>> getListPostOfUser(@Path("idUser") int idUser);
  @DELETE('/delete-post/{idPost}/{idUser}')
  Future<String> deleteDiary (@Path("idPost") int idPost, @Path("idUser") int idUser);
}


