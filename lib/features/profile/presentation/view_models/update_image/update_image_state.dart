part of 'update_image_cubit.dart';

@immutable
abstract class UpdateImageState {}

class UpdateImageInitial extends UpdateImageState {}
class UserUpdateImageLoadingState extends UpdateImageState {}
class UserUpdateImageSuccessState extends UpdateImageState {
  UpdateImageModel model ;
  UserUpdateImageSuccessState(this.model);
}
class UserUpdateImageErrorState extends UpdateImageState {
  final String errMessage;
  UserUpdateImageErrorState(this.errMessage);
}
