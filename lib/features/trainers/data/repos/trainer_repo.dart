import 'package:dartz/dartz.dart';
import 'package:fetraa/features/trainers/data/models/subscribtion_model.dart';
import 'package:fetraa/features/trainers/data/models/trainer_details_model.dart';
import '../../../../core/errors/failure.dart';
import '../models/trainers_model.dart';

abstract class TrainerRepo{
  Future<Either<Failure,TrainersModel>> getAllTrainers({required String subscrip});
  Future<Either<Failure,TrainerDetailsModel>> getTrainerDetails({required String id});
  Future<Either<Failure,SubscribtionModel>> subscribeTrainer({required String trainerId});
}