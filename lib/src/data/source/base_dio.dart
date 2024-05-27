import 'package:baller/src/data/source/api_url.dart';
import 'package:dio/dio.dart';

class BaseDio {

  Dio dio = Dio();

  var options = BaseOptions(
      baseUrl: ApiUrl.baseUrl,
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json"
      },
  );

  BaseDio() {
    dio = Dio(options);
  }
}