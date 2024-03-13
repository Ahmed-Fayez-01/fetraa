import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fetraa/features/trainers/data/models/subscribtion_model.dart';
import 'package:fetraa/features/trainers/data/models/trainer_details_model.dart';
import 'package:fetraa/features/trainers/data/models/trainers_model.dart';
import 'package:fetraa/features/trainers/data/repos/trainer_repo.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/utils/services/remote_services/api_service.dart';
import '../../../../core/utils/services/remote_services/endpoints.dart';

class TrainerRepoImpl implements TrainerRepo {
  final ApiService? apiService;

  TrainerRepoImpl(this.apiService);



  @override
  Future<Either<Failure, TrainersModel>> getAllTrainers({required String subscrip}) async{
    try {
      var response = await apiService!.get(
        endPoint:  EndPoints.getAllTrainers,
        sendToken: true,
        query: {
          "subscrip":subscrip
        }
      );
      var result = TrainersModel.fromJson(response.data);
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
  Future<Either<Failure, TrainerDetailsModel>> getTrainerDetails({required String id}) async{
    try {
      var response = await apiService!.get(
          endPoint:  "${EndPoints.getTrainerDetails}$id",
          sendToken: true
      );
      var result = TrainerDetailsModel.fromJson(response.data);
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
  Future<Either<Failure, SubscribtionModel>> subscribeTrainer({required String trainerId}) async{
    try {
      var response = await apiService!.postData(
          endPoint:  EndPoints.subscribeTrainer,
          data: {
            "trainer":trainerId
          },
          sendToken: true
      );
      var result = SubscribtionModel.fromJson(response.data);
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
