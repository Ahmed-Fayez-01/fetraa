part of 'get_all_categories_video_cubit.dart';

@immutable
abstract class GetAllCategoriesVideoState {}

class GetAllCategoriesVideoInitial extends GetAllCategoriesVideoState {}
class UserGetAllCategoriesVideoLoadingState extends GetAllCategoriesVideoState {}
class UserGetAllCategoriesVideoSuccessState extends GetAllCategoriesVideoState {
  VideoCategoriesModel model;
  UserGetAllCategoriesVideoSuccessState(this.model);
}
class UserGetAllCategoriesVideoErrorState extends GetAllCategoriesVideoState {
  final String errMessage;
  UserGetAllCategoriesVideoErrorState(this.errMessage);
}
