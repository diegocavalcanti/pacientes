import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DB {
  static const DATABASE = 'banco.db';

  DB._privateConstructor();
  static final DB instance = DB._privateConstructor();
  Database _database;

  Future<Database> get() async {
    WidgetsFlutterBinding.ensureInitialized();
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), DATABASE),
      onCreate: (db, versao) async {
        await db.execute(createCustomers);
      },
      version: 1,
    );
  }

  String get createCustomers => '''
    CREATE TABLE customer (
      id INTEGER PRIMARY KEY AUTOINCREMENT, 
      name TEXT,
      cel TEXT,
      comments TEXT
    );
  ''';

  // String get titulos => '''
  //   CREATE TABLE titulos (
  //     id INTEGER PRIMARY KEY AUTOINCREMENT,
  //     campeonato TEXT,
  //     ano TEXT,
  //     time_id INTEGER,
  //     FOREIGN KEY (time_id) REFERENCES times(id) ON DELETE CASCADE
  //   );
  // ''';

  // setupTimes(db) async {
  //   for (Time time in TimesRepository.setupTimes()) {
  //     await db.insert('times', {
  //       'nome': time.nome,
  //       'brasao': time.brasao,
  //       'pontos': time.pontos,
  //       'idAPI': time.idAPI,
  //       'cor': time.cor.toString().replaceAll('Color(', '').replaceAll(')', ''),
  //     });
  //   }
  // }

}
