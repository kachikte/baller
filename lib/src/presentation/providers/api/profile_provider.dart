import 'package:baller/src/domain/models/models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final resetPinProvider = FutureProvider.family<ResponseModel, String>((ref, pin) {
  // return ref.watch(profileImplProvider).resetPin(pin: pin);

  if (pin == '1234') {
    return Future.delayed(const Duration(seconds: 5), (){
      return ResponseModel(isError: false, data: 'Successful');
    });
  } else {
    return Future.delayed(const Duration(seconds: 5), (){
      return ResponseModel(isError: true, data: 'Invalid user');
    });
  }

});
