import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/constants.dart';
import '../../../data/models/trainers_model.dart';
import '../../../data/repos/trainer_repo.dart';


part 'get_all_trainers_blog_state.dart';

class GetAllTrainersCubit extends Cubit<GetAllTrainersState> {
  GetAllTrainersCubit(this.trainerRepo) : super(GetAllTrainersInitial());
  static GetAllTrainersCubit get(context) => BlocProvider.of(context);
  TrainerRepo? trainerRepo;
  Future<void> getAllTrainers({required String subscrip}) async {
    emit(UserGetAllTrainersLoadingState());
    var result = await trainerRepo!.getAllTrainers(subscrip: subscrip);
    return result.fold((failure) {
      emit(UserGetAllTrainersErrorState(failure.errMessage));
    }, (data) {
      AppConstants.model.clear();
      for(var item in data.data!)
      {
        AppConstants.model.add(item);
      }
      emit(UserGetAllTrainersSuccessState(data));
    });
  }
}
