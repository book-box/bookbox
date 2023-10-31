import 'package:bookbox/db/livro_database.dart';
import 'package:bookbox/db/user_databasse.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static const _databaseName = "MyDatabase.db";
  static const _databaseVersion = 1;

  static const tableUsuario = 'Usuario';
  static const tableLivro = 'Livro';
  static const columnLivroIdLivro = 'Livro_idLivro';
  static const columnLeitorIdLeitor = 'Leitor_idLeitor';
  static const columnNota = 'Nota';
  static const columnComentario = 'Comentario';
  static const tableAvaliacao = 'Avaliacao';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE Livro (
            idLivro TEXT PRIMARY KEY,
            Nome TEXT,
            Autor TEXT,
            Data TEXT,
            Descricao TEXT
          )
          ''');
    await db.execute('''
          CREATE TABLE Usuario (
            idLeitor INTEGER PRIMARY KEY AUTOINCREMENT,
            Nome TEXT,
            Email TEXT
          )
          ''');
    await db.execute('''
          CREATE TABLE Avaliacao (
            Livro_idLivro TEXT,
            Leitor_idLeitor INTEGER,
            Nota REAL,
            Comentario TEXT,
            PRIMARY KEY (Livro_idLivro, Leitor_idLeitor),
            FOREIGN KEY (Livro_idLivro) REFERENCES Livro (idLivro),
            FOREIGN KEY (Leitor_idLeitor) REFERENCES Usuario (idLeitor)
          )
          ''');
  }

  Future<int> insert(String table, Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(table, row);
  }

  Future<List<Map<String, dynamic>>> queryAllRows(String table) async {
    Database db = await instance.database;
    return await db.query(table);
  }

  Future<int> update(
      String table, Map<String, dynamic> row, String idColumn) async {
    Database db = await instance.database;
    return await db
        .update(table, row, where: '$idColumn = ?', whereArgs: [row[idColumn]]);
  }

  Future<int> delete(String table, String idColumn, int id) async {
    Database db = await instance.database;
    return await db.delete(table, where: '$idColumn = ?', whereArgs: [id]);
  }

  Future<int> insertLivro(LivroDatabase livro) async {
    Database db = await instance.database;
    return await db.insert(tableLivro, livro.toMap());
  }

  Future<int> insertUser(UserDatabase user) async {
    Database db = await instance.database;
    return await db.insert(tableUsuario, user.toMap());
  }

  Future<int> insertAvaliacao(Map<String, dynamic> row) async {
    Database db = await instance.database;

    // Check if a row with the same (Livro_idLivro, Leitor_idLeitor) already exists
    List<Map<String, dynamic>> existingRows = await db.query(
      DatabaseHelper.tableAvaliacao,
      where:
          '${DatabaseHelper.columnLivroIdLivro} = ? AND ${DatabaseHelper.columnLeitorIdLeitor} = ?',
      whereArgs: [
        row[DatabaseHelper.columnLivroIdLivro],
        row[DatabaseHelper.columnLeitorIdLeitor]
      ],
    );

    if (existingRows.isEmpty) {
      // If no such row exists, insert the new row
      return await db.insert(DatabaseHelper.tableAvaliacao, row);
    } else {
      // If such a row exists, return an error code (or handle this case in some other way)
      return -1;
    }
  }
}
