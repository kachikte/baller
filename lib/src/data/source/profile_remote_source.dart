import 'package:baller/src/data/source/config/config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final profileRemoteProvider = Provider((ref) {
  return ProfileRemoteSource(baseDio: ref.watch(dioProvider));
});

class ProfileRemoteSource {
  // BaseDio baseDio = BaseDio();

  final BaseDio baseDio;

  ProfileRemoteSource({required this.baseDio});

  resetPin({required String pin}) {
    return baseDio.dio.post(ApiUrl.resetPin, data: {'pin': pin});
  }
}
