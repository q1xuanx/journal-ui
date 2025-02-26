
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:journal_app/ui/data/datasources/api/user_api.dart';
import 'package:journal_app/ui/domain/entity/user.entity.dart';
import 'package:journal_app/ui/data/models/user_model.dart';
import 'package:journal_app/ui/domain/repository/user_repository.dart';
import 'package:retrofit/retrofit.dart';


@LazySingleton(as: UserRepository)
class UserRepositoryImpl implements UserRepository {

  final UserApi userApi = UserApi(Dio(BaseOptions(contentType: "application/json")), baseUrl: "https://dabd-14-227-161-218.ngrok-free.app/user-service");
  
  @override
  Future<UserEntity> login (UserModel userRequest) async {
    UserEntity getUser = await userApi.loginRequest(userRequest);
    return getUser;
  }
}