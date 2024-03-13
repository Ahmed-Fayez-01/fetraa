import 'package:fetraa/features/profile/data/models/sleeping_model.dart';
import 'package:fetraa/features/profile/data/repos/profile_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/walking_model.dart';



part 'test_walking_state.dart';

class TestWalkingCubit extends Cubit<TestWalkingState> {
  TestWalkingCubit(this.profileRepo) : super(TestWalkingInitial());
  static TestWalkingCubit get(context) => BlocProvider.of(context);
  ProfileRepo? profileRepo;
  Future<void> testWalking({required String fats,required String category}) async {
    emit(UserTestWalkingLoadingState());
    var result = await profileRepo!.testWalking(fats: fats, category: category);
    return result.fold((failure) {
      print(failure.errMessage);
      emit(UserTestWalkingErrorState(failure.errMessage));
    }, (data) {
      print("hshjgdhghggh");
      emit(UserTestWalkingSuccessState(data));
    });
  }
}
