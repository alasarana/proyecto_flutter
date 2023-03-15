import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const _databaseName = 'favsDatabase.db';
  static const _databaseVersion = 1;

  static const table = 'roads';
  static const columnId = 'id';
  static const columnIsFavourite = 'is_favourite';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  /// Inicializa la base de datos si no está creada
  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  /// Crea la tabla 'roads' si no existe
  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $table (
        $columnId INTEGER PRIMARY KEY,
        $columnIsFavourite INTEGER DEFAULT 0
      )
      ''');
  }

  Future<int> insertRoad(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(table, row);
  }

  Future<List<Map<String, dynamic>>> queryAllRoads() async {
    Database db = await instance.database;
    return await db.query(table);
  }

  Future<Map<String, dynamic>> queryRoad(int id) async {
    Database db = await instance.database;
    List<Map<String, dynamic>> result = await db.query(table,
        where: '$columnId = ?', whereArgs: [id], limit: 1);
    if (result.isNotEmpty) {
      return result.first;
    }
    throw Exception('Road with id $id not found');
  }

  Future<int> updateRoad(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row[columnId];
    return await db.update(table, row, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> deleteRoad(int id) async {
    Database db = await instance.database;
    return await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }

  /// Obtiene una lista de los ids de las carreteras favoritas
  Future<List<int>> getFavourites() async {
    final db = await DatabaseHelper.instance.database;
    final List<Map<String, dynamic>> result = await db.query(
      table,
      where: '$columnIsFavourite = ?',
      whereArgs: [1],
      columns: [columnId],
    );
    return List<int>.from(result.map((e) => e[columnId]));
  }

  /// Establece una carretera como favorita o no
  Future<void> setFavourite(id, bool isFavourite) async {
    final rowsAffected = await updateRoad({
      columnId: id,
      columnIsFavourite: isFavourite ? 1 : 0,
    });

    if (rowsAffected == 0) {
      await insertRoad({
        columnId: id,
        columnIsFavourite: isFavourite ? 1 : 0,
      });
    }
  }
}
