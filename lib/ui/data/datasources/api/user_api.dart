import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:journal_app/ui/data/models/user_model.dart';
import 'package:journal_app/ui/domain/entity/user.entity.dart';

part 'user_api.g.dart';

@RestApi()
abstract class UserApi {
  factory UserApi(Dio dio, {String baseUrl}) = _UserApi;

  @POST('/login')
  Future<UserEntity> loginRequest(@Body() UserModel userRequest);
}


