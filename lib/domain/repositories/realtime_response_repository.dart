abstract class RealTimeResponseRepository {
  Future<Stream<String>> getRealTimeResponse(String chatMessage);
}
