import 'package:dartz/dartz.dart';
import 'package:fetraa/features/blogs/data/models/category_blodg_model.dart';
import '../../../../core/errors/failure.dart';
import '../models/blog_model.dart';

abstract class BlogRepo{
  Future<Either<Failure,BlogModel>> getBlogsById({required String id});
  Future<Either<Failure,CategoryBlogsModel>> getAllCategoryBlogs();
}