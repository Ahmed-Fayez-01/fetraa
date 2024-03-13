
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:fetraa/core/errors/failure.dart';

import 'package:fetraa/features/profile/data/models/sleeping_model.dart';
import 'package:fetraa/features/profile/data/models/update_image_model.dart';
import 'package:fetraa/features/profile/data/models/walking_info_model.dart';
import 'package:fetraa/features/profile/data/models/walking_model.dart';

import '../../../../core/utils/services/remote_services/api_service.dart';
import '../../../../core/utils/services/remote_services/endpoints.dart';
import 'profile_repo.dart';

class ProfileRepoImpl implements ProfileRepo {
  final ApiService? apiService;

  ProfileRepoImpl(this.apiService);

  @override
  Future<Either<Failure, SleepingModel>> testSleeping({required String from, required String to}) async{
    try {
      var response = await apiService!.postData(
        endPoint:  EndPoints.sleepingTest,
        data: {
          "start_time":from,
          "end_time":to,
        },
        sendToken: true
      );
      var result = SleepingModel.fromJson(response.data);
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
  Future<Either<Failure, UpdateImageModel>> updateImage({required var image}) async{
    try {
      var response = await apiService!.postData(
          endPoint:  EndPoints.updateImage,
          data: {
            "img":image,
          },
          sendToken: true
      );
      var result = UpdateImageModel.fromJson(response.data);
      return right(result);
    } catch (e) {
      print("ffffffffffffff${e.toString()}");
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, WalkingInfoModel>> getWalkingInfo() async{
    try {
      var response = await apiService!.get(
          endPoint:  EndPoints.walkingCategories,
          sendToken: true
      );
      var result = WalkingInfoModel.fromJson(response.data);
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
  Future<Either<Failure, WalkingModel>> testWalking({required String fats, required String category}) async{
    try {
      var response = await apiService!.postData(
          endPoint:  EndPoints.walkingTest,
          data: {
            "fat":fats,
            "category_id":category,
          },
          sendToken: true
      );
      var result = WalkingModel.fromJson(response.data);
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
