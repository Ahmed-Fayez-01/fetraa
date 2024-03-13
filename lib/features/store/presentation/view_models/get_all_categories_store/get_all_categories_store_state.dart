part of 'get_all_categories_store_cubit.dart';

@immutable
abstract class GetAllCategoriesStoreState {}

class GetAllCategoriesStoreInitial extends GetAllCategoriesStoreState {}
class UserGetAllCategoriesStoreLoadingState extends GetAllCategoriesStoreState {}
class UserGetAllCategoriesStoreSuccessState extends GetAllCategoriesStoreState {
  StoreCategories model;
  UserGetAllCategoriesStoreSuccessState(this.model);
}
class UserGetAllCategoriesStoreErrorState extends GetAllCategoriesStoreState {
  final String errMessage;
  UserGetAllCategoriesStoreErrorState(this.errMessage);
}
