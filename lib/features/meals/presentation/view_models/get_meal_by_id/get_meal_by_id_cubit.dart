import 'package:fetraa/features/meals/data/data/models/meal_model.dart';
import 'package:fetraa/features/meals/data/data/repos/meals_repo/meals_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/data/models/meal_details_model.dart';


part 'get_meal_by_id_state.dart';

class GetMealByIdCubit extends Cubit<GetMealByIdState> {
  GetMealByIdCubit(this.mealRepo) : super(GetMealByIdInitial());
  static GetMealByIdCubit get(context) => BlocProvider.of(context);
  MealsRepo? mealRepo;
  Future<void> getMealById({required String id}) async {
    emit(UserGetMealByIdLoadingState());
    var result = await mealRepo!.getMealById(id: id);
    return result.fold((failure) {
      emit(UserGetMealByIdErrorState(failure.errMessage));
    }, (data) {
      emit(UserGetMealByIdSuccessState(data));
    });
  }
}
