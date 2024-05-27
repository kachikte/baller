import 'package:baller/src/data/repository/match_interface.dart';
import 'package:baller/src/data/source/matches_remote_source.dart';
import 'package:baller/src/domain/models/models.dart';
import 'package:dio/dio.dart' as dio;

class MatchImpl implements MatchInterface {

  MatchesRemoteSource matchesRemoteSource = MatchesRemoteSource();

  @override
  Future<ResponseModel> getMatches() async {

    try {

      List<SingleMatchModel> matches = [];

      dio.Response response = await matchesRemoteSource.getMatches();

      for (var singleMatch in response.data['teams']['Match']) {
        SingleMatchModel singleMatchModel = SingleMatchModel.fromJson(json: singleMatch);
        matches.add(singleMatchModel);
      }
      ResponseModel responseModel = ResponseModel(isError: false, data: matches);

      return responseModel;

    } on dio.DioError catch (e) {

      ResponseModel responseModel = ResponseModel(isError: true, data: e.toString());

      return responseModel;

    }

  }

}