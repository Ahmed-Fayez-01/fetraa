import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/subscribtion_model.dart';
import '../../../data/repos/trainer_repo.dart';

part 'subscribe_trainer_state.dart';

class SubscribeTrainerCubit extends Cubit<SubscribeTrainerState> {
  SubscribeTrainerCubit(this.trainerRepo) : super(SubscribeTrainerInitial());
  static SubscribeTrainerCubit get(context) => BlocProvider.of(context);
  TrainerRepo? trainerRepo;
  Future<void> subscribeTrainer({required String id}) async {
    emit(UserSubscribeTrainerLoadingState());
    var result = await trainerRepo!.subscribeTrainer(trainerId: id);
    return result.fold((failure) {
      emit(UserSubscribeTrainerErrorState(failure.errMessage));
    }, (data) {
      emit(UserSubscribeTrainerSuccessState(data));
    });
  }
}
