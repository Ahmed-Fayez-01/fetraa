import 'package:fetraa/features/meals/data/data/models/meal_model.dart';
import 'package:fetraa/features/meals/data/data/repos/meals_repo/meals_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'get_all_meals_state.dart';

class GetAllMealsCubit extends Cubit<GetAllMealsState> {
  GetAllMealsCubit(this.mealRepo) : super(GetAllMealsInitial());
  static GetAllMealsCubit get(context) => BlocProvider.of(context);
  MealsRepo? mealRepo;
  Future<void> getAllMeals() async {
    emit(UserGetAllMealsLoadingState());
    var result = await mealRepo!.getAllMeals();
    return result.fold((failure) {
      emit(UserGetAllMealsErrorState(failure.errMessage));
    }, (data) {
      emit(UserGetAllMealsSuccessState(data));
    });
  }
}
