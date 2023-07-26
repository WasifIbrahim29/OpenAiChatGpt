import 'dart:async';

import '../../services/api_service.dart';

abstract class RemoteDataSource {
  Future<Stream<String>> getRealTimeResponse(String chatMessage);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final ApiService apiService =
      ApiService('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');

  @override
  Future<Stream<String>> getRealTimeResponse(String chatMessage) async {
    var response = await apiService.getRealTimeResponse(chatMessage);
    return response;
  }
}
