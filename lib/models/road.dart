import 'dart:developer';

class Road {
  //TODO: Última actualización
  final String carretera;
  final String titulo;
  final String incidencia;
  final String afeccion;
  final String tipo;
  final String detalles;
  final String gravedad;
  final String fecha;
  //TODO: Coordenadas

  Road(this.carretera, this.titulo, this.incidencia, this.afeccion, this.tipo,
      this.detalles, this.gravedad, this.fecha);

  static List<Road> fromApiResponse(dynamic apiResponse) {
    final List<Road> roads = [];
    for (final record in apiResponse['result']['records']) {
      print(record['Carretera']);
      final road = Road(
        record['Carretera'],
        record['Titulo'],
        record['Fecha_incidencia'],
        record['Afeccion'],
        record['Tipo'],
        record['Otros_datos'],
        record['Gravedad'],
        record['Ultima_actualizacion'],
      );

      roads.add(road);
    }

    return roads;
  }
}
