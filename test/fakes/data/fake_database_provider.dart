import 'package:restaurant_tour/data/datasources/local/provider/base_database_provider.dart';
import 'package:sembast/sembast_memory.dart';
import 'package:sembast/src/api/v2/database.dart';

class FakeDatabaseProvider extends BaseDatabaseProvider {
  late final Database _database;

  @override
  Database get database => _database;

  @override
  Future<void> init() async {
    _database = await newDatabaseFactoryMemory().openDatabase('test.db');
  }

  @override
  Future<void> close() async {
    await _database.close();
  }
}
