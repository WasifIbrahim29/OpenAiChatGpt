import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  final String apiKey;

  ApiService(this.apiKey);

  Stream<String> getRealTimeResponse(String question) async* {
    const apiUrl = 'https://api.openai.com/v1/chat/completions';
    final headers = {
      'Authorization': 'Bearer $apiKey',
      'Content-Type': 'application/json',
    };

    try {
      final body = {
        'model': 'gpt-3.5-turbo',
        'stream': true,
        'messages': [
          {
            "role": "user",
            "content": question,
          },
        ]
      };

      final request = http.Request('POST', Uri.parse(apiUrl));
      request.headers.addAll(headers);
      request.body = json.encode(body);

      final streamedResponse = await request.send();

      if (streamedResponse.statusCode == 200) {
        final stream = streamedResponse.stream.transform(utf8.decoder);
        String buffer = '';
        await for (final chunk in stream) {
          buffer += chunk;
          while (buffer.contains('\n')) {
            final lineEndIndex = buffer.indexOf('\n');
            final line = buffer.substring(0, lineEndIndex);
            buffer = buffer.substring(lineEndIndex + 1);
            if (line.startsWith('data: ')) {
              final jsonData = line.substring(6); // Remove the "data: " prefix
              if (jsonData.startsWith('[DONE]')) {
                return;
              }
              final data = json.decode(jsonData);
              final content = data['choices'][0]['delta']['content'].toString();
              yield content;
            }
          }
        }
      }
    } catch (e) {
      print(e);
    }
    yield "";
  }
}
