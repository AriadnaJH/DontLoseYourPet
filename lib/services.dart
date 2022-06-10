import 'package:cloud_firestore/cloud_firestore.dart';

class Services {
  CollectionReference Pets = FirebaseFirestore.instance.collection('Mascotas');
  Future<bool> addPet(String name, String message) async {
    await Pets.add({
      'name': name,
      'message': message,
    })
        .then((value) => print('Mascota añadida'))
        .catchError((error) => print('Error al añadir la mascota: $error'));
    return true;
  }
}
