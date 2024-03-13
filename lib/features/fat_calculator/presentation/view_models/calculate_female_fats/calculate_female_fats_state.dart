
import '../../../data/models/fat_calc_model.dart';

abstract class CalculateFemaleFatsState {}

class CalculateFemaleFatsInitial extends CalculateFemaleFatsState {}
class UserCalculateFemaleFatsLoadingState extends CalculateFemaleFatsState {}
class UserCalculateFemaleFatsSuccessState extends CalculateFemaleFatsState {
  FatCalcModel model;
  UserCalculateFemaleFatsSuccessState(this.model);
}
class UserCalculateFemaleFatsErrorState extends CalculateFemaleFatsState {
  final String errMessage;
  UserCalculateFemaleFatsErrorState(this.errMessage);
}
