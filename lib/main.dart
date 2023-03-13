import 'dart:io';

import 'package:brown_store/provider/parse_provider.dart';
import 'package:brown_store/provider/report_parse_provider.dart';
import 'package:brown_store/provider/theme_provider.dart';
import 'package:brown_store/utill/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:provider/provider.dart';

import 'provider/auth_provider.dart';
import 'provider/splash_provider.dart';
import 'theme/light_theme.dart';
import 'utill/app_constants.dart';
import 'view/screen/splash_screen.dart';
import 'di_container.dart' as di;

Future<void> main() async {
  HttpOverrides.global = new MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  //=======parse server=============
  /*
    await Parse().initialize(
        AppConstants.keyApplicationName,
        AppConstants.keyParseServerUrl,
        clientKey: AppConstants.keyParseClientKey, // Required for some setups
        debug: true, // When enabled, prints logs to console
        liveQueryUrl: AppConstants.keyParseLiveServerUrl, // Required if using LiveQuery
        autoSendSessionId: true, // Required for authentication and ACL
    );

    final LiveQuery liveQuery = LiveQuery();

    QueryBuilder<ParseObject> query =
    QueryBuilder<ParseObject>(ParseObject('Orders'));

    Subscription subscription = await liveQuery.client.subscribe(query);

    subscription.on(LiveQueryEvent.create, (value) {
      print('*** CREATE ***: ${DateTime.now().toString()}\n $value ');
      print((value as ParseObject).objectId);
      print((value as ParseObject).updatedAt);
      print((value as ParseObject).createdAt);
      print((value as ParseObject).get("order_no"));
    });
  */

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => di.sl<ThemeProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<SplashProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<AuthProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<ParseProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<ReportParseProvider>()),
    ],
    child: MyApp(),
  ));
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appTitle,
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