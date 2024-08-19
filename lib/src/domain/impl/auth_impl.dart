import 'package:baller/src/data/repository/repository.dart';
import 'package:baller/src/data/source/source.dart';
import 'package:baller/src/domain/dto/dto.dart';
import 'package:baller/src/domain/models/models.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authImplProvider = Provider((ref) {
  return AuthImpl(authRemoteSource: ref.watch(authRemoteProvider));
});

class AuthImpl implements AuthInterface {
  AuthRemoteSource authRemoteSource;

  AuthImpl({required this.authRemoteSource});

  @override
  Future<ResponseModel> logIn({required LoginDto loginDto}) async {
    try {
      dio.Response response = await authRemoteSource.logIn(loginDto: loginDto);

      ResponseModel responseModel =
          ResponseModel(isError: false, data: response.data);

      return responseModel;
    } on dio.DioError catch (e) {
      ResponseModel responseModel =
          ResponseModel(isError: true, data: e.toString());

      return responseModel;
    }
  }

  @override
  Future<ResponseModel> signUp({required SignupDto signupDto}) async {
    try {
      dio.Response response =
          await authRemoteSource.signUp(signupDto: signupDto);

      ResponseModel responseModel =
          ResponseModel(isError: false, data: response.data);

      return responseModel;
    } on dio.DioError catch (e) {
      ResponseModel responseModel =
          ResponseModel(isError: true, data: e.toString());

      return responseModel;
    }
  }

  @override
  Future<ResponseModel> pinSignIn({required String pin}) async {
    try {
      dio.Response response =
      await authRemoteSource.pinSignIn(pin: pin);

      ResponseModel responseModel =
      ResponseModel(isError: false, data: response.data);

      return responseModel;
    } on dio.DioError catch (e) {
      ResponseModel responseModel =
      ResponseModel(isError: true, data: e.toString());

      return responseModel;
    }
  }

  @override
  Future<ResponseModel> resetPasswordMail({required String email}) async {
    try {
      dio.Response response =
      await authRemoteSource.resetPasswordMail(email: email);

      ResponseModel responseModel =
      ResponseModel(isError: false, data: response.data);

      return responseModel;
    } on dio.DioError catch (e) {
      ResponseModel responseModel =
      ResponseModel(isError: true, data: e.toString());

      return responseModel;
    }
  }

  @override
  Future<ResponseModel> resetOtp({required String otp}) async {
    try {
      dio.Response response =
      await authRemoteSource.resetOtp(otp: otp);

      ResponseModel responseModel =
      ResponseModel(isError: false, data: response.data);

      return responseModel;
    } on dio.DioError catch (e) {
      ResponseModel responseModel =
      ResponseModel(isError: true, data: e.toString());

      return responseModel;
    }
  }

  @override
  Future<ResponseModel> newPassword({required String password}) async {
    try {
      dio.Response response =
      await authRemoteSource.newPassword(password: password);

      ResponseModel responseModel =
      ResponseModel(isError: false, data: response.data);

      return responseModel;
    } on dio.DioError catch (e) {
      ResponseModel responseModel =
      ResponseModel(isError: true, data: e.toString());

      return responseModel;
    }
  }
}
