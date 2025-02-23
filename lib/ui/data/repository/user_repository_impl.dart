

import 'package:journal_app/ui/data/datasources/api/user_api.dart';
import 'package:journal_app/ui/domain/entity/user.entity.dart';
import 'package:journal_app/ui/data/models/user_model.dart';
import 'package:journal_app/ui/domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {

  final UserApi userApi;

  UserRepositoryImpl(this.userApi);

  @override
  Future<UserEntity> login (UserModel userRequest) async {
    UserEntity getUser = await userApi.loginRequest(userRequest);
    return getUser;
  }
}