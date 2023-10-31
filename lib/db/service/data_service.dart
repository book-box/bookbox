import 'dart:async';

import 'package:bookbox/db/service/bookbox_db.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataService {
  Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initialize();
    return _database;
  }

  Future<String> get fullPath async {
    const name = 'book_database.db';
    final path = await getDatabasesPath();
    return join(path, name); 
  }

  Future<Database> _initialize() async{
    final path = await fullPath;
    var database = await openDatabase(
      path,
      version: 1,
      onCreate: _createDatabase,
      singleInstance: true,
    );
    return database;
  }

  Future<void> _createDatabase(Database database, int version) async => 
    await BookboxDb().creteTable(database);

  void main() async {

    WidgetsFlutterBinding.ensureInitialized();
    final database = openDatabase(
      join(await getDatabasesPath(), 'book_database.db'),
      onCreate: (db, version) {
        return db.execute(
          '''
          CREATE TABLE IF NOT EXISTS `mydb`.`Livro` (
            `idLivro` VARCHAR(40) NOT NULL,
            `Nome` VARCHAR(45) NULL,
            `Autor` VARCHAR(45) NULL,
            `Data` DATE NULL,
            `Descricao` LONGTEXT NULL,
            PRIMARY KEY (`idLivro`),
            UNIQUE INDEX `Id_UNIQUE` (`idLivro` ASC) VISIBLE)
          ENGINE = InnoDB;


          
          CREATE TABLE IF NOT EXISTS `mydb`.`Usuario` (
            `idLeitor` INT NOT NULL,
            `Nome` VARCHAR(45) NULL,
            `Email` VARCHAR(45) NULL,
            PRIMARY KEY (`idLeitor`))
          ENGINE = InnoDB;


          CREATE TABLE IF NOT EXISTS `mydb`.`Avaliacao` (
            `Livro_idLivro` VARCHAR(40) NOT NULL,
            `Leitor_idLeitor` INT NOT NULL,
            `Nota` DOUBLE NULL,
            `Comentario` LONGTEXT NULL,
            PRIMARY KEY (`Livro_idLivro`, `Leitor_idLeitor`),
            INDEX `fk_Livro_has_Leitor_Leitor1_idx` (`Leitor_idLeitor` ASC) VISIBLE,
            INDEX `fk_Livro_has_Leitor_Livro_idx` (`Livro_idLivro` ASC) VISIBLE,
            CONSTRAINT `fk_Livro_has_Leitor_Livro`
              FOREIGN KEY (`Livro_idLivro`)
              REFERENCES `mydb`.`Livro` (`idLivro`)
              ON DELETE NO ACTION
              ON UPDATE NO ACTION,
            CONSTRAINT `fk_Livro_has_Leitor_Leitor1`
              FOREIGN KEY (`Leitor_idLeitor`)
              REFERENCES `mydb`.`Usuario` (`idLeitor`)
              ON DELETE NO ACTION
              ON UPDATE NO ACTION)
          ENGINE = InnoDB; '''
        );
      },
      version: 1,
    );
  }

}
// Avoid errors caused by flutter upgrade.