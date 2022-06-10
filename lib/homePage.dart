import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mascotas1/pets.dart';
import 'package:mascotas1/new_pet.dart';

final petsRef =
    FirebaseFirestore.instance.collection('Mascotas').withConverter<Pets>(
          fromFirestore: (snapshots, _) => Pets.fromJson(snapshots.data()!),
          toFirestore: (pet, _) => pet.toJson(),
        );

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 180, 133, 63),
        title: const Text("Alertas"),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.vertical_align_center),
          ),
        ],
      ),
      drawer: const NavDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const NewPet()));
        },
        backgroundColor: const Color.fromARGB(255, 180, 133, 63),
        child: const Icon(Icons.add_outlined),
      ),
      body: StreamBuilder<QuerySnapshot<Pets>>(
        stream: petsRef.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }

          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final data = snapshot.requireData;

          return ListView.builder(
            itemCount: data.size,
            itemBuilder: (context, index) {
              return _PetsItem(
                data.docs[index].data(),
                data.docs[index].reference,
              );
            },
          );
        },
      ),
    );
  }
}

class NavDrawer extends StatelessWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: const <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Ariadna Jimenez Hinojosa"),
            accountEmail: Text("ariadna.jmnz.h@gmail.com"),
            currentAccountPicture: FlutterLogo(),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 180, 133, 63),
            ),
          ),
          ListTile(
            leading: Icon(Icons.folder),
            title: Text("Mascota perdida"),
          ),
          ListTile(
            leading: Icon(Icons.folder),
            title: Text("Mascota en casa"),
          ),
          ListTile(
            leading: Icon(Icons.folder),
            title: Text("Mascota encontrada"),
          ),
        ],
      ),
    );
  }
}

class _PetsItem extends StatelessWidget {
  _PetsItem(this.pet, this.reference);

  final Pets pet;
  final DocumentReference<Pets> reference;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.all(15),
      elevation: 10,
      color: const Color.fromARGB(255, 227, 210, 185),
      child: Column(
        children: <Widget>[
          ListTile(
            contentPadding: const EdgeInsets.fromLTRB(15, 10, 25, 0),
            title: Text(
              pet.name.toString(),
              style: const TextStyle(color: Colors.black),
            ),
            subtitle: Text(
              pet.message.toString(),
              style: const TextStyle(color: Colors.black),
            ),
            leading: const Icon(Icons.pets),
          ),
          const Divider(color: Colors.black54, indent: 15, endIndent: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton(
                onPressed: () {},
                child: const Text(
                  ' ',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
