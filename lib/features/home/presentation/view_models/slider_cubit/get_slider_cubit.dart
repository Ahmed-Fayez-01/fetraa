import 'package:fetraa/features/home/data/models/slider_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repos/home_repo.dart';




part 'get_slider_state.dart';

class GetSliderCubit extends Cubit<GetSliderState> {
  GetSliderCubit(this.homeRepo) : super(GetSliderInitial());
  static GetSliderCubit get(context) => BlocProvider.of(context);
  HomeRepo? homeRepo;
  Future<void> getSlider() async {
    emit(UserGetSliderLoadingState());
    var result = await homeRepo!.getSlider();
    return result.fold((failure) {
      print(failure.errMessage);
      emit(UserGetSliderErrorState(failure.errMessage));
    }, (data) {
      print("hqjhafgfsgljshsj");
      emit(UserGetSliderSuccessState(data));
    });
  }
}
