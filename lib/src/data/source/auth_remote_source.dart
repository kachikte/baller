import 'package:baller/src/data/source/config/config.dart';
import 'package:baller/src/domain/dto/dto.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRemoteProvider = Provider((ref) {
  return AuthRemoteSource(baseDio: ref.watch(dioProvider));
});

class AuthRemoteSource {
  // BaseDio baseDio = BaseDio();

  final BaseDio baseDio;

  AuthRemoteSource({required this.baseDio});

  logIn({required LoginDto loginDto}) {
    return baseDio.dio.post(ApiUrl.login, data: loginDto.toJson());
  }

  signUp({required SignupDto signupDto}) {
    return baseDio.dio.post(ApiUrl.signin, data: signupDto.toJson());
  }

  pinSignIn({required String pin}) {
    return baseDio.dio.post(ApiUrl.pinSignin, data: {'pin': pin});
  }

  resetPasswordMail({required String email}) {
    return baseDio.dio.post(ApiUrl.resetPasswordmail, data: {'email': email});
  }

  resetOtp({required String otp}) {
    return baseDio.dio.post(ApiUrl.resetOtp, data: {'otp': otp});
  }

  newPassword({required String password}) {
    return baseDio.dio.post(ApiUrl.newPassword, data: {'password': password});
  }
}
