import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fetraa/features/home/data/models/slider_model.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/utils/services/remote_services/api_service.dart';
import '../../../../core/utils/services/remote_services/endpoints.dart';
import 'home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService? apiService;

  HomeRepoImpl(this.apiService);

  @override
  Future<Either<Failure, SliderModel>> getSlider() async{
    try {
      var response = await apiService!.get(
        endPoint:  EndPoints.getSlider,
        sendToken: true
      );
      var result = SliderModel.fromJson(response.data);
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
