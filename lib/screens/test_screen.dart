import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../models/road.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  List<Road> response = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() {
    get(Uri.parse(
            'https://datosabiertos.navarra.es/es/api/3/action/datastore_search?resource_id=9323f68f-9c8f-47e1-884c-d6985b957606&limit=2'))
        .then((value) => setResponse(jsonDecode(value.body)));
  }

  void setResponse(dynamic value) {
    setState(() {
      response = Road.fromApiResponse(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return response.isNotEmpty
        ? ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text(response[0].titulo),
                ),
              )
            ],
          )
        : const Text("Error");
  }
}
