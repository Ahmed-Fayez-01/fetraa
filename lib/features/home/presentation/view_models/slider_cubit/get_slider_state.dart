part of 'get_slider_cubit.dart';

@immutable
abstract class GetSliderState {}

class GetSliderInitial extends GetSliderState {}
class UserGetSliderLoadingState extends GetSliderState {}
class UserGetSliderSuccessState extends GetSliderState {
  SliderModel model;
  UserGetSliderSuccessState(this.model);
}
class UserGetSliderErrorState extends GetSliderState {
  final String errMessage;
  UserGetSliderErrorState(this.errMessage);
}
