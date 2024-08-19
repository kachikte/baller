import 'package:baller/src/domain/dto/dto.dart';
import 'package:baller/src/domain/models/models.dart';

abstract class AuthInterface {

  Future<ResponseModel> logIn({required LoginDto loginDto});

  Future<ResponseModel> signUp({required SignupDto signupDto});

  Future<ResponseModel> pinSignIn({required String pin});

  Future<ResponseModel> resetOtp({required String otp});

  Future<ResponseModel> newPassword({required String password});

  }