import 'dart:io';

import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class AppDatabase {
  static final AppDatabase _instance = AppDatabase._internal();
  static final DatabaseFactory _dbFactory = databaseFactoryIo;
  static Database? _database;

  factory AppDatabase() => _instance;

  AppDatabase._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String dbPath = path.join(appDocDir.path, 'flutter_test.db');
    Database database = await _dbFactory.openDatabase(dbPath);
    return database;
  }

  Future closeDatabase() async {
    if (_database != null) {
      await _database!.close();
      _database = null;
    }
  }
}
