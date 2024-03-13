part of 'get_product_details_cubit.dart';

@immutable
abstract class GetProductDetailsState {}

class GetProductDetailsInitial extends GetProductDetailsState {}
class UserGetProductDetailsLoadingState extends GetProductDetailsState {}
class UserGetProductDetailsSuccessState extends GetProductDetailsState {
  ProductDetailsModel model;
  UserGetProductDetailsSuccessState(this.model);
}
class UserGetProductDetailsErrorState extends GetProductDetailsState {
  final String errMessage;
  UserGetProductDetailsErrorState(this.errMessage);
}
