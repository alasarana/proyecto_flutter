import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:proj4dart/proj4dart.dart';

/// Convierte las coordenadas a las adecuadas para Google Maps
LatLng convertEPSG25830ToLatLng(double x, double y) {
  final sourceCRS = Projection.parse(
      'PROJCS["ETRS89 / UTM zone 30N",GEOGCS["ETRS89",DATUM["European_Terrestrial_Reference_System_1989",SPHEROID["GRS 1980",6378137,298.257222101,AUTHORITY["EPSG","7019"]],AUTHORITY["EPSG","6258"]],PRIMEM["Greenwich",0,AUTHORITY["EPSG","8901"]],UNIT["degree",0.0174532925199433,AUTHORITY["EPSG","9122"]],AUTHORITY["EPSG","4258"]],PROJECTION["Transverse_Mercator"],PARAMETER["latitude_of_origin",0],PARAMETER["central_meridian",-3],PARAMETER["scale_factor",0.9996],PARAMETER["false_easting",500000],PARAMETER["false_northing",0],UNIT["metre",1,AUTHORITY["EPSG","9001"]],AXIS["Easting",EAST],AXIS["Northing",NORTH],AUTHORITY["EPSG","25830"]]');
  final targetCRS = Projection.get('EPSG:4326');
  final point = Point(x: x, y: y);
  final transformedPoint = sourceCRS.transform(targetCRS!, point);

  return LatLng(transformedPoint.y, transformedPoint.x);
}

class MapController {
  static final MapController _instance = MapController._internal();

  factory MapController() {
    return _instance;
  }

  MapController._internal();

  late Completer<GoogleMapController> _controller;

  void setController(Completer<GoogleMapController> controller) {
    _controller = controller;
  }

  void moveCameraTo(LatLng target, {double zoom = 12}) {
    _controller.future.then((controller) {
      controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: target, zoom: zoom),
        ),
      );
    });
  }
}
