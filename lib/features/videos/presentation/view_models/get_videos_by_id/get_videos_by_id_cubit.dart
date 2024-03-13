import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/video_model.dart';
import '../../../data/repos/video_repo.dart';


part 'get_videos_by_id_state.dart';

class GetVideosByIdCubit extends Cubit<GetVideosByIdState> {
  GetVideosByIdCubit(this.videoRepo) : super(GetVideosByIdInitial());
  static GetVideosByIdCubit get(context) => BlocProvider.of(context);
  VideoRepo? videoRepo;
  Future<void> getVideosById({required String type}) async {
    emit(UserGetVideosByIdLoadingState());
    var result = await videoRepo!.getVideosById(type: type);
    return result.fold((failure) {
      print(failure.errMessage);
      emit(UserGetVideosByIdErrorState(failure.errMessage));
    }, (data) {
      print("ghgfhjhjhfylhgfl");
      emit(UserGetVideosByIdSuccessState(data));
    });
  }
}
