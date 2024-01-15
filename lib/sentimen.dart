import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const String apiKey = "YOUR_OPENAI_API_KEY";

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
    return Scaffold(
      appBar: AppBar(
      ),
      body: content(),
      backgroundColor: Color(0xFFF4F4F4),
    );
  }

  Widget content() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: 'Masukkan kata',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () async {
              // create GPT-3 sentiment analysis model
              const model = "text-davinci-003";

              // create http post request
              http.Response response = await http.post(
                Uri.https("api.openai.com", "/v1/completions"),
                headers: {
                  "Content-Type": "application/json",
                  "Authorization": "Bearer $apiKey",
                },
                body: json.encode({
                  "model": model,
                  "prompt":
                      "Analyze the sentiment of the following text:\n\n\"${controller.text}\"",
                  "temperature": 0,
                  "max_tokens": 100,
                  "top_p": 1,
                  "frequency_penalty": 0.5,
                  "presence_penalty": 0,
                }),
              );

              // decode response
              Map<String, dynamic> responseJson = json.decode(response.body);

              if (responseJson != null &&
                  responseJson["choices"] != null &&
                  responseJson["choices"].isNotEmpty) {
                String sentiment = responseJson["choices"][0]['text'];

                // Custom logic to determine positive, negative, or neutral sentiment
                if (isPositive(sentiment)) {
                  sentimenResult = "Sentimen Positif";
                  showSuccessDialog();
                } else if (isNegative(sentiment)) {
                  sentimenResult = "Sentimen Negatif";
                  showFailureDialog();
                } else {
                  sentimenResult = "Sentimen Netral";
                  showNeutralDialog();
                }
              } else {
                // Jika respons dari API tidak ada atau tidak dapat diinterpretasikan, gunakan kata yang dimasukkan pengguna untuk mengidentifikasi sentimen secara lokal
                if (isPositive(controller.text)) {
                  sentimenResult = "Sentimen Positif";
                  showSuccessDialog();
                } else if (isNegative(controller.text)) {
                  sentimenResult = "Sentimen Negatif";
                  showFailureDialog();
                } else {
                  sentimenResult = "Sentimen Netral";
                  showNeutralDialog();
                }
              }
            },
            style: ElevatedButton.styleFrom(
              primary: Color(0xFF395144),
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 12.0),
              child: Text(
                "Analisis",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            sentimenResult,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  bool isPositive(String text) {
    List<String> positiveKeywords = [
      "good",
      "happy",
      "positive",
      "Bagus",
      "Keren",
      "Sempurna",
      "Baik",
      "Love",
      "Cinta",
      "cool",
      "mantap",
      "great",
      "baik"
    ];

    for (String keyword in positiveKeywords) {
      if (text.toLowerCase().contains(keyword)) {
        return true;
      }
    }

    return false;
  }

  bool isNegative(String text) {
    List<String> negativeKeywords = [
      "bad",
      "sad",
      "negative",
      "goblok",
      "tolol",
      "jelek",
      "ga guna",
      "ga bagus",
      "tidak bagus",
      "sampah",
      "tidak",
      "no"
    ];

    for (String keyword in negativeKeywords) {
      if (text.toLowerCase().contains(keyword)) {
        return true;
      }
    }

    return false;
  }

  void showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Sentimen Positif"),
          content: Image.asset("images/positif.png", height: 100, width: 100),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  void showFailureDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Sentimen Negatif"),
          content: Image.asset("images/negatif.png", height: 100, width: 100),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  void showNeutralDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Sentimen Netral"),
          content: Image.asset("images/netral.png", height: 100, width: 100),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Sentimen(),
  ));
}
