import 'package:fetraa/features/store/data/models/store_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/constants.dart';
import '../../../data/repos/stroe_repo.dart';

part 'get_store_by_id_state.dart';

class GetStoreByIdCubit extends Cubit<GetStoreByIdState> {
  GetStoreByIdCubit(this.storeRepo) : super(GetStoreByIdInitial());
  static GetStoreByIdCubit get(context) => BlocProvider.of(context);
  StoreRepo? storeRepo;
  Future<void> getStoreById({required String id}) async {
    emit(UserGetStoreByIdLoadingState());
    var result = await storeRepo!.getStoreById(id: id);
    return result.fold((failure) {
      emit(UserGetStoreByIdErrorState(failure.errMessage));
    }, (data) {
      AppConstants.storeModel.clear();
      for(var item in data.data!)
      {
        AppConstants.storeModel.add(item);
      }
      emit(UserGetStoreByIdSuccessState(data));
    });
  }
}
