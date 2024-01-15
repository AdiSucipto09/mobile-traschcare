import 'package:flutter/material.dart';
import 'package:trashcare/Page.dart';

void main() {
  runApp(const Splash());
}

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _startAnimation();
  }

  _startAnimation() async {
    await Future.delayed(Duration(milliseconds: 1000));
    _animationController.forward();
    _navigateToHome(); // Panggil navigasi setelah animasi selesai
  }

  _navigateToHome() async {
    await Future.delayed(Duration(milliseconds: 5000));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => PageSatu()),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF395144),
        body: Center(
          child: AnimatedBuilder(
            animation: _animationController,
            builder: (BuildContext context, Widget? child) {
              return Transform.scale(
                scale: _animation.value,
                child: Image(
                  width: 212,
                  height: 212,
                  image: AssetImage('images/logo.png'),
                ),
              );
            },
          ),
        ),
      ),
      debugShowCheckedModeBanner: false, // Tambahkan ini untuk menyembunyikan label debug
    );
  }
}
