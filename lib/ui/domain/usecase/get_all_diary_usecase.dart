

import 'package:injectable/injectable.dart';
import 'package:journal_app/ui/domain/entity/post_entity.dart';
import 'package:journal_app/ui/domain/repository/user_repository.dart';

@Injectable()
class GetAllDiaryUsecase {
  final UserRepository userRepository; 
  GetAllDiaryUsecase(this.userRepository);
  Future<List<PostEntity>> getAllDiary(int idUser) async => await userRepository.getAllPostOfUser(idUser);
}