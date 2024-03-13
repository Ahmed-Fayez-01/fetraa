import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../model/auth_model.dart';

abstract class AuthRepo{
  Future<Either<Failure,AuthModel>> loginUser({required String email,required String password,required String accountType});
  Future<Either<Failure,AuthModel>> registerUser({required String name,required String email,required String password,required String phone,required String type,required String age,required String accountType});
}