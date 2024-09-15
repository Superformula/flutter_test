import 'package:sembast/sembast.dart';

abstract class BaseDatabaseProvider {
  Database get database;

  Future<void> init();

  Future<void> close();
}
