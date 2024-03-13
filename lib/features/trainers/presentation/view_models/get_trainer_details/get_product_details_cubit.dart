import 'package:fetraa/features/trainers/data/models/trainer_details_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repos/trainer_repo.dart';



part 'get_product_details_state.dart';

class GetTrainerDetailsCubit extends Cubit<GetTrainerDetailsState> {
  GetTrainerDetailsCubit(this.storeRepo) : super(GetTrainerDetailsInitial());
  static GetTrainerDetailsCubit get(context) => BlocProvider.of(context);
  TrainerRepo? storeRepo;
  Future<void> getTrainerDetails({required String id}) async {
    emit(UserGetTrainerDetailsLoadingState());
    var result = await storeRepo!.getTrainerDetails(id: id);
    return result.fold((failure) {
      emit(UserGetTrainerDetailsErrorState(failure.errMessage));
    }, (data) {
      emit(UserGetTrainerDetailsSuccessState(data));
    });
  }
}
