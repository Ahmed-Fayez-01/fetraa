import 'package:dartz/dartz.dart';
import 'package:fetraa/features/store/data/models/product_details_model.dart';
import 'package:fetraa/features/store/data/models/store_categories.dart';
import 'package:fetraa/features/store/data/models/store_model.dart';
import '../../../../core/errors/failure.dart';

abstract class StoreRepo{
  Future<Either<Failure,StoreModel>> getStoreById({required String id});
  Future<Either<Failure,ProductDetailsModel>> getProductDetails({required String id});
  Future<Either<Failure,StoreCategories>> getAllCategoryStore();
}