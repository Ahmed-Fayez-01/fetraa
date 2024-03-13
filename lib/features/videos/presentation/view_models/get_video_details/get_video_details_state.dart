part of 'get_video_details_cubit.dart';

@immutable
abstract class GetVideoDetailsState {}

class GetVideoDetailsInitial extends GetVideoDetailsState {}
class UserGetVideoDetailsLoadingState extends GetVideoDetailsState {}
class UserGetVideoDetailsSuccessState extends GetVideoDetailsState {
  VideoDetailsModel model;
  UserGetVideoDetailsSuccessState(this.model);
}
class UserGetVideoDetailsErrorState extends GetVideoDetailsState {
  final String errMessage;
  UserGetVideoDetailsErrorState(this.errMessage);
}
