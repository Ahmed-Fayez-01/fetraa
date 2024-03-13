
import '../../../data/models/fat_calc_model.dart';

abstract class CalculateMaleFatsState {}

class CalculateMaleFatsInitial extends CalculateMaleFatsState {}
class UserCalculateMaleFatsLoadingState extends CalculateMaleFatsState {}
class UserCalculateMaleFatsSuccessState extends CalculateMaleFatsState {
  FatCalcModel model;
  UserCalculateMaleFatsSuccessState(this.model);
}
class UserCalculateMaleFatsErrorState extends CalculateMaleFatsState {
  final String errMessage;
  UserCalculateMaleFatsErrorState(this.errMessage);
}
