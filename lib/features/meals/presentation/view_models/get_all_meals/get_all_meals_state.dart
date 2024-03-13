part of 'get_all_meals_cubit.dart';

@immutable
abstract class GetAllMealsState {}

class GetAllMealsInitial extends GetAllMealsState {}
class UserGetAllMealsLoadingState extends GetAllMealsState {}
class UserGetAllMealsSuccessState extends GetAllMealsState {
  MealModel model;
  UserGetAllMealsSuccessState(this.model);
}
class UserGetAllMealsErrorState extends GetAllMealsState {
  final String errMessage;
  UserGetAllMealsErrorState(this.errMessage);
}
