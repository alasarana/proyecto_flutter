import 'package:flutter/material.dart';

import '../models/road.dart';
import '../screens/road_screen.dart';

class RoadTile extends StatelessWidget {
  final Road road;
  final VoidCallback homeCallback;

  const RoadTile({super.key, required this.road, required this.homeCallback});
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: road.isFavourite
            ? BorderSide(
                color: Theme.of(context).colorScheme.secondary, width: 0.8)
            : BorderSide.none,
      ),
      elevation: road.isFavourite ? 8 : 2,
      child: ListTile(
        leading: const Icon(
          Icons.remove_road,
          size: 35,
        ),
        title: Text(road.carretera,
            style: const TextStyle(fontWeight: FontWeight.bold)),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RoadScreen(
                  road: road,
                ),
                // Actualiza la lista de carreteras para mostrar cambios en favoritos
              )).then((value) => homeCallback());
        },
      ),
    );
  }
}
