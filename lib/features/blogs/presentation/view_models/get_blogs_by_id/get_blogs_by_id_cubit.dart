import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/blog_model.dart';
import '../../../data/repos/blog_repo.dart';


part 'get_blogs_by_id_state.dart';

class GetBlogsByIdCubit extends Cubit<GetBlogsByIdState> {
  GetBlogsByIdCubit(this.blogRepo) : super(GetBlogsByIdInitial());
  static GetBlogsByIdCubit get(context) => BlocProvider.of(context);
  BlogRepo? blogRepo;
  Future<void> getBlogsById({required String id}) async {
    emit(UserGetBlogsByIdLoadingState());
    var result = await blogRepo!.getBlogsById(id: id);
    return result.fold((failure) {
      emit(UserGetBlogsByIdErrorState(failure.errMessage));
    }, (data) {
      emit(UserGetBlogsByIdSuccessState(data));
    });
  }
}
