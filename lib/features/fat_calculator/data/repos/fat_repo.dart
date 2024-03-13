import 'package:dartz/dartz.dart';
import 'package:fetraa/features/fat_calculator/data/models/fat_calc_model.dart';
import '../../../../core/errors/failure.dart';

abstract class FatRepo{
  Future<Either<Failure,FatCalcModel>> calculateMaleFats({required String weight,required String height,required String neck,required String middle});
  Future<Either<Failure,FatCalcModel>> calculateFemaleFats({required String weight,required String height,required String neck,required String middle,required String hip});
}