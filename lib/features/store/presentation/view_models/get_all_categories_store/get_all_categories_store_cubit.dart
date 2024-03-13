import 'package:fetraa/features/store/data/models/store_categories.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repos/stroe_repo.dart';


part 'get_all_categories_store_state.dart';

class GetAllCategoriesStoreCubit extends Cubit<GetAllCategoriesStoreState> {
  GetAllCategoriesStoreCubit(this.storeRepo) : super(GetAllCategoriesStoreInitial());
  static GetAllCategoriesStoreCubit get(context) => BlocProvider.of(context);
  StoreRepo? storeRepo;
  Future<void> getAllCategoriesStores() async {
    emit(UserGetAllCategoriesStoreLoadingState());
    var result = await storeRepo!.getAllCategoryStore();
    return result.fold((failure) {
      emit(UserGetAllCategoriesStoreErrorState(failure.errMessage));
    }, (data) {
      emit(UserGetAllCategoriesStoreSuccessState(data));
    });
  }
}
