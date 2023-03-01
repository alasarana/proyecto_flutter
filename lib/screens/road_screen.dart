import 'package:flutter/material.dart';

import '../models/road.dart';

class RoadScreen extends StatelessWidget {
  final Road road;

  const RoadScreen({super.key, required this.road});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(road.carretera),
      ),
      body: Card(
        margin: const EdgeInsets.all(20.0),
        elevation: 8,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      const Text(
                        "Afección",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      Text(road.afeccion)
                    ],
                  ),
                  Expanded(child: Container()),
                  Column(
                    children: [
                      const Text(
                        "Problema",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      Text(road.titulo)
                    ],
                  ),
                  Expanded(child: Container()),
                  Column(
                    children: [
                      const Text(
                        "Nivel",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      Text(road.gravedad,
                          style: TextStyle(
                              color: Colors.orange[900], fontSize: 16))
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
              child: Image.asset("assets/m30.jpg", scale: 2),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                road.detalles,
                style:
                    const TextStyle(fontStyle: FontStyle.italic, fontSize: 15),
              ),
            ),
            Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Text("Prueba"),
            )
          ],
        ),
      ),
    );
  }
}
