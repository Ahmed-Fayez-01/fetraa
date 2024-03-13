import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fetraa/features/blogs/data/models/category_blodg_model.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/utils/services/remote_services/api_service.dart';
import '../../../../core/utils/services/remote_services/endpoints.dart';
import '../models/blog_model.dart';
import 'blog_repo.dart';

class BlogRepoImpl implements BlogRepo {
  final ApiService? apiService;

  BlogRepoImpl(this.apiService);


  @override
  Future<Either<Failure, BlogModel>> getBlogsById({required String id}) async {
    try {
      var response = await apiService!.get(
          endPoint:  "${EndPoints.getBlogsWithId}$id",
      );
      var result = BlogModel.fromJson(response.data);
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
  Future<Either<Failure, CategoryBlogsModel>> getAllCategoryBlogs() async{
    try {
      var response = await apiService!.get(
          endPoint:  EndPoints.getAllCategoryBlogs,
      );
      var result = CategoryBlogsModel.fromJson(response.data);
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
