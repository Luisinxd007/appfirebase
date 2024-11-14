import 'package:appfirebase/services/firebase_services.dart';
import 'package:flutter/material.dart';

class AddUsuario extends StatefulWidget {
  const AddUsuario({super.key});

  @override
  State<AddUsuario> createState() => _AddUsuarioState();
}

class _AddUsuarioState extends State<AddUsuario> {
  TextEditingController nombreController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nocuentaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar usuario'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 10),
            // Campo para ingresar el nombre
            TextField(
              controller: nombreController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nombre',
              ),
            ),
            const SizedBox(height: 10),
            // Campo para ingresar el correo
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
            ),
            const SizedBox(height: 10),
            // Campo para ingresar el número de cuenta
            TextField(
              controller: nocuentaController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'No. cuenta',
              ),
            ),
            const SizedBox(height: 20),
            // Botón para guardar los datos
            ElevatedButton(
              onPressed: () {
                agregarUsuario(
                  nombreController.text,
                  emailController.text,
                  nocuentaController.text,
                ).then((_) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Usuario agregado')),
                  );
                }).catchError((e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Error al agregar usuario: $e')),
                  );
                });
              },
              child: const Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }
}
