part of 'get_product_details_cubit.dart';

@immutable
abstract class GetTrainerDetailsState {}

class GetTrainerDetailsInitial extends GetTrainerDetailsState {}
class UserGetTrainerDetailsLoadingState extends GetTrainerDetailsState {}
class UserGetTrainerDetailsSuccessState extends GetTrainerDetailsState {
  TrainerDetailsModel model;
  UserGetTrainerDetailsSuccessState(this.model);
}
class UserGetTrainerDetailsErrorState extends GetTrainerDetailsState {
  final String errMessage;
  UserGetTrainerDetailsErrorState(this.errMessage);
}
