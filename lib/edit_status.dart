import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:trashcare/profile_page.dart';
import 'package:trashcare/rootpage.dart';
import 'package:trashcare/state_util.dart';

class EditStatus extends StatefulWidget {
    const EditStatus({Key? key}) :super(key: key);

   @override
  State<EditStatus> createState() => _EditStatus();
}

class _EditStatus extends State<EditStatus> {
  TextEditingController _statusController = TextEditingController();
  String _currentStatus = "Status awal"; // Ganti dengan status awal yang sesuai

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
              // Gunakan Navigator.push untuk perpindahan ke halaman EditStatus
              Navigator.push(
                context,
                PageTransition(child: RootPage(), type: PageTransitionType.bottomToTop),
              );
        },
        icon: Icon(Icons.arrow_back,  color: Colors.white,),
        ),
        backgroundColor: Color(0xFF395144),
        title: Text('Edit Status'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              cursorColor: Colors.black,
              controller: _statusController,
              decoration: InputDecoration(
                labelText: "Status",
                labelStyle: TextStyle(
                  color: Colors.black,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                  borderSide: BorderSide(color: Color(0xFF395144),)
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () {
                  // Ambil nilai status dari TextField
                  String newStatus = _statusController.text;
                  // Simpan nilai status
                  setState(() {
                    _currentStatus = newStatus;
                  });
                  // Lakukan aksi atau penyimpanan data sesuai kebutuhan Anda
                  // Misalnya, Anda dapat mengirim data status ke server atau menyimpannya secara lokal
                  print("Status baru: $_currentStatus");
                },
                child: Text(
                  "Edit",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF395144),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 15,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Status saat ini: $_currentStatus",
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}