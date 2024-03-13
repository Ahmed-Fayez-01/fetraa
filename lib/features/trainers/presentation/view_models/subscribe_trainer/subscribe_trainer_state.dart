part of 'subscribe_trainer_cubit.dart';

@immutable
abstract class SubscribeTrainerState {}

class SubscribeTrainerInitial extends SubscribeTrainerState {}
class UserSubscribeTrainerLoadingState extends SubscribeTrainerState {}
class UserSubscribeTrainerSuccessState extends SubscribeTrainerState {
  SubscribtionModel model;
  UserSubscribeTrainerSuccessState(this.model);
}
class UserSubscribeTrainerErrorState extends SubscribeTrainerState {
  final String errMessage;
  UserSubscribeTrainerErrorState(this.errMessage);
}
