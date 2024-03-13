import 'package:flutter_bloc/flutter_bloc.dart';

import 'change_meal_state.dart';



class ChangeMealStatusCubit extends Cubit<ChangeMealStatusState> {
  ChangeMealStatusCubit() : super(ChangeMealStatusInitial());

  static ChangeMealStatusCubit get(context) => BlocProvider.of(context);

  int currentPage = 1;

  changeMealPlus(int maxValue) {
    if(currentPage < maxValue)
      {
        currentPage ++;
      }
    emit(ChangeMealStatusSuccessState());
  }
  changeMealMinus() {
    if(currentPage>1)
      {
        currentPage --;
      }
    emit(ChangeMealStatusSuccessState());
  }
}
