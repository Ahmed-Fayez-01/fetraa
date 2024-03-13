import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repos/fat_repo.dart';
import 'calculate_female_fats_state.dart';

class CalculateFemaleFatsCubit extends Cubit<CalculateFemaleFatsState> {
  CalculateFemaleFatsCubit(this.fatRepo) : super(CalculateFemaleFatsInitial());
  static CalculateFemaleFatsCubit get(context) => BlocProvider.of(context);
  FatRepo? fatRepo;
  Future<void> calculateFemaleFats({required String weight,required String height,required String neck,required String middle,required String hip}) async {
    emit(UserCalculateFemaleFatsLoadingState());
    var result = await fatRepo!.calculateFemaleFats(weight: weight, height: height, neck: neck, middle: middle, hip: hip);
    return result.fold((failure) {
      emit(UserCalculateFemaleFatsErrorState(failure.errMessage));
    }, (data) {
      emit(UserCalculateFemaleFatsSuccessState(data));
    });
  }
}