import 'package:baller/src/data/source/config/api_url.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final dioProvider = Provider((ref) {
  return BaseDio();
});

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