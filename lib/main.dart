// import 'dart:_http';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:iot_project/Home%20page.dart';
import 'package:iot_project/pages/rough%20work.dart';
import 'package:iot_project/rough%20pages/Api%20checking.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HttpOverrides.global = MyHttpOverrides();
    return HomePage();
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
