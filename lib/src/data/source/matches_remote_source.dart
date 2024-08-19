import 'package:baller/src/data/source/config/api_url.dart';
import 'package:baller/src/data/source/config/base_dio.dart';

class MatchesRemoteSource {

  BaseDio baseDio = BaseDio();

  getMatches() async {

    return await baseDio.dio.get(ApiUrl.getMatches);

  }

}