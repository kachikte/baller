import 'package:baller/src/domain/models/models.dart';

abstract class MatchInterface {

  Future<ResponseModel> getMatches();

}