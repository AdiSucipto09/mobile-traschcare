import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Theme Switcher',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light, // Tema default: terang (light)
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark, // Tema gelap (dark)
      ),
      home: Tema2(),
    );
  }
}

class Tema2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Theme Switcher'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Brightness currentBrightness = MediaQuery.of(context).platformBrightness;

            // Menetapkan tema berdasarkan preferensi tema sistem
            Brightness newBrightness =
                currentBrightness == Brightness.dark ? Brightness.light : Brightness.dark;
            
            DynamicTheme.of(context)!.setBrightness(newBrightness);
          },
          child: Text('Switch Theme'),
        ),
      ),
    );
  }
}

class DynamicTheme extends InheritedWidget {
  final Function(Brightness brightness) setBrightness;

  DynamicTheme({
    Key? key,
    required Widget child,
    required this.setBrightness,
  }) : super(key: key, child: child);

  static DynamicTheme? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<DynamicTheme>();

  @override
  bool updateShouldNotify(DynamicTheme oldWidget) => true;
}
