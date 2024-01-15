import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:http_parser/http_parser.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Image Prediction',
      theme: ThemeData(),
      home: const Camera(),
    );
  }
}

class Camera extends StatefulWidget {
  const Camera({Key? key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Camera> {
  File? _file;
  String? prediction = "";
  List<HistoryEntry> historyEntries = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Deteksi Sampah',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xFF395144),
      ),
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 40,
                  ),
                  _file != null
                      ? Image.file(
                          _file!,
                          width: 250,
                          height: 250,
                          fit: BoxFit.cover,
                        )
                      : Column(
                          children: [
                            SizedBox(
                              height: 40,
                            ),
                            Image.asset('images/kamera.png'),
                            SizedBox(
                              height: 40,
                            ),
                          ],
                        ),
                  const SizedBox(height: 16),
                  Text(
                    prediction ?? "",
                    style: TextStyle(
                      backgroundColor: Colors.blue,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildButtons(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButtons() {
    return Column(
      children: <Widget>[
        ElevatedButton(
          onPressed: () => uploadImage(),
          style: ElevatedButton.styleFrom(
            primary: Color(0xFF395144),
            fixedSize: Size(200, 50),
            elevation: 5,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.image, color: Colors.white),
              const SizedBox(width: 8),
              const Text("Masukkan Gambar", style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () async {
            print("test");
            sendJsonToFlask();
            uploadFileImage();
          },
          style: ElevatedButton.styleFrom(
            primary: Color(0xFF395144),
            fixedSize: Size(200, 50),
            elevation: 5,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.camera, color: Colors.white),
              const SizedBox(width: 8),
              const Text("Deteksi Gambar", style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            // Navigasi ke layar histori
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HistoryScreen(historyEntries: historyEntries),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            primary: Color(0xFF395144),
            fixedSize: Size(200, 50),
            elevation: 5,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.history, color: Colors.white),
              const SizedBox(width: 8),
              const Text("Lihat Histori", style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> uploadFileImage() async {
    File imageFileUpload = File(_file!.path);
    String? fileName = _file?.path.split('/').last;

    String uploadEndpoint = "https://711b-112-78-177-3.ngrok-free.app/uploadFileAndroid";
    Dio dio = Dio();

    FormData formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(_file!.path, filename: fileName),
    });

    try {
      Response response = await dio.post(uploadEndpoint, data: formData);
      if (response.data == 'sukses') {
        print('Upload berhasil: ${response.data}');
      } else {
        print('${response.data}');
      }
    } catch (e) {
      print('Error during upload: $e');
    }
  }

  Future<void> uploadImage() async {
    final myfile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (myfile == null) return;

    setState(() {
      _file = File(myfile.path);
      prediction = "";
    });
  }

  Future<void> sendJsonToFlask() async {
    String? Stress;
    if (_file == null) {
      print('File gambar belum dipilih.');
      return;
    }

    String? fileName = _file?.path.split('/').last;
    if (fileName == null) {
      print('Gagal mendapatkan nama file.');
      return;
    }

    String apiUrl = "https://711b-112-78-177-3.ngrok-free.app/receive_json";
    Dio dio = Dio();

    try {
      final Map<String, String> data = {
        'message': fileName,
      };

      final response = await dio.post(
        apiUrl,
        options: Options(
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          },
        ),
        data: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = response.data;
        String mes1 = responseData['nama'];
        String mes2 = responseData['akurasi'];

        historyEntries.insert(0, HistoryEntry(label: mes1, accuracy: double.parse(mes2), timestamp: DateTime.now().toString()));

        _showAlertDialog(context, 'Hasil Deteksi', 'Sampah $mes1 \nProbability $mes2');

        print("$mes1 $mes2");
      } else {
        print('Permintaan gagal. Kode respons: ${response.statusCode}');
      }
    } catch (e) {
      print('Error during request: $e');
    }
  }

  void _showAlertDialog(BuildContext context, String title, String content) {
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('OK'),
        ),
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

class HistoryScreen extends StatelessWidget {
  final List<HistoryEntry> historyEntries;

  const HistoryScreen({Key? key, required this.historyEntries}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Histori Deteksi'),
      ),
      body: ListView.builder(
        itemCount: historyEntries.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Deteksi ${historyEntries[index].label}'),
            subtitle: Text('Probability: ${historyEntries[index].accuracy}'),
            trailing: Text('Waktu: ${historyEntries[index].timestamp}'),
          );
        },
      ),
    );
  }
}

class HistoryEntry {
  final String label;
  final double accuracy;
  final String timestamp;

  HistoryEntry({
    required this.label,
    required this.accuracy,
    required this.timestamp,
  });
}