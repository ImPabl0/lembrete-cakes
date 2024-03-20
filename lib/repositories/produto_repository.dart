import 'package:lembrete_cakes/Models/dto/tipo_caracteristica_dto.dart';
import 'package:lembrete_cakes/Models/produto.dart';
import 'package:lembrete_cakes/Models/produto_caracteristica.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

abstract class ProdutoRepository {
  Future<List<Produto>> getProdutos();
  Future<Produto?> getProduto(int id);
  Future<Produto> createProduto(Produto produto);
  Future<Produto> updateProduto(Produto produto);
  Future<void> deleteProduto(int id);
}

class ProdutoRepositoryImpl implements ProdutoRepository {
  final Database _database;
  ProdutoRepositoryImpl({required Database database}) : _database = database;

  @override
  Future<Produto> createProduto(Produto produto) async {
    int id = await _database.insert("produto", produto.toMap());
    return produto.copyWith(id: id);
  }

  @override
  Future<void> deleteProduto(int id) async {
    await _database.delete("produto", where: "id = ?", whereArgs: [id]);
  }

  @override
  Future<Produto?> getProduto(int id) async {
    List<Map<String, dynamic>> produtosMap =
        await _database.query("produto", where: "id = ?", whereArgs: [id]);
    List<Map<String, dynamic>> produtosCaracteristicasMap = await _database
        .query("caracteristica",
            where: "id_produto in ?",
            whereArgs: [produtosMap.map((e) => e["id"]).toList()]);
    List<Map<String, dynamic>> valorCaracteristica = await _database.query(
        "valor_caracteristica",
        where: "id_caracteristica in ?",
        whereArgs: [produtosCaracteristicasMap.map((e) => e["id"]).toList()]);

    List<Produto> produtos =
        produtosMap.map((e) => Produto.fromSQLite(e)).toList();

    List<ProdutoCaracteristica> caracteristicas = produtosCaracteristicasMap
        .map((e) => ProdutoCaracteristica.fromMap(e))
        .toList();

    List<TipoCaracteristicaDTO> tiposCaracteristicas = valorCaracteristica
        .map((e) => TipoCaracteristicaDTO.fromSQLite(map: e))
        .toList();

    for (ProdutoCaracteristica caracteristica in caracteristicas) {
      caracteristica.tipoCaracteristica = tiposCaracteristicas
          .where(
            (element) => element.idCaracteristica == caracteristica.id,
          )
          .firstOrNull
          ?.tipo;
    }
    for (Produto produto in produtos) {
      produto.caracteristicas = caracteristicas
          .where((element) => element.idProduto == produto.id)
          .toList();
    }
    return produtos.firstOrNull;
  }

  @override
  Future<List<Produto>> getProdutos() async {
    List<Map<String, dynamic>> produtosMap = await _database.query("produto");
    List<Map<String, dynamic>> produtosCaracteristicasMap = await _database
        .query("caracteristica",
            where: "id_produto in ?",
            whereArgs: [produtosMap.map((e) => e["id"]).toList()]);
    List<Map<String, dynamic>> valorCaracteristica = await _database.query(
        "valor_caracteristica",
        where: "id_caracteristica in ?",
        whereArgs: [produtosCaracteristicasMap.map((e) => e["id"]).toList()]);

    List<Produto> produtos =
        produtosMap.map((e) => Produto.fromSQLite(e)).toList();

    List<ProdutoCaracteristica> caracteristicas = produtosCaracteristicasMap
        .map((e) => ProdutoCaracteristica.fromMap(e))
        .toList();

    List<TipoCaracteristicaDTO> tiposCaracteristicas = valorCaracteristica
        .map((e) => TipoCaracteristicaDTO.fromSQLite(map: e))
        .toList();

    for (ProdutoCaracteristica caracteristica in caracteristicas) {
      caracteristica.tipoCaracteristica = tiposCaracteristicas
          .where(
            (element) => element.idCaracteristica == caracteristica.id,
          )
          .firstOrNull
          ?.tipo;
    }
    for (Produto produto in produtos) {
      produto.caracteristicas = caracteristicas
          .where((element) => element.idProduto == produto.id)
          .toList();
    }
    return produtos;
  }

  @override
  Future<Produto> updateProduto(Produto produto) {
    // TODO: implement updateProduto
    throw UnimplementedError();
  }
}
