import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:journal_app/ui/data/models/user_model.dart';
import 'package:journal_app/ui/domain/entity/user.entity.dart';
import 'package:journal_app/ui/domain/usecase/login_usecase.dart';

class UserBloc extends Cubit<UserState> {
  final LoginUseCase loginUseCase;
  UserBloc(this.loginUseCase) : super(UserState(-1,'', '', ''));
  Future<void> login(String username, String password) async {
    UserEntity user = await loginUseCase.login(UserModel(username, password));
    emit(UserState(user.id, user.username, user.password, user.fullName));
    return;
  }

}

class UserState extends Equatable {
  final int id;
  final String username;
  final String password;
  final String fullName;
  @override
  List<Object?> get props => [username, password];
  const UserState(this.id, this.username, this.password, this.fullName);
}