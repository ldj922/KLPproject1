import 'package:flutter/material.dart';
import 'package:raitto/screens/home_screen.dart';
/*import 'package:raitto/screens/secondscreens/detail_screen_cafe.dart';*/

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}
