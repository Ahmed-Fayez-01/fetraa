part of 'get_all_categories_blog_cubit.dart';

@immutable
abstract class GetAllCategoriesBlogState {}

class GetAllCategoriesBlogInitial extends GetAllCategoriesBlogState {}
class UserGetAllCategoriesBlogLoadingState extends GetAllCategoriesBlogState {}
class UserGetAllCategoriesBlogSuccessState extends GetAllCategoriesBlogState {
  CategoryBlogsModel model;
  UserGetAllCategoriesBlogSuccessState(this.model);
}
class UserGetAllCategoriesBlogErrorState extends GetAllCategoriesBlogState {
  final String errMessage;
  UserGetAllCategoriesBlogErrorState(this.errMessage);
}
