import 'package:flutter/material.dart';

import 'theme/light_theme.dart';
import 'view/screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Brown Store',
      debugShowCheckedModeBanner: false,
      theme: light,
     home: SplashScreen(),
    );
  }
}
