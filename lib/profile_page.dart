import 'dart:io';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:provider/provider.dart';
import 'edit_profile.dart';
import 'signin_page.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData;

  ThemeProvider() : _themeData = ThemeData.light();

  ThemeData get themeData => _themeData;

  void setTheme(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String email = "nabillaaz012@gmail.com";
  String nama = "Nabilla Auly Zahra";
  String status = "Aktif";
  String? profileImagePath;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: _buildProfilePage(),
    );
  }

  Widget _buildProfilePage() {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Column(
              children: [
                AvatarGlow(
                  endRadius: 110,
                  glowColor: Colors.black,
                  child: Container(
                    margin: EdgeInsets.all(15),
                    width: 175,
                    height: 175,
                    decoration: BoxDecoration(
                      color: Color(0xFF395144),
                      borderRadius: BorderRadius.circular(100),
                      image: DecorationImage(
                        image: _getImageProvider(),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Text(
                  nama,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  email,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  status,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            child: Consumer<ThemeProvider>(
              builder: (context, themeProvider, child) {
                return Column(
                  children: [
                    ListTile(
                      onTap: () async {
                        // Menunggu hasil kembali dari halaman EditProfile
                        final result = await Navigator.push(
                          context,
                          PageTransition(
                            child: EditProfile(
                              initialEmail: email,
                              initialNama: nama,
                              initialStatus: status,
                            ),
                            type: PageTransitionType.bottomToTop,
                          ),
                        );

                        // Memperbarui UI dengan hasil yang dikembalikan dari EditProfile
                        if (result != null && result is Map<String, dynamic>) {
                          setState(() {
                            email = result['email'] ?? email;
                            nama = result['nama'] ?? nama;
                            status = result['status'] ?? status;
                            profileImagePath = result['selectedImagePath'] ?? profileImagePath;
                          });
                        }
                      },
                      leading: Icon(Icons.person_2_outlined),
                      title: Text(
                        "Ubah Profile",
                        style: TextStyle(
                          fontSize: 22,
                        ),
                      ),
                      trailing: Icon(Icons.arrow_circle_right_outlined),
                    ),
                    ListTile(
                      onTap: () {
                        ThemeData newTheme = themeProvider.themeData == ThemeData.light()
                            ? ThemeData.dark()
                            : ThemeData.light();
                        themeProvider.setTheme(newTheme);
                      },
                      leading: Icon(Icons.color_lens_outlined),
                      title: Text(
                        "Ubah Tema",
                        style: TextStyle(
                          fontSize: 22,
                        ),
                      ),
                      trailing: Text(
                        themeProvider.themeData == ThemeData.light()
                            ? "Light"
                            : "Dark",
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            child: LoginPage(),
                            type: PageTransitionType.bottomToTop,
                          ),
                        );
                      },
                      leading: Icon(Icons.logout),
                      title: Text(
                        "Logout",
                        style: TextStyle(
                          fontSize: 22,
                        ),
                      ),
                      trailing: Icon(Icons.arrow_circle_right_outlined),
                    ),
                  ],
                );
              },
            ),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "TrashCare",
                  style: TextStyle(color: Colors.black),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  ImageProvider _getImageProvider() {
    if (profileImagePath != null && profileImagePath!.isNotEmpty) {
      File imageFile = File(profileImagePath!);
      if (imageFile.existsSync()) {
        return FileImage(imageFile);
      }
    }
    return AssetImage("images/profil.png");
  }
}
