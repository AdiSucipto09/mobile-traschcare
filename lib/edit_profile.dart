import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:trashcare/rootpage.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController namaController = TextEditingController();
    TextEditingController statusController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
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
              // Tambahkan logika penyimpanan perubahan di sini
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
                  image: DecorationImage(
                    image: AssetImage("images/profil.png"),
                    fit: BoxFit.cover,
                  ),
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
                  onPressed: () {
                    // Tambahkan logika untuk memilih file/gambar di sini
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
                  // Gunakan Navigator.push untuk perpindahan ke halaman EditStatus
                  Navigator.push(
                    context,
                    PageTransition(
                      child: RootPage(),
                      type: PageTransitionType.bottomToTop,
                    ),
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
                  minimumSize: Size(100, 50), // Atur ukuran minimum untuk tombol (misalnya, 100 lebar x 50 tinggi)
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

