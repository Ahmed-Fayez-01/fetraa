part of 'get_all_trainers_blog_cubit.dart';

@immutable
abstract class GetAllTrainersState {}

class GetAllTrainersInitial extends GetAllTrainersState {}
class UserGetAllTrainersLoadingState extends GetAllTrainersState {}
class UserGetAllTrainersSuccessState extends GetAllTrainersState {
  TrainersModel model;
  UserGetAllTrainersSuccessState(this.model);
}
class UserGetAllTrainersErrorState extends GetAllTrainersState {
  final String errMessage;
  UserGetAllTrainersErrorState(this.errMessage);
}
