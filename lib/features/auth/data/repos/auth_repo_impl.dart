import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fetraa/core/errors/failure.dart';

import '../../../../core/utils/services/remote_services/api_service.dart';
import '../../../../core/utils/services/remote_services/endpoints.dart';
import '../model/auth_model.dart';
import 'auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiService? apiService;

  AuthRepoImpl(this.apiService);

  @override
  Future<Either<Failure, AuthModel>> loginUser(
      {required String email, required String password,required String accountType}) async {
    try {
      var response = await apiService!.postData(endPoint: EndPoints.userLogin, data: {
        "email": email,
        "password": password,
        "type_account": accountType,
      });
      var result = AuthModel.fromJson(response.data);
      return right(result);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, AuthModel>> registerUser(
      {required String name,required String email,required String password,required String phone,required String type,required String age,required String accountType}) async {
    try {
      var response = await apiService!.postData(endPoint: EndPoints.userRegister, data: {
        "name": name,
        "email": email,
        "password": password,
        "phone": phone,
        "type": type,
        "age":age,
        "type_account":accountType
      });
      var result = AuthModel.fromJson(response.data);
      return right(result);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
