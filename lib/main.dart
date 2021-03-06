import 'package:mascotas1/authenticator_button.dart';
import 'package:mascotas1/homePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const GoogleAuthenticator()),
        GetPage(name: '/second', page: () => const MyHomePage())
      ],
    );
  }
}
