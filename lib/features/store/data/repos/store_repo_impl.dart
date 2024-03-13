import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fetraa/features/store/data/models/product_details_model.dart';
import 'package:fetraa/features/store/data/models/store_categories.dart';
import 'package:fetraa/features/store/data/models/store_model.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/utils/services/remote_services/api_service.dart';
import '../../../../core/utils/services/remote_services/endpoints.dart';
import 'stroe_repo.dart';

class StoreRepoImpl implements StoreRepo {
  final ApiService? apiService;

  StoreRepoImpl(this.apiService);


  @override
  Future<Either<Failure, StoreModel>> getStoreById({required String id}) async {
    try {
      var response = await apiService!.get(
          endPoint:  "${EndPoints.getStoreWithId}$id",
      );
      var result = StoreModel.fromJson(response.data);
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
  Future<Either<Failure, StoreCategories>> getAllCategoryStore() async{
    try {
      var response = await apiService!.get(
          endPoint:  EndPoints.getAllCategoryStore,
      );
      var result = StoreCategories.fromJson(response.data);
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
  Future<Either<Failure, ProductDetailsModel>> getProductDetails({required String id}) async{
    try {
      var response = await apiService!.get(
        endPoint:  "${EndPoints.getProductDetails}$id",
      );
      var result = ProductDetailsModel.fromJson(response.data);
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
