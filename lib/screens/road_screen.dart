import 'package:flutter/material.dart';

import '../models/road.dart';
import '../widgets/road_card.dart';

class RoadScreen extends StatefulWidget {
  final Road road;
  const RoadScreen({super.key, required this.road});

  @override
  State<RoadScreen> createState() => _RoadScreenState();
}

class _RoadScreenState extends State<RoadScreen> {
  late final Road road;
  bool isFav = false;

  @override
  void initState() {
    super.initState();
    road = widget.road;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(road.carretera),
      ),
      body: RoadCard(
        road: road,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          setState(() {
            isFav = !isFav;
          }),
          road.setFav(isFav)
        },
        child: Icon(isFav ? Icons.favorite : Icons.favorite_border),
      ),
    );
  }
}
