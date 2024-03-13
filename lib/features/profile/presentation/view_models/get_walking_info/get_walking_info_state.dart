part of 'get_walking_info_cubit.dart';

@immutable
abstract class GetWalkingInfoState {}

class GetWalkingInfoInitial extends GetWalkingInfoState {}
class UserGetWalkingInfoLoadingState extends GetWalkingInfoState {}
class UserGetWalkingInfoSuccessState extends GetWalkingInfoState {
  WalkingInfoModel model ;
  UserGetWalkingInfoSuccessState(this.model);
}
class UserGetWalkingInfoErrorState extends GetWalkingInfoState {
  final String errMessage;
  UserGetWalkingInfoErrorState(this.errMessage);
}
