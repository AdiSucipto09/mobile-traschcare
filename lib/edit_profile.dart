import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:avatar_glow/avatar_glow.dart';

class EditProfile extends StatefulWidget {
  final String? initialEmail;
  final String? initialNama;
  final String? initialStatus;

  const EditProfile({
    Key? key,
    this.initialEmail,
    this.initialNama,
    this.initialStatus,
  }) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController emailController = TextEditingController();
  TextEditingController namaController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  String? selectedImagePath;

  @override
  void initState() {
    super.initState();
    // Mengisi nilai awal dari widget parent jika tersedia
    emailController.text = widget.initialEmail ?? "";
    namaController.text = widget.initialNama ?? "";
    statusController.text = widget.initialStatus ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context); // Kembali ke halaman sebelumnya tanpa mengupdate
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
        backgroundColor: Color(0xFF395144),
        title: Text(
          'Ubah Profile',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              // Update informasi profil dan kembali ke halaman sebelumnya
              Navigator.pop(
                context,
                {
                  'email': emailController.text,
                  'nama': namaController.text,
                  'status': statusController.text,
                  'selectedImagePath': selectedImagePath,
                },
              );
            },
            icon: Icon(Icons.save, color: Colors.white),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              AvatarGlow(
                endRadius: 110,
                glowColor: Colors.black,
                child: Container(
                  margin: EdgeInsets.all(15),
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Color(0xFF395144),
                    borderRadius: BorderRadius.circular(100),
                    image: selectedImagePath != null
                        ? DecorationImage(
                            image: FileImage(File(selectedImagePath!)),
                            fit: BoxFit.cover,
                          )
                        : null,
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: emailController,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  labelText: "Email",
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 20,
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: namaController,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  labelText: "Nama",
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 20,
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: statusController,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  labelText: "Status",
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 20,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("tidak ada gambar"),
                  TextButton(
                    onPressed: () async {
                      FilePickerResult? result =
                          await FilePicker.platform.pickFiles();

                      if (result != null) {
                        PlatformFile file = result.files.first;
                        setState(() {
                          selectedImagePath = file.path!;
                        });
                      }
                    },
                    child: Text(
                      "pilih file",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Container(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate back to the previous page without updating
                    Navigator.pop(
                      context,
                      {
                        'email': emailController.text,
                        'nama': namaController.text,
                        'status': statusController.text,
                        'selectedImagePath': selectedImagePath,
                      },
                    );
                  },
                  child: Text(
                    "UBAH",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF395144),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 15,
                    ),
                    minimumSize: Size(100, 50),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
