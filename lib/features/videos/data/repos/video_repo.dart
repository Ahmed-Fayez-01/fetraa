import 'package:dartz/dartz.dart';
import 'package:fetraa/features/videos/data/models/video_categories.dart';
import 'package:fetraa/features/videos/data/models/video_model.dart';
import '../../../../core/errors/failure.dart';
import '../models/video_details_model.dart';

abstract class VideoRepo{
  Future<Either<Failure,VideoModel>> getVideosById({required String type});
  Future<Either<Failure,VideoDetailsModel>> getVideoDetails({required String id});
  Future<Either<Failure,VideoCategoriesModel>> getAllCategoryVideos();
}