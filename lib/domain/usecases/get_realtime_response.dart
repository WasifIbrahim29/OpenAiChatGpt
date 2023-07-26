import 'package:chatgpt_app/domain/repositories/realtime_response_repository.dart';

class GetRealTimeResponse {
  final RealTimeResponseRepository repository;

  GetRealTimeResponse(this.repository);

  Future<Stream<String>> execute(String chatMessage) async {
    var result = await repository.getRealTimeResponse(chatMessage);
    return result;
  }
}
