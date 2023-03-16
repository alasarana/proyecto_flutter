import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart';

import '../db/database_helper.dart';
import '../models/road.dart';
import '../widgets/list_tile.dart';
import '../widgets/place_holder.dart';
import '../widgets/title.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  List<Road> roads = [];
  final Completer<GoogleMapController> _controller = Completer();
  static const CameraPosition _initialPosition =
      CameraPosition(target: LatLng(42.6606511, -1.6226859), zoom: 8.2);

  @override
  void initState() {
    super.initState();
    initializeData();
  }

  /// Solicita los datos de la API y los guarda en la lista de carreteras
  Future<void> initializeData() async {
    final url = Uri.parse(
        'https://datosabiertos.navarra.es/es/api/3/action/datastore_search?resource_id=9323f68f-9c8f-47e1-884c-d6985b957606');
    final response = await get(url);
    final value = jsonDecode(response.body);
    final roads = Road.fromApiResponse(value);
    final favourites = await DatabaseHelper.instance.getFavourites();

    for (final road in roads) {
      road.isFavourite = favourites.contains(road.pk);
    }

    // Ordena las carreteras: favoritas primero, luego por nombre
    roads.sort((a, b) => a.isFavourite == b.isFavourite
        ? a.carretera.compareTo(b.carretera)
        : a.isFavourite
            ? -1
            : 1);

    setState(() {
      this.roads = roads;
    });
  }

  /// Permite actualizar la lista de carreteras cuando se añade o elimina una carretera de favoritos
  void homeCallback() {
    setState(() {});
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppTitle(),
      ),
      body: _currentIndex == 0 ? buildMapScreen() : buildListScreen(),
      bottomNavigationBar: NavigationBar(
        elevation: 5,
        selectedIndex: _currentIndex,
        onDestinationSelected: _onItemTapped,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.map_outlined),
            selectedIcon: Icon(Icons.map),
            label: 'Mapa',
          ),
          NavigationDestination(
            icon: Icon(Icons.list_outlined),
            selectedIcon: Icon(Icons.list),
            label: 'Lista',
          ),
        ],
      ),
    );
  }

  Widget buildListScreen() {
    return Scaffold(
      // Si la lista de carreteras no está vacía, muestra la lista de carreteras
      body: RefreshIndicator(
        onRefresh: initializeData,
        child: ListView.separated(
            padding: const EdgeInsets.all(18),
            itemCount: roads.isNotEmpty ? roads.length : 8,
            itemBuilder: (context, index) {
              if (roads.isNotEmpty) {
                return RoadTile(road: roads[index], homeCallback: homeCallback);
              }
              return const PlaceHolder();
            },
            separatorBuilder: (context, index) => const SizedBox(
                  height: 2,
                )),
      ),
    );
  }

  Widget buildMapScreen() {
    return GoogleMap(
      initialCameraPosition: _initialPosition,
      mapType: MapType.normal,
      onMapCreated: (GoogleMapController controller) {
        if (!_controller.isCompleted) {
          _controller.complete(controller);
        }
      },
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
    );
  }
}
