import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:fetraa/core/utils/services/local_services/cache_helper.dart';
import '../../../data/model/auth_model.dart';
import '../../../data/repos/auth_repo.dart';


part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());
  AuthRepo? authRepo;
  Future<void> loginUser({required String email,required String password,required String accountType}) async {
    emit(UserLoginLoadingState());
    var result = await authRepo!.loginUser(email: email ,password: password, accountType: accountType);
    return result.fold((failure) {
      print(failure.errMessage);
      emit(UserLoginErrorState(failure.errMessage));
    }, (data) {
      print("susususususususuus");
      CacheHelper.saveData(key: "token", value: data.data!.token);
      CacheHelper.saveData(key: "age", value: data.data!.user!.age);
      CacheHelper.saveData(key: "name", value: data.data!.user!.name);
      CacheHelper.saveData(key: "type", value: data.data!.user!.type);
      CacheHelper.saveData(key: "email", value: data.data!.user!.email);
      CacheHelper.saveData(key: "phone", value: data.data!.user!.phone);
      CacheHelper.saveData(key: "img", value: data.data!.user!.img);
      emit(UserLoginSuccessState(data));
    });
  }
}
