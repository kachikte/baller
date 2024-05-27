import 'package:baller/src/data/source/api_url.dart';
import 'package:baller/src/data/source/base_dio.dart';

class MatchesRemoteSource {

  BaseDio baseDio = BaseDio();

  getMatches() async {

    return await baseDio.dio.get(ApiUrl.getMatches);

  }

}