import 'package:flutter/material.dart';

import '../models/road.dart';
import 'road_screen.dart';
import 'test_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final items = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleTextStyle:
            const TextStyle(fontWeight: FontWeight.normal, fontSize: 22),
        title: const Align(
            alignment: Alignment.center, child: Text('Lista de Carreteras')),
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(
              Icons.remove_road,
              size: 35,
            ),
            title: const Text("Test",
                style: TextStyle(fontWeight: FontWeight.bold)),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                //MaterialPageRoute(builder: (context) => const RoadScreen()),
                MaterialPageRoute(builder: (context) => const TestScreen()),
              );
            },
          );
        },
      ),
    );
  }
}
