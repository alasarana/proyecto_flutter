class Road {
  final int id;
  final String carretera;
  final String titulo;
  final String categoria;
  final String ubicacion;
  final String fecha;
  final String afeccion;
  final String tipo;
  final String detalles;
  final String gravedad;
  final String actualizacion;
  final int coordX;
  final int coordY;
  final int pk;

  Road(
      this.id,
      this.carretera,
      this.titulo,
      this.categoria,
      this.ubicacion,
      this.fecha,
      this.afeccion,
      this.tipo,
      this.detalles,
      this.gravedad,
      this.actualizacion,
      this.coordX,
      this.coordY,
      this.pk);

  static List<Road> fromApiResponse(dynamic apiResponse) {
    final List<Road> roads = [];
    for (final record in apiResponse['result']['records']) {
      final road = Road(
        record['_id'],
        record['Carretera'],
        record['Titulo'],
        record['Categoria'],
        record['Ubicacion'],
        record['Fecha_incidencia'],
        record['Afeccion'],
        record['Tipo'],
        record['Otros_datos'],
        record['Gravedad'],
        record['Ultima_actualizacion'],
        record['Coord_X_en_EPSG_25830'],
        record['Coord_Y_en_EPSG_25830'],
        record['PK'],
      );

      roads.add(road);
    }

    return roads;
  }

  static final Map<String, String> categoryImagePath = {
    'Meteorológicas': 'assets/weath_warn.webp',
    'Obras': 'assets/work_warn.webp',
  };

  String getImagePathForCategory() {
    return categoryImagePath[categoria] ?? 'assets/def_warn.webp';
  }
}
