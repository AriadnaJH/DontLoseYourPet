import 'dart:convert';

import 'package:mascotas1/pets.dart';
import 'package:firebase_database/firebase_database.dart';

class Services {
  Future<List<Pets>> getPets() async {
    List<Pets> myPets = [];

    final snap = await FirebaseDatabase.instance.ref().child('pets').get();
    if (snap.exists) {
      print(snap.value);
    }

    return myPets;
  }

  Future<bool> savePets(String name, String message) async {
    try {
      await FirebaseDatabase.instance
          .ref()
          .child('pets')
          .push()
          .set({'nombre': name, 'mensaje': message});
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
