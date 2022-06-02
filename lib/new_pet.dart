//import 'package:aplicacion_libros1/Libros.dart';
import 'package:mascotas1/services.dart';
import 'package:flutter/material.dart';

class NewPet extends StatefulWidget {
  const NewPet({Key? key}) : super(key: key);

  @override
  State<NewPet> createState() => _NewPetState();
}

class _NewPetState extends State<NewPet> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  final GlobalKey<FormState> _formularioKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 207, 236, 81),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        //height: 300,
        color: Colors.white,
        child: Form(
            key: _formularioKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration:
                        const InputDecoration(labelText: 'Nombre mascota:'),
                    validator: (String? dato) {
                      if (dato!.isEmpty) {
                        return 'Este campo es requerido';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _messageController,
                    decoration: const InputDecoration(
                      labelText: 'Escribe tu mensaje:',
                    ),
                    validator: (String? dato) {
                      if (dato!.isEmpty) {
                        return 'Este campo es requerido';
                      }
                      return null;
                    },
                    maxLines: 10,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          if (_formularioKey.currentState!.validate()) {
                            bool respuesta = await Services().savePets(
                              _nameController.text,
                              _messageController.text,
                            );
                            if (respuesta) {
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Aviso agregado correctamente'),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Algo salió mal'),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 207, 236, 81),
                        ),
                        child: const Text('Aceptar'),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 207, 236, 81),
                        ),
                        child: const Text('Cancelar'),
                      ),
                    ],
                  )
                ],
              ),
            )),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _messageController.dispose();
    super.dispose();
  }
}
