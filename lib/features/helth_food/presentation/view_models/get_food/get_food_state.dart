
import 'package:fetraa/features/helth_food/data/models/meals_model.dart';


abstract class GetFoodState {}

class GetFoodInitial extends GetFoodState {}
class UserGetFoodLoadingState extends GetFoodState {}
class UserGetFoodSuccessState extends GetFoodState {
  MealsModel model;
  UserGetFoodSuccessState(this.model);
}
class UserGetFoodErrorState extends GetFoodState {
  final String errMessage;
  UserGetFoodErrorState(this.errMessage);
}
