import 'package:baller/src/domain/models/models.dart';
import 'package:baller/src/presentation/providers/notifiers/notifiers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userProvider = StateNotifierProvider<UserNotifier, UserModel?>((ref) {
  return UserNotifier();
});