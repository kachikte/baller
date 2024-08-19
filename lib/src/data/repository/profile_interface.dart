import 'package:baller/src/domain/models/models.dart';

abstract class ProfileInterface {

  Future<ResponseModel> resetPin({required String pin});

}