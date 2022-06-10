// import 'package:mascotas1/homePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:mascotas1/authenticator.dart';

class GoogleAuthenticator extends StatelessWidget {
  const GoogleAuthenticator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 227, 210, 185),
      body: Center(
        child: MaterialButton(
          onPressed: () async {
            User? user = await Authenticator.iniciarSesion(context: context);
            print(user?.displayName);
            Get.toNamed('/second');
          },
          color: Color.fromARGB(255, 180, 133, 63),
          child: const Icon(FontAwesomeIcons.google),
          textColor: Colors.white,
        ),
      ),
    );
  }
}
