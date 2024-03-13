
import 'package:dartz/dartz.dart';
import 'package:fetraa/features/profile/data/models/sleeping_model.dart';
import 'package:fetraa/features/profile/data/models/update_image_model.dart';
import 'package:fetraa/features/profile/data/models/walking_info_model.dart';
import 'package:fetraa/features/profile/data/models/walking_model.dart';
import '../../../../core/errors/failure.dart';

abstract class ProfileRepo{
  Future<Either<Failure,SleepingModel>> testSleeping({required String from,required String to});
  Future<Either<Failure,UpdateImageModel>> updateImage({required var image});
  Future<Either<Failure,WalkingModel>> testWalking({required String fats,required String category});
  Future<Either<Failure,WalkingInfoModel>> getWalkingInfo();
}