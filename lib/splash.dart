import 'package:flutter/material.dart';
import 'package:trashcare/Page.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(Duration(milliseconds: 5000), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => PageSatu()));
  }

  @override
  Widget build(BuildContext context) {
     return MaterialApp(
        home: Scaffold(
      backgroundColor: Color(0xFF395144),
    body: Center(
      child: Image(
        width: 212,
        height: 212,
        image: AssetImage('images/logo.png'),
        ),
      ),
     ),
    );
  }
}
