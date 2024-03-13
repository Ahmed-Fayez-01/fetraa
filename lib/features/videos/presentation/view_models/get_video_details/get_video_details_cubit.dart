import 'package:fetraa/features/videos/data/repos/video_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/video_details_model.dart';



part 'get_video_details_state.dart';

class GetVideoDetailsCubit extends Cubit<GetVideoDetailsState> {
  GetVideoDetailsCubit(this.videoRepo) : super(GetVideoDetailsInitial());
  static GetVideoDetailsCubit get(context) => BlocProvider.of(context);
  VideoRepo? videoRepo;
  Future<void> getVideoDetails({required String id}) async {
    emit(UserGetVideoDetailsLoadingState());
    var result = await videoRepo!.getVideoDetails(id: id);
    return result.fold((failure) {
      emit(UserGetVideoDetailsErrorState(failure.errMessage));
    }, (data) {
      emit(UserGetVideoDetailsSuccessState(data));
    });
  }
}
