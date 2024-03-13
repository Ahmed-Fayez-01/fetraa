import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fetraa/core/errors/failure.dart';
import 'package:fetraa/features/meals/data/data/models/meal_model.dart';

import '../../../../../../core/utils/services/remote_services/api_service.dart';
import '../../../../../../core/utils/services/remote_services/endpoints.dart';
import '../../models/meal_details_model.dart';
import 'meals_repo.dart';

class MealsRepoImpl implements MealsRepo {
  final ApiService? apiService;

  MealsRepoImpl(this.apiService);

  @override
  Future<Either<Failure, MealModel>> getAllMeals() async{
    try {
      var response = await apiService!.get(
        endPoint: EndPoints.getMeals,
      );
      var result = MealModel.fromJson(response.data);
      return right(result);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, MealDetailsModel>> getMealById({required String id}) async{
    try {
      var response = await apiService!.get(
        endPoint:  "${EndPoints.getMealDetails}$id",
        sendToken: true
      );
      var result = MealDetailsModel.fromJson(response.data);
      return right(result);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }



}
