import 'package:appfirebase/services/firebase_services.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List> usuarios;

  @override
  void initState() {
    super.initState();
    usuarios = getUsuarios();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Usuarios'),
      ),
      body: FutureBuilder<List>(
        future: usuarios,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error al cargar usuarios'));
          } else if (snapshot.hasData && snapshot.data!.isEmpty) {
            return const Center(child: Text('No hay usuarios registrados'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data?.length ?? 0,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data?[index]['nombre'] ?? ''),
                  subtitle: Text(snapshot.data?[index]['email'] ?? ''),
                  trailing: const Icon(Icons.edit),
                  onTap: () async {
                    await Navigator.pushNamed(context, '/edit', arguments: {
                      'uid': snapshot.data?[index]['uid'],
                      'nombre': snapshot.data?[index]['nombre'],
                      'email': snapshot.data?[index]['email'],
                      'nocuenta': snapshot.data?[index]['nocuenta'],
                    });
                    setState(() {
                      usuarios = getUsuarios();
                    });
                  },
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
