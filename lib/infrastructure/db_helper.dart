import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  Transaction _transaction;
  Database _database;

  final String _dbFile = 'todo.db';
  final int _version = 1;

  Future<Database> _open() async {
    final String databasesPath = await getDatabasesPath();
    final String path = join(databasesPath, _dbFile);

    _database = await openDatabase(
      path,
      version: _version,
      onCreate: (Database database, int version) async {
        await database.execute('''
          CREATE TABLE tasks (
            id INTEGER NOT NULL,
            title TEXT NOT NULL,
            description TEXT,
            date DATE NOT NULL,
            PRIMARY KEY (id)
          )
        ''');
      },
    );
    return _database;
  }

  Future<List<Map<String, dynamic>>> rawQuery(
    String sql, [
    List<dynamic> arguments,
  ]) async {
    return await (_transaction ?? _database ?? await _open()).rawQuery(sql, arguments);
  }

  Future<int> rawInsert(
    String sql, [
    List<dynamic> arguments,
  ]) async {
    return await (_transaction ?? _database ?? await _open()).rawInsert(sql, arguments);
  }
}
