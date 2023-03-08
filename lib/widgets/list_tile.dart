import 'package:flutter/material.dart';

import '../models/road.dart';
import '../screens/road_screen.dart';

class RoadTile extends StatefulWidget {
  final Road road;

  const RoadTile({super.key, required this.road});

  @override
  State<RoadTile> createState() => _RoadTileState();
}

class _RoadTileState extends State<RoadTile> {
  late bool isFav;

  @override
  void initState() {
    super.initState();
    isFav = widget.road.isFav();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: isFav ? 8 : 1,
      child: ListTile(
        leading: const Icon(
          Icons.remove_road,
          size: 35,
        ),
        title: Text(widget.road.carretera,
            style: const TextStyle(fontWeight: FontWeight.bold)),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => RoadScreen(
                      road: widget.road,
                    )),
          );
        },
      ),
    );
  }
}
