import 'package:chatgpt_app/domain/repositories/realtime_response_repository.dart';

import '../datasources/remote_data_source.dart';

class RealTimeRepositoryImpl implements RealTimeResponseRepository {
  final RemoteDataSource remoteDataSource;

  RealTimeRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Stream<String>> getRealTimeResponse(String chatMessage) async {
    try {
      final result = await remoteDataSource.getRealTimeResponse(chatMessage);
      return result;
    } catch (e) {
      print(e);
      throw Error();
    }
  }
}
