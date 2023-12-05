import 'dart:convert';

import 'package:http/http.dart' as http;

class AINetworking {
  String aiUrl = "https://api.openai.com/v1/chat/completions";
  String keyValue =
      "Bearer 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";
  Future<String> connectGPT({required String msg}) async {
    var url = Uri.parse(aiUrl);
    try {
      var response = await http.post(url,
          headers: {
            "Content-Type": "application/json",
            "Authorization": keyValue,
          },
          body: json.encode({
            "model": "gpt-3.5-turbo",
            "messages": [
              {
                "role": "system",
                "content":
                    "You will be provided with a prompt message an you will be an Astronomer and provide informations about the solar system and the plantes in it such as name, how many moon is on each plant, size based on another plantes, and aother insightful informations"
              },
              {"role": "user", "content": msg}
            ],
            "temperature": 0.8,
            "max_tokens": 1024,
            "top_p": 1,
            "frequency_penalty": 0,
            "presence_penalty": 0
          }));
      if (response.statusCode == 200) {
        final bodyGPT = json.decode(response.body);
        // print(response.body);
        // print(bodyGPT["choices"][0]["message"]["content"]);
        return bodyGPT["choices"][0]["message"]["content"];
      } else {
        return "No data ${response.body}";
      }
    } catch (e) {
      throw FormatException(e.toString());
    }
  }
}
