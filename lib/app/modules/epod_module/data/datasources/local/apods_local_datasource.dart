import 'package:nasa_app/app/modules/epod_module/data/models/apod_model.dart';
import 'package:nasa_app/app/modules/epod_module/domain/entities/apod_entity.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class ApodsLocalDataSource {
  static const _databaseName = 'nasaAppDatabase';
  static const _tableName = 'apodsTable';
  static const _databaseVersion = 1;
  static const _columnId = 'id';
  static const _columnTitle = 'title';
  static const _columnExplanation = 'explanation';
  static const _columnUrl = 'url';
  static const _columnDate = 'date';

  static Database? _database;

  Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), _databaseName),
      onCreate: (db, _) {
        db.execute('''
          CREATE TABLE $_tableName(
            $_columnId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
            $_columnTitle TEXT,
            $_columnExplanation TEXT,
            $_columnUrl Text,
            $_columnDate TEXT
          )
        ''');
      },
      version: _databaseVersion,
    );
  }

  Future<List<Map<String, dynamic>>> getSavedApods() async {
    final db = await database;
    return db.rawQuery('SELECT * FROM $_tableName');
  }

  Future<void> insertApod(ApodModel apod) async {
    final db = await database;

    Map<String, dynamic> map = {
      _columnTitle: apod.title,
      _columnExplanation: apod.explanation,
      _columnUrl: apod.url,
      _columnDate: apod.date,
    };

    await db.insert(_tableName, map);
  }

  Future<void> clearApods() async {
    final db = await database;
    await db.delete(_tableName);
  }
}
