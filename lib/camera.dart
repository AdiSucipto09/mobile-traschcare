import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(
    home: Camera(),
  ));
}

class Camera extends StatefulWidget {
  const Camera({Key? key}) : super(key: key);

  @override
  State<Camera> createState() => _Camera();
}

class _Camera extends State<Camera> {
  File? _image;

  Future<void> getImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imagePermanent = await saveFilePermanently(image.path);

      setState(() {
        _image = imagePermanent;
      });

      // Call the waste detection function
      await detectWaste(imagePermanent);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future<File> saveFilePermanently(String imagePath) async {
  try {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');
    return File(imagePath).copy(image.path);
  } catch (e) {
    print('Error saving file: $e');
    return File(imagePath); // Return the original file in case of an error
  }
}

  Future<void> detectWaste(File imageFile) async {
    try {
      // Convert the image to base64
      List<int> imageBytes = await imageFile.readAsBytes();
      String base64Image = base64Encode(imageBytes);

      // Send the image to the waste detection endpoint
      final response = await http.post(
        Uri.parse('http://localhost:5000/api/deteksi-sampah'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'message': base64Image}),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        print('Waste Detection Result: ${data['nama']}, ${data['akurasi']}');
        // Use the result as needed
      } else {
        print('Failed to detect waste: ${response.statusCode}');
      }
    } catch (e) {
      print('Error detecting waste: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DETEKSI SAMPAH'),
        backgroundColor: Color(0xFF395144),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            _image != null
                ? Image.file(
                    _image!,
                    width: 250,
                    height: 250,
                    fit: BoxFit.cover,
                  )
                : Image.asset('images/kamera.png'),
            SizedBox(
              height: 40,
            ),
            CustomButton(
              title: 'Gallery',
              icon: Icons.image_outlined,
              onClick: () => getImage(ImageSource.gallery),
            ),
            CustomButton(
              title: 'Camera',
              icon: Icons.camera,
              onClick: () => getImage(ImageSource.camera),
            ),
          ],
        ),
      ),
    );
  }
}

Widget CustomButton({
  required String title,
  required IconData icon,
  required VoidCallback onClick,
}) {
  return Container(
    width: 280,
    child: ElevatedButton(
      onPressed: onClick,
      style: ElevatedButton.styleFrom(
        primary: Color(0xFF395144),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Row(children: [
        Icon(icon),
        SizedBox(
          width: 20,
        ),
        Text(title),
      ]),
    ),
  );
}

// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:path/path.dart';

// class Camera extends StatefulWidget {
//   const Camera({Key? key}) :super(key: key);

//   @override
//   State<Camera> createState() => _Camera();
// }

// class _Camera extends State<Camera> {
//   File? _image;

//   Future getImage(ImageSource source) async {
//     try{
//     final image = await ImagePicker().pickImage(source: source);
//     if( image == null ) return;

//     // final imageTemporary = File(image.path);
//     final imagePermanent = await saveFilePermanently(image.path);

//     setState(() {
//       this._image = imagePermanent;
//     });
//     } on PlatformException catch (e) {
//       print('Failed to pick image: $e');
//     }
//   }

//   Future<File> saveFilePermanently(String imagePath) async {
//     final directory = await getApplicationDocumentsDirectory();
//     final name = basename(imagePath);
//     final image = File('${directory.path}/$name');

//     return File(imagePath).copy(image.path);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(' DETEKSI SAMPAH'),
//          backgroundColor: Color(0xFF395144),
//       ),
//       body: Center(
//         child:Column(
//           children: [
//             SizedBox(
//               height: 40,
//               ),
//             _image != null
//             ? Image.file(
//               _image!,
//               width: 250,
//               height: 250,
//               fit: BoxFit.cover,
//             )
//             : Image.asset('images/kamera.png'),
//             SizedBox(height: 40,),
//             CustomButton(
//               title: 'Galery',
//               icon: Icons.image_outlined, 
//               onClick: () => getImage(ImageSource.gallery),
//               ),
//             CustomButton(
//               title: 'Camera', 
//               icon: Icons.camera, 
//               onClick: () => getImage(ImageSource.camera),
//             ),
//           ],
//         ) 
//       ),
//     );
//   }
// }

// Widget CustomButton({
//   required String title,
//   required IconData icon,
//   required VoidCallback onClick,

// }) {
//   return Container(
//     width: 280,
//     child: ElevatedButton(
//       onPressed: onClick,
//       style: ElevatedButton.styleFrom(
//         primary:Color(0xFF395144),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//       ),
//       child: Row(
//         children: [
//           Icon(icon),
//           SizedBox(
//             width: 20,
//           ),
//           Text(title),
//         ]),
//     ),
//   );
// }