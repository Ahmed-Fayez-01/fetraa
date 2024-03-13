import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fetraa/features/fat_calculator/data/models/fat_calc_model.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/utils/services/remote_services/api_service.dart';
import '../../../../core/utils/services/remote_services/endpoints.dart';
import 'fat_repo.dart';

class FatRepoImpl implements FatRepo {
  final ApiService? apiService;

  FatRepoImpl(this.apiService);

  @override
  Future<Either<Failure, FatCalcModel>> calculateFemaleFats({required String weight, required String height, required String neck, required String middle, required String hip}) async{
    try {
      var response = await apiService!.postData(
        endPoint: EndPoints.rateFemale,
          sendToken: true,
        data: {
          "weight":weight,
          "height":height,
          "neck":neck,
          "middle":middle,
          "hip":hip,
        }
      );
      var result = FatCalcModel.fromJson(response.data);
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
  Future<Either<Failure, FatCalcModel>> calculateMaleFats({required String weight, required String height, required String neck, required String middle}) async{
    try {
      var response = await apiService!.postData(
        endPoint:  EndPoints.rateMale,
        sendToken: true,
          data: {
            "weight":weight,
            "height":height,
            "neck":neck,
            "middle":middle,
          }
      );
      var result = FatCalcModel.fromJson(response.data);
      return right(result);
    } catch (e) {
      print("ffffffff${e.toString()}");
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }


}
