import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> _addRecord() async {
    // Lógica para agregar registros (si es necesario)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Agregar Registro en Firestore'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/add'); // Navegar hacia AddUsuario
          },
          child: const Text('Ir a Agregar Usuario'),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
