import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fetraa/features/videos/data/models/video_categories.dart';
import 'package:fetraa/features/videos/data/models/video_details_model.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/utils/services/remote_services/api_service.dart';
import '../../../../core/utils/services/remote_services/endpoints.dart';
import '../models/video_model.dart';
import 'video_repo.dart';

class VideoRepoImpl implements VideoRepo {
  final ApiService? apiService;

  VideoRepoImpl(this.apiService);


  @override
  Future<Either<Failure, VideoModel>> getVideosById({required String type}) async {
    try {
      var response = await apiService!.get(
          endPoint:  EndPoints.getAllVideosById,
        sendToken: true,
        query: {
            "type":type
        }
      );
      var result = VideoModel.fromJson(response.data);
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
  Future<Either<Failure, VideoCategoriesModel>> getAllCategoryVideos() async{
    try {
      var response = await apiService!.get(
          endPoint:  EndPoints.getAllCategoryVideo,
      );
      var result = VideoCategoriesModel.fromJson(response.data);
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
  Future<Either<Failure, VideoDetailsModel>> getVideoDetails({required String id}) async{
    try {
      var response = await apiService!.get(
        endPoint:  "${EndPoints.getVideoDetails}$id",
        sendToken: true
      );
      var result = VideoDetailsModel.fromJson(response.data);
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
