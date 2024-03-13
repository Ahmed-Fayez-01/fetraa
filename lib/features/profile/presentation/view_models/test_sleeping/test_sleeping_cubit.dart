import 'package:fetraa/features/profile/data/models/sleeping_model.dart';
import 'package:fetraa/features/profile/data/repos/profile_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



part 'test_sleeping_state.dart';

class TestSleepingCubit extends Cubit<TestSleepingState> {
  TestSleepingCubit(this.profileRepo) : super(TestSleepingInitial());
  static TestSleepingCubit get(context) => BlocProvider.of(context);
  ProfileRepo? profileRepo;
  Future<void> testSleeping({required String from,required String to}) async {
    emit(UserTestSleepingLoadingState());
    var result = await profileRepo!.testSleeping(from: from, to: to);
    return result.fold((failure) {
      print(failure.errMessage);
      emit(UserTestSleepingErrorState(failure.errMessage));
    }, (data) {
      print("hshjgdhghggh");
      emit(UserTestSleepingSuccessState(data));
    });
  }
}
