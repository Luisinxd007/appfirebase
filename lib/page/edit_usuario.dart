import 'package:appfirebase/services/firebase_services.dart';
import 'package:flutter/material.dart';

class EditUsuario extends StatefulWidget {
  const EditUsuario({Key? key}) : super(key: key);

  @override
  State<EditUsuario> createState() => _EditUsuarioState();
}

class _EditUsuarioState extends State<EditUsuario> {
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nocuentaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;

    nombreController.text = arguments['nombre'];
    emailController.text = arguments['email'];
    nocuentaController.text = arguments['nocuenta'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Usuario'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nombreController,
              decoration: const InputDecoration(labelText: 'Nombre'),
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: nocuentaController,
              decoration: const InputDecoration(labelText: 'Número de Cuenta'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await editUsuario(
                  arguments['uid'],
                  nombreController.text,
                  emailController.text,
                  nocuentaController.text,
                ).then((_) {
                  Navigator.pop(context);
                });
              },
              child: const Text('Actualizar'),
            ),
          ],
        ),
      ),
    );
  }
}
