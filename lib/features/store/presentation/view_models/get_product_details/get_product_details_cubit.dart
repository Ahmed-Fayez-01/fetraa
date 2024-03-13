import 'package:fetraa/features/store/data/models/product_details_model.dart';
import 'package:fetraa/features/store/data/models/store_categories.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repos/stroe_repo.dart';


part 'get_product_details_state.dart';

class GetProductDetailsCubit extends Cubit<GetProductDetailsState> {
  GetProductDetailsCubit(this.storeRepo) : super(GetProductDetailsInitial());
  static GetProductDetailsCubit get(context) => BlocProvider.of(context);
  StoreRepo? storeRepo;
  Future<void> getProductDetails({required String id}) async {
    emit(UserGetProductDetailsLoadingState());
    var result = await storeRepo!.getProductDetails(id: id);
    return result.fold((failure) {
      emit(UserGetProductDetailsErrorState(failure.errMessage));
    }, (data) {
      emit(UserGetProductDetailsSuccessState(data));
    });
  }
}
