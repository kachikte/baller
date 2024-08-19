import 'package:baller/src/domain/dto/dto.dart';
import 'package:baller/src/domain/models/models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginProvider =
    FutureProvider.family<ResponseModel, LoginDto>((ref, loginDto) {
  // return ref.watch(authImplProvider).login(loginDto: loginDto);

  if ((loginDto.email == 'kachitheengineer@gmail.com') &&
      (loginDto.password == 'password')) {
    return Future.delayed(const Duration(seconds: 5), () {
      return ResponseModel(
          isError: false,
          data: LoginModel(
              email: 'kachitheengineer@gmail.com',
              firstName: 'Onyekachi',
              lastName: 'Onochie-okeke',
              token: '1234567890'));
    });
  } else {
    return Future.delayed(const Duration(seconds: 5), () {
      return ResponseModel(isError: true, data: 'Invalid user');
    });
  }
});

final pinSignInProvider =
    FutureProvider.family<ResponseModel, String>((ref, pin) {
  // return ref.watch(authImplProvider).pinSignIn(pin: pin);

  if (pin == '1234') {
    return Future.delayed(const Duration(seconds: 5), () {
      return ResponseModel(
          isError: false,
          data: LoginModel(
              email: 'kachitheengineer@gmail.com',
              firstName: 'Onyekachi',
              lastName: 'Onochie-okeke',
              token: '1234567890'));
    });
  } else {
    return Future.delayed(const Duration(seconds: 5), () {
      return ResponseModel(isError: true, data: 'Invalid user');
    });
  }
});

final signupProvider =
    FutureProvider.family<ResponseModel, SignupDto>((ref, signupDto) {
  // return ref.watch(authImplProvider).signup(signupDto: signupDto);
  if (signupDto.email != 'error@gmail.com') {
    return Future.delayed(const Duration(seconds: 5), () {
      return ResponseModel(
          isError: false,
          data: SignupModel(
              email: 'kachitheengineer@gmail.com',
              firstName: 'Onyekachi',
              lastName: 'Onochie-okeke',
              token: '1234567890'));
    });
  } else {
    return Future.delayed(const Duration(seconds: 5), () {
      return ResponseModel(isError: true, data: 'Invalid user');
    });
  }
});

final resetPasswordMailProvider =
    FutureProvider.family<ResponseModel, String>((ref, email) {
  // return ref.watch(authImplProvider).resetPasswordMail(email: email);
  if (email == 'kachitheengineer@gmail.com') {
    return Future.delayed(const Duration(seconds: 5), () {
      return ResponseModel(isError: false, data: 'Successful');
    });
  } else {
    return Future.delayed(const Duration(seconds: 5), () {
      return ResponseModel(isError: true, data: 'Invalid user');
    });
  }
});

final resetOtpProvider =
    FutureProvider.family<ResponseModel, String>((ref, otp) {
  // return ref.watch(authImplProvider).resetOtp(otp: otp);
  if (otp == '123456') {
    return Future.delayed(const Duration(seconds: 5), () {
      return ResponseModel(isError: false, data: 'Successful');
    });
  } else {
    return Future.delayed(const Duration(seconds: 5), () {
      return ResponseModel(isError: true, data: 'Invalid otp');
    });
  }
});

final newPasswordProvider =
    FutureProvider.family<ResponseModel, String>((ref, password) {
  // return ref.watch(authImplProvider).newPassword(password: password);
  if (password == 'password') {
    return Future.delayed(const Duration(seconds: 5), () {
      return ResponseModel(isError: false, data: 'Successful');
    });
  } else {
    return Future.delayed(const Duration(seconds: 5), () {
      return ResponseModel(isError: true, data: 'Invalid otp');
    });
  }
});
