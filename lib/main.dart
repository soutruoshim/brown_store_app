import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/auth_provider.dart';
import 'provider/splash_provider.dart';
import 'theme/light_theme.dart';
import 'view/screen/splash_screen.dart';
import 'di_container.dart' as di;

Future<void> main() async {
  HttpOverrides.global = new MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => di.sl<SplashProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<AuthProvider>()),
    ],
    child: MyApp(),
  ));
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Brown Store',
      debugShowCheckedModeBanner: false,
      theme: light,
     home: const SplashScreen(),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  // @override
  // HttpClient createHttpClient(SecurityContext context) {
  //   return super.createHttpClient(context)..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  // }
}