

import 'package:journal_app/ui/domain/entity/user.entity.dart';
import 'package:journal_app/ui/data/models/user_model.dart';

abstract class UserRepository {
  Future<UserEntity> login(UserModel userRequest);
}