import 'package:flutter/material.dart';

import '../models/road.dart';

class RoadCard extends StatelessWidget {
  final Road road;
  const RoadCard({super.key, required this.road});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(20.0),
      elevation: 8,
      child: Column(
        children: [
          Card(
            elevation: 0.8,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 5, 16, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: Container()),
                  Column(
                    children: [
                      const Text(
                        "Estado",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      Text(
                        road.titulo,
                        style: Theme.of(context).textTheme.labelLarge,
                      )
                    ],
                  ),
                  const Spacer(
                    flex: 3,
                  ),
                  Column(
                    children: [
                      const Text(
                        "Nivel",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      Text(
                        road.gravedad,
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge
                            ?.copyWith(color: Colors.orange[800]),
                      )
                    ],
                  ),
                  Expanded(child: Container()),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 0.3,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(28, 12, 28, 0),
                    child: Row(children: [
                      Flexible(
                        child: Text(
                          road.afeccion,
                          style: Theme.of(context).textTheme.headlineMedium,
                          maxLines: 2,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Image.asset(road.getImagePathForCategory(),
                            scale: 4),
                      ),
                    ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Inicio: ${road.fecha}",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 8, 0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Causa:",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                road.tipo,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 8, 0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Detalles:",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
            child: Text(
              road.detalles,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Expanded(child: Container()),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ActionChip(
              avatar: const Icon(Icons.location_on),
              label: const Text("Localización"),
              onPressed: () => {},
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(14, 8, 8, 12),
              child: Text(
                "Última actualización: ${road.actualizacion}",
                style: Theme.of(context).textTheme.caption,
              ),
            ),
          )
        ],
      ),
    );
  }
}
