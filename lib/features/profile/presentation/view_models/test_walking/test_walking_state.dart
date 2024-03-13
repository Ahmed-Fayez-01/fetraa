part of 'test_walking_cubit.dart';

@immutable
abstract class TestWalkingState {}

class TestWalkingInitial extends TestWalkingState {}
class UserTestWalkingLoadingState extends TestWalkingState {}
class UserTestWalkingSuccessState extends TestWalkingState {
  WalkingModel model;
  UserTestWalkingSuccessState(this.model);
}
class UserTestWalkingErrorState extends TestWalkingState {
  final String errMessage;
  UserTestWalkingErrorState(this.errMessage);
}
