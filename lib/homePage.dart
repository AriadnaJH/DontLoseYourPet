import 'package:flutter/material.dart';
import 'package:mascotas1/pets.dart';
import 'package:mascotas1/services.dart';
import 'package:mascotas1/new_pet.dart';

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 207, 236, 81),
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
        backgroundColor: const Color.fromARGB(255, 207, 236, 81),
        child: const Icon(Icons.add_outlined),
      ),
      body: FutureBuilder(
        future: Services().getPets(),
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          List myPets = snapshot.data ?? [];
          return ListView(
            children: [
              for (Pets pet in myPets)
                ListTile(
                  title: Text(pet.name.toString()),
                  subtitle: Text(pet.message.toString()),
                ),
            ],
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
            accountEmail: Text("correo@ejemplo.com"),
            currentAccountPicture: FlutterLogo(),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 207, 236, 81),
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
