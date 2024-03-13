part of 'get_store_by_id_cubit.dart';

@immutable
abstract class GetStoreByIdState {}

class GetStoreByIdInitial extends GetStoreByIdState {}
class UserGetStoreByIdLoadingState extends GetStoreByIdState {}
class UserGetStoreByIdSuccessState extends GetStoreByIdState {
  StoreModel model;
  UserGetStoreByIdSuccessState(this.model);
}
class UserGetStoreByIdErrorState extends GetStoreByIdState {
  final String errMessage;
  UserGetStoreByIdErrorState(this.errMessage);
}
