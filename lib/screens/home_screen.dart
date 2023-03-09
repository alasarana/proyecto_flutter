import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:proyecto_flutter/db/database_helper.dart';
import 'package:proyecto_flutter/widgets/error_card.dart';
import 'package:proyecto_flutter/widgets/list_tile.dart';

import '../models/road.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Road> roads = [];

  @override
  void initState() {
    super.initState();
    initializeData();
  }

  void initializeData() async {
    final url = Uri.parse(
        'https://datosabiertos.navarra.es/es/api/3/action/datastore_search?resource_id=9323f68f-9c8f-47e1-884c-d6985b957606');
    final response = await get(url);
    final value = jsonDecode(response.body);
    final roads = Road.fromApiResponse(value);
    final favourites = await DatabaseHelper.instance.getFavourites();

    for (final road in roads) {
      road.isFavourite = favourites.contains(road.pk);
    }

    setState(() {
      this.roads = roads;
    });
  }

  void homeCallback() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    roads.sort((a, b) => b.isFavourite ? 1 : 0);
    print("Rendered");

    return Scaffold(
        appBar: AppBar(
          title: const Align(
              alignment: Alignment.center, child: Text('Lista de Carreteras')),
        ),
        body: roads.isNotEmpty
            ? ListView.separated(
                padding: const EdgeInsets.all(18),
                itemCount: roads.length,
                itemBuilder: (context, index) {
                  return RoadTile(
                      road: roads[index], homeCallback: homeCallback);
                },
                separatorBuilder: (context, index) => const SizedBox(
                      height: 2,
                    ))
            : const ErrorCard(),
        floatingActionButton: FloatingActionButton(
          onPressed: () => {
            for (final road in roads)
              {if (road.isFavourite) print(road.carretera)},
          },
          child: const Icon(Icons.bug_report),
        ));
  }
}
