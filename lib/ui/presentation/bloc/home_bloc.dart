


import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:journal_app/ui/domain/entity/post_entity.dart';
import 'package:journal_app/ui/domain/usecase/get_all_diary_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';
@injectable
class HomeBloc extends Cubit<HomeState>{
  final GetAllDiaryUsecase getAllDiaryUsecase;
  HomeBloc(this.getAllDiaryUsecase) : super(HomeState([]));
  Future<void> loadDiary() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    int? getId = shared.getInt('idUser');
    if (getId != null){
      int idUser = getId;
      List<PostEntity> listDiary = await getAllDiaryUsecase.getAllDiary(idUser);
      emit(HomeState.copyWith(listPost: listDiary));
    }
  }
}

class HomeState extends Equatable{
  List<PostEntity>? listPost;
  HomeState(this.listPost);

  @override
  List<Object?> get props => [listPost];

  HomeState.copyWith({List<PostEntity>? listPost}) {
    this.listPost = listPost ?? this.listPost;
  }

}