import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 188, 21, 21),
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
      body: const Center(
        child: Text("Perro perdido",
        style: TextStyle(fontSize: 30),),
      )
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
              color: Color.fromARGB(255, 188, 21, 21),
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
