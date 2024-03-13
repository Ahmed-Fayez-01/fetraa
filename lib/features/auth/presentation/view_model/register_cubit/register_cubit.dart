import 'package:bloc/bloc.dart';
import 'package:fetraa/features/auth/data/model/auth_model.dart';
import 'package:flutter/cupertino.dart';
import '../../../../../core/utils/services/local_services/cache_helper.dart';
import '../../../data/repos/auth_repo.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.authRepo) : super(RegisterInitial());
  AuthRepo? authRepo;

  Future<void> registerUser(
      {required String name,
      required String email,
      required String password,
      required String phone,
      required String type,
      required String age,
      required String accountType}) async {
    emit(UserRegisterLoadingState());
    var result = await authRepo!.registerUser(
        email: email,
        password: password,
        phone: phone,
        name: name,
        type: type,
        age: age,
        accountType: accountType);
    return result.fold((failure) {
      print(failure.errMessage);
      emit(UserRegisterErrorState(failure.errMessage));
    }, (data) {
      print("sssuussusususususuusus");
      CacheHelper.saveData(key: "token", value: data.data!.token);
      CacheHelper.saveData(key: "age", value: data.data!.user!.age);
      CacheHelper.saveData(key: "name", value: data.data!.user!.name);
      CacheHelper.saveData(key: "type", value: data.data!.user!.type);
      CacheHelper.saveData(key: "email", value: data.data!.user!.email);
      CacheHelper.saveData(key: "phone", value: data.data!.user!.phone);
      emit(UserRegisterSuccessState(data));
    });
  }
}
