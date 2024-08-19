import 'package:baller/src/data/repository/repository.dart';
import 'package:baller/src/data/source/source.dart';
import 'package:baller/src/domain/dto/dto.dart';
import 'package:baller/src/domain/models/models.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter_riverpod/flutter_riverpod.dart';

final profileImplProvider = Provider((ref) {
  return ProfileImpl(profileRemoteSource: ref.watch(profileRemoteProvider));
});

class ProfileImpl implements ProfileInterface {
  ProfileRemoteSource profileRemoteSource;

  ProfileImpl({required this.profileRemoteSource});

  @override
  Future<ResponseModel> resetPin({required String pin}) async {
    try {
      dio.Response response =
      await profileRemoteSource.resetPin(pin: pin);

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
