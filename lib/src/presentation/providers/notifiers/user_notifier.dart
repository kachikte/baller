import 'package:baller/src/domain/models/models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserNotifier extends StateNotifier<UserModel?> {
  UserNotifier() : super(null);

  setUser(UserModel userModel) {
    state = userModel;
  }

  // updateUser(UserModel userModel) {
  //   if (state != null) {
  //     state = state
  //   } else {
  //     state = userModel;
  //   }
  // }

  clearUser() {
    state = null;
  }
}
