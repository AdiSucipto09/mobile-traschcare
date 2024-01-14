import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Sentimen extends StatefulWidget {
  const Sentimen({Key? key}) : super(key: key);

  @override
  State<Sentimen> createState() => _SentimenState();
}

class _SentimenState extends State<Sentimen> {
  String sentimenResult = "";
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: TextField(
              controller: controller,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          ElevatedButton(
            child: Text("Analisis"),
            onPressed: (() async {
              const apiKey = "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";
              const model = "teks-codex-003";

              try {
                final response = await http.post(
                  Uri.parse("https://api.openai.com/v1/completions"),
                  headers: {
                    "Content-Type": "application/json",
                    "Authorization": "Bearer $apiKey",
                  },
                  body: json.encode({
                    "model": model,
                    "prompt": "Decide whether a Tweet's sentiment is positive, neutral, or negative.\n\nTweet:\"" +
                        controller.text +
                        "\"\nSentimen",
                    "temperature": 0,
                    "max_tokens": 100,
                    "top_p": 1,
                    "frequency_penalty": 0.5,
                    "presence_penalty": 0,
                  }),
                );

                print("Response: ${response.body}");

                if (response.statusCode == 200) {
                  final Map<String, dynamic> responseJson =
                      json.decode(response.body);
                  String sentimen = responseJson["choices"][0]['text'];
                  setState(() {
                    sentimenResult = sentimen;
                  });
                } else {
                  print("Error: ${response.reasonPhrase}");
                  // Handle error cases here
                }
              } catch (error) {
                print("Error: $error");
                // Handle network and other errors here
              }
            }),
          ),
          SizedBox(
            height: 70,
          ),
          Text(sentimenResult),
        ],
      ),
    );
  }
}
