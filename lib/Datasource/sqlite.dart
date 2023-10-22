// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:lembrete_cakes/Datasource/helper/database_helpers.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class SQLiteController {
  static Database? _db;

  static Future<Database> startDB() async {
    Directory directory = await getApplicationDocumentsDirectory();
    late Database result;
    OpenDatabaseOptions options = OpenDatabaseOptions(
      version: 1,
      onCreate: (db, version) {
        Batch batch = db.batch();
        batch.execute(DatabaseHelpers.caracteristicaCreateQuery);
        batch.execute(DatabaseHelpers.clienteCreateQuery);
        batch.execute(DatabaseHelpers.formaDePagamentoCreateQuery);
        batch.execute(DatabaseHelpers.pagamentoCreateQuery);
        batch.execute(DatabaseHelpers.pedidoCreateQuery);
        batch.execute(DatabaseHelpers.produtoCreateQuery);
        batch.execute(DatabaseHelpers.valorCaracteristicaCreateQuery);
        batch.execute(DatabaseHelpers.enderecoCreateQuery);
        batch.commit();
      },
    );
    if (Platform.isAndroid) {
      result = await databaseFactory.openDatabase(
          join(directory.path, "lembrete_cakes.db"),
          options: options);
    } else if (Platform.isWindows) {
      result = await databaseFactoryFfi.openDatabase(
          join(directory.path, "lembrete_cakes.db"),
          options: options);
    }
    return _db ??= result;
  }
}
