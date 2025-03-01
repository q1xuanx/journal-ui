

import 'package:injectable/injectable.dart';
import 'package:journal_app/ui/data/models/user_model.dart';
import 'package:journal_app/ui/domain/entity/user_entity.dart';
import 'package:journal_app/ui/domain/repository/user_repository.dart';


@injectable
class LoginUseCase {
  final UserRepository userRepository;
  LoginUseCase(this.userRepository);

  Future<UserEntity> login (UserModel userModel) async {
    return await userRepository.login(userModel);
  }
}