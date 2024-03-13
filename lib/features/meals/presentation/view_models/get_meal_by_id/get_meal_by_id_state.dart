part of 'get_meal_by_id_cubit.dart';

@immutable
abstract class GetMealByIdState {}

class GetMealByIdInitial extends GetMealByIdState {}
class UserGetMealByIdLoadingState extends GetMealByIdState {}
class UserGetMealByIdSuccessState extends GetMealByIdState {
  MealDetailsModel model;
  UserGetMealByIdSuccessState(this.model);
}
class UserGetMealByIdErrorState extends GetMealByIdState {
  final String errMessage;
  UserGetMealByIdErrorState(this.errMessage);
}
