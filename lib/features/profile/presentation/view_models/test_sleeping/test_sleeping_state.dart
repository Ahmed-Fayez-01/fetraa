part of 'test_sleeping_cubit.dart';

@immutable
abstract class TestSleepingState {}

class TestSleepingInitial extends TestSleepingState {}
class UserTestSleepingLoadingState extends TestSleepingState {}
class UserTestSleepingSuccessState extends TestSleepingState {
  SleepingModel model;
  UserTestSleepingSuccessState(this.model);
}
class UserTestSleepingErrorState extends TestSleepingState {
  final String errMessage;
  UserTestSleepingErrorState(this.errMessage);
}
