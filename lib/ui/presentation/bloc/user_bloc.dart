import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:journal_app/ui/data/models/user_model.dart';
import 'package:journal_app/ui/domain/entity/user_entity.dart';
import 'package:journal_app/ui/domain/usecase/login_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:logger/logger.dart';
@injectable
class UserBloc extends Cubit<UserState> {
  final LoginUseCase loginUseCase;
  UserBloc(this.loginUseCase) : super(UserState('', ''));
  Future<int> login(String username, String password) async {
    var logger = Logger(); 
    logger.d('$username $password');
    UserEntity user = await loginUseCase.login(UserModel(username, password));
    if (user.id != -1){
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setInt('idUser', user.id);
      pref.setString('username', user.username);
      pref.setString('password', user.password);
      pref.setString('fullName', user.fullName);
      return 1;
    }
    return -1;
  }
}

class UserState extends Equatable {
  String username;
  String password;
  @override
  List<Object?> get props => [username, password];
  UserState(this.username, this.password);
}