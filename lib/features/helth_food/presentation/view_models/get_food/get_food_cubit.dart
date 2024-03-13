import 'package:fetraa/core/utils/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repos/health_food_repo.dart';
import 'get_food_state.dart';


class GetFoodCubit extends Cubit<GetFoodState> {
  GetFoodCubit(this.healthRepo) : super(GetFoodInitial());
  static GetFoodCubit get(context) => BlocProvider.of(context);
  HealthFoodRepo? healthRepo;
  Future<void> getFood({required String numberMeals}) async {
    emit(UserGetFoodLoadingState());
    var result = await healthRepo!.getFood(numberMeals: numberMeals);
    return result.fold((failure) {
      emit(UserGetFoodErrorState(failure.errMessage));
    }, (data) {
      emit(UserGetFoodSuccessState(data));
    });
  }
}