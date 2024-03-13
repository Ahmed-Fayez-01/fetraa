part of 'get_videos_by_id_cubit.dart';

@immutable
abstract class GetVideosByIdState {}

class GetVideosByIdInitial extends GetVideosByIdState {}
class UserGetVideosByIdLoadingState extends GetVideosByIdState {}
class UserGetVideosByIdSuccessState extends GetVideosByIdState {
  VideoModel model;
  UserGetVideosByIdSuccessState(this.model);
}
class UserGetVideosByIdErrorState extends GetVideosByIdState {
  final String errMessage;
  UserGetVideosByIdErrorState(this.errMessage);
}
