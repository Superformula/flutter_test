import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._();
  static Database? _database;

  DBHelper._();

  factory DBHelper() {
    return _instance;
  }

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'favorites.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          '''
          CREATE TABLE favorites(
            id TEXT PRIMARY KEY
          )
          ''',
        );
      },
    );
  }

  // Insert a favorite (C in CRUD)
  Future<void> insertFavorite(String restaurantId) async {
    final db = await database;
    await db.insert(
      'favorites',
      {'id': restaurantId},
      conflictAlgorithm: ConflictAlgorithm.ignore,
    );
  }

  // Get all favorites (R in CRUD)
  Future<List<String>> getFavorites() async {
    final db = await database;
    final result = await db.query('favorites');
    return result.map((e) => e['id'] as String).toList();
  }

  // Remove a favorite (D in CRUD)
  Future<void> deleteFavorite(String restaurantId) async {
    final db = await database;
    await db.delete(
      'favorites',
      where: 'id = ?',
      whereArgs: [restaurantId],
    );
  }

  // Check if a restaurant is a favorite (Read one)
  Future<bool> isFavorite(String restaurantId) async {
    final db = await database;
    final result = await db.query(
      'favorites',
      where: 'id = ?',
      whereArgs: [restaurantId],
    );
    return result.isNotEmpty;
  }
}
