part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}
class UserLoginLoadingState extends LoginState {}
class UserLoginSuccessState extends LoginState {
  AuthModel model ;
  UserLoginSuccessState(this.model);
}
class UserLoginErrorState extends LoginState {
  final String errMessage;
  UserLoginErrorState(this.errMessage);
}
