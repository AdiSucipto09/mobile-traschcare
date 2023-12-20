import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
    const ProfilePage({Key? key}) :super(key: key);

   @override
  State<ProfilePage> createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {
  @override
  void iniState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height /7,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(35.0),
                      bottomRight: Radius.circular(35.0),
                    ),
                    color:  Color(0xFF395144) ,
                    gradient: LinearGradient(
                      colors:[
                        Color(0x7F528B6C),
                        Color(0xFF395144),
                      ],
                      begin: FractionalOffset(0.0, 0.0),
                      end: FractionalOffset(1.0, 0.0),
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp)),
                ),
                Positioned(
                  bottom: -50.0,
                  child: InkWell(
                    child: CircleAvatar(
                      radius: 80,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 75,
                        backgroundColor: Colors.white,
                        child: ClipRRect(
                          child: Image.asset('images/profil.png'),
                        ),
                      ),
                    )),
                  ),
                  ]),
                  const SizedBox(
                    height: 55,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Column(
                        children: [
                          const Card(
                            elevation: 4,
                            child: ListTile(
                              leading: Icon(
                                Icons.person_outline,
                                color: Colors.brown,
                              ),
                              title: Text('Nabilla Auly Zahra'),
                            ),
                          ),
                          const Card(
                            elevation: 4,
                            child: ListTile(
                              leading: Icon(
                                Icons.phone_iphone_rounded,
                                color: Colors.pink,
                              ),
                              title: Text('+62 895-3579-73905'),
                            ),
                          ),
                          const Card(
                            elevation: 4,
                            child: ListTile(
                              leading: Icon(
                                Icons.lock_person_outlined,
                                color: Colors.blue,
                              ),
                              title: Text('Ubah Sandi'),
                            ),
                          ),
                          const Card(
                            elevation: 4,
                            child: ListTile(
                              leading: Icon(
                                Icons.logout_outlined,
                                color: Colors.purple,
                              ),
                              title: Text('Log Out'), 
                            ),
                          ),
                        ],
                      ), ),)
          ],
        ),
      ),
    );
  }

  @override
  void dispose(){
    super.dispose();
  }
}