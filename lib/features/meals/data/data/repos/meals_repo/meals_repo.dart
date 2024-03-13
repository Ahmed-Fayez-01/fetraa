import 'package:dartz/dartz.dart';
import '../../../../../../core/errors/failure.dart';
import '../../models/meal_details_model.dart';
import '../../models/meal_model.dart';

abstract class MealsRepo{
  Future<Either<Failure,MealModel>> getAllMeals();
  Future<Either<Failure,MealDetailsModel>> getMealById({required String id});
}