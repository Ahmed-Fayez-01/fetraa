import 'package:fetraa/features/blogs/data/models/category_blodg_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repos/blog_repo.dart';


part 'get_all_categories_blog_state.dart';

class GetAllCategoriesBlogCubit extends Cubit<GetAllCategoriesBlogState> {
  GetAllCategoriesBlogCubit(this.blogRepo) : super(GetAllCategoriesBlogInitial());
  static GetAllCategoriesBlogCubit get(context) => BlocProvider.of(context);
  BlogRepo? blogRepo;
  Future<void> getAllCategoriesBlogs() async {
    emit(UserGetAllCategoriesBlogLoadingState());
    var result = await blogRepo!.getAllCategoryBlogs();
    return result.fold((failure) {
      emit(UserGetAllCategoriesBlogErrorState(failure.errMessage));
    }, (data) {
      emit(UserGetAllCategoriesBlogSuccessState(data));
    });
  }
}
