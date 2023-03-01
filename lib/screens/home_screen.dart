import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:proyecto_flutter/widgets/error_card.dart';

import '../models/road.dart';
import 'road_screen.dart';

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
        'https://datosabiertos.navarra.es/es/api/3/action/datastore_search?resource_id=9323f68f-9c8f-47e1-884c-d6985b957606&limit=2');
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
        titleTextStyle:
            const TextStyle(fontWeight: FontWeight.normal, fontSize: 22),
        title: const Align(
            alignment: Alignment.center, child: Text('Lista de Carreteras')),
      ),
      body: response.isNotEmpty
          ? ListView.builder(
              itemCount: response.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(
                    Icons.remove_road,
                    size: 35,
                  ),
                  title: Text(response[index].carretera,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RoadScreen(
                                road: response[index],
                              )),
                    );
                  },
                );
              },
            )
          : const ErrorCard(),
    );
  }
}
