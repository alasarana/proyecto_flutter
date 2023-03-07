import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:proyecto_flutter/widgets/error_card.dart';
import 'package:proyecto_flutter/widgets/list_tile.dart';

import '../models/road.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Road> response = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    final url = Uri.parse(
        'https://datosabiertos.navarra.es/es/api/3/action/datastore_search?resource_id=9323f68f-9c8f-47e1-884c-d6985b957606');
    final response = await get(url);
    final value = jsonDecode(response.body);
    setState(() {
      this.response = Road.fromApiResponse(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
            alignment: Alignment.center, child: Text('Lista de Carreteras')),
      ),
      body: response.isNotEmpty
          ? ListView.separated(
              //TODO: Ordenar con isFav
              padding: const EdgeInsets.all(18),
              itemCount: response.length,
              itemBuilder: (context, index) {
                return RoadTile(road: response[index]);
              },
              separatorBuilder: (context, index) => const SizedBox(
                    height: 2,
                  ))
          : const ErrorCard(),
    );
  }
}
