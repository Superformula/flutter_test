import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:restaurant_tour/data/datasources/local/provider/base_database_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class DatabaseProvider extends BaseDatabaseProvider {
  late final Database _database;

  @override
  Database get database => _database;

  @override
  Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    await dir.create(recursive: true);
    final dbPath = join(dir.path, 'database.db');
    _database = await databaseFactoryIo.openDatabase(dbPath);
  }

  @override
  Future<void> close() async {
    await _database.close();
  }
}
