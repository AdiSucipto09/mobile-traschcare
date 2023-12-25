import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:trashcare/edit_profile.dart';
import 'package:trashcare/edit_status.dart';
import 'package:trashcare/signin_page.dart';

 class ProfilePage extends StatefulWidget {
    const ProfilePage({Key? key}) :super(key: key);

   @override
  State<ProfilePage> createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
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
                      color:  Color(0xFF395144),
                      borderRadius: BorderRadius.circular(100),
                      image: DecorationImage(
                        image: AssetImage("images/profil.png"),
                        fit: BoxFit.cover,
                      )
                    ),
                  ),
                ),
                Text(
                  "Nabilla Auly Zahra",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "nabillaaz012@gmail.com",
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
            child: Column(
              children: [
                ListTile(
                 onTap: () {
              // Gunakan Navigator.push untuk perpindahan ke halaman EditStatus
              Navigator.push(
                context,
                PageTransition(child: EditStatus(), type: PageTransitionType.bottomToTop),
              );
        },
                  leading: Icon(Icons.system_update),
                  title: Text(
                    "Edit Status",
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                  trailing: Icon(Icons.arrow_circle_right_outlined),
                ),
                ListTile(
                    onTap: () {
              // Gunakan Navigator.push untuk perpindahan ke halaman EditStatus
              Navigator.push(
                context,
                PageTransition(child: EditProfile(), type: PageTransitionType.bottomToTop),
              );
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
                   onTap: () {},
                  leading: Icon(Icons.color_lens_outlined),
                  title: Text(
                    "Ubah Tema",
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                  trailing: Text("Light"),
                ),
                ListTile(
                  onTap: () {
              // Gunakan Navigator.push untuk perpindahan ke halaman EditStatus
              Navigator.push(
                context,
                PageTransition(child: SignIn(), type: PageTransitionType.bottomToTop),
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
            ),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "TrashCare",
                  style: TextStyle(color: Colors.black ),
                )
              ],
            ),
          ),

        ]
        
      ),
      
    );
  }
}


