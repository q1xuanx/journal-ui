// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:journal_app/ui/data/repository/user_repository_impl.dart'
    as _i956;
import 'package:journal_app/ui/domain/repository/user_repository.dart' as _i897;
import 'package:journal_app/ui/domain/usecase/get_all_diary_usecase.dart'
    as _i176;
import 'package:journal_app/ui/domain/usecase/login_usecase.dart' as _i115;
import 'package:journal_app/ui/presentation/bloc/home_bloc.dart' as _i982;
import 'package:journal_app/ui/presentation/bloc/user_bloc.dart' as _i945;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i897.UserRepository>(() => _i956.UserRepositoryImpl());
    gh.factory<_i115.LoginUseCase>(
        () => _i115.LoginUseCase(gh<_i897.UserRepository>()));
    gh.factory<_i176.GetAllDiaryUsecase>(
        () => _i176.GetAllDiaryUsecase(gh<_i897.UserRepository>()));
    gh.factory<_i945.UserBloc>(() => _i945.UserBloc(gh<_i115.LoginUseCase>()));
    gh.factory<_i982.HomeBloc>(
        () => _i982.HomeBloc(gh<_i176.GetAllDiaryUsecase>()));
    return this;
  }
}
