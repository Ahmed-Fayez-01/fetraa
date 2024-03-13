import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repos/fat_repo.dart';
import 'calculate_male_fats_state.dart';

class CalculateMaleFatsCubit extends Cubit<CalculateMaleFatsState> {
  CalculateMaleFatsCubit(this.fatRepo) : super(CalculateMaleFatsInitial());
  static CalculateMaleFatsCubit get(context) => BlocProvider.of(context);
  FatRepo? fatRepo;
  Future<void> calculateMaleFats({required String weight,required String height,required String neck,required String middle}) async {
    emit(UserCalculateMaleFatsLoadingState());
    var result = await fatRepo!.calculateMaleFats(weight: weight, height: height, neck: neck, middle: middle);
    return result.fold((failure) {
      print("dad${failure.errMessage}");
      emit(UserCalculateMaleFatsErrorState(failure.errMessage));
    }, (data) {
      print("gaggagagaagagagaga");
      emit(UserCalculateMaleFatsSuccessState(data));
    });
  }
}