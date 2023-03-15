import 'package:flutter/material.dart';
import 'package:roadwatch_navarra/screens/home_screen.dart';
import 'package:roadwatch_navarra/widgets/title.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  /// Permite actualizar la lista de carreteras cuando se añade o elimina una carretera de favoritos
  void homeCallback() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppTitle(),
        leading: const SizedBox(
          width: 40,
        ),
        actions: [
          SizedBox(
            width: 40,
            child: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                        // Actualiza la lista de carreteras para mostrar cambios en favoritos
                      )).then((value) => homeCallback());
                },
                icon: const Icon(Icons.list)),
          )
        ],
      ),
    );
  }
}
