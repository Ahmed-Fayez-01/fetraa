import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fetraa/features/helth_food/data/models/meals_model.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/utils/services/remote_services/api_service.dart';
import '../../../../core/utils/services/remote_services/endpoints.dart';
import 'health_food_repo.dart';

class HealthFoodRepoImpl implements HealthFoodRepo {
  final ApiService? apiService;

 HealthFoodRepoImpl(this.apiService);

  @override
  Future<Either<Failure, MealsModel>> getFood({required String numberMeals}) async{
    try {
      var response = await apiService!.postData(
          endPoint: EndPoints.getFood,
          sendToken: true,
          data: {
            "number_meals":numberMeals,
          }
      );
      var result = MealsModel.fromJson(response.data);

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
