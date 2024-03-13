part of 'get_blogs_by_id_cubit.dart';

@immutable
abstract class GetBlogsByIdState {}

class GetBlogsByIdInitial extends GetBlogsByIdState {}
class UserGetBlogsByIdLoadingState extends GetBlogsByIdState {}
class UserGetBlogsByIdSuccessState extends GetBlogsByIdState {
  BlogModel model;
  UserGetBlogsByIdSuccessState(this.model);
}
class UserGetBlogsByIdErrorState extends GetBlogsByIdState {
  final String errMessage;
  UserGetBlogsByIdErrorState(this.errMessage);
}
