import 'package:fetraa/features/videos/data/models/video_categories.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repos/video_repo.dart';


part 'get_all_categories_video_state.dart';

class GetAllCategoriesVideoCubit extends Cubit<GetAllCategoriesVideoState> {
  GetAllCategoriesVideoCubit(this.videoRepo) : super(GetAllCategoriesVideoInitial());
  static GetAllCategoriesVideoCubit get(context) => BlocProvider.of(context);
  VideoRepo? videoRepo;
  Future<void> getAllCategoriesVideos() async {
    emit(UserGetAllCategoriesVideoLoadingState());
    var result = await videoRepo!.getAllCategoryVideos();
    return result.fold((failure) {
      emit(UserGetAllCategoriesVideoErrorState(failure.errMessage));
    }, (data) {
      emit(UserGetAllCategoriesVideoSuccessState(data));
    });
  }
}
