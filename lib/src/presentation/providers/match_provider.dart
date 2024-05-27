import 'package:baller/src/domain/impl/match_impl.dart';
import 'package:baller/src/domain/models/models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiServiceProvider = Provider((ref) => MatchImpl());

final matchProvider = FutureProvider<ResponseModel>((ref) async {
  final apiService = ref.read(apiServiceProvider);
  return apiService.getMatches();
});
