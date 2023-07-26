class Urls {
  static const String baseUrl = 'https://api.openai.com/v1/chat/completions';
  static const String apiToken =
      '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';
  static String getRealTimeResponse(String chatMessage) =>
      '$baseUrl/weather?q=$chatMessage';
}
