import 'package:flutter/foundation.dart';
import 'package:lembrete_cakes/Models/cliente.dart';
import 'package:lembrete_cakes/Models/dto/pedido_dto.dart';
import 'package:lembrete_cakes/Models/produto.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import '../Models/pedido.dart';

abstract class PedidoRepository {
  Future<List<Pedido>> getPedidos();
  Future<Pedido> getPedido(int id);
  Future<Pedido> createPedido(Pedido pedido);
  Future<Pedido> updatePedido(Pedido pedido);
  Future<void> deletePedido(int id);
}

class PedidoRepositoryImpl implements PedidoRepository {
  final Database _database;
  PedidoRepositoryImpl({required Database database}) : _database = database;
  @override
  Future<Pedido> createPedido(Pedido pedido) {
    // TODO: implement createPedido
    throw UnimplementedError();
  }

  @override
  Future<void> deletePedido(int id) {
    // TODO: implement deletePedido
    throw UnimplementedError();
  }

  @override
  Future<Pedido> getPedido(int id) {
    // TODO: implement getPedido
    throw UnimplementedError();
  }

  @override
  Future<List<Pedido>> getPedidos() async {
    List<Map<String, dynamic>> pedidosMap = await _database.query("pedido");
    List<Map<String, dynamic>> clientesMap = await _database.query("cliente");
    List<Map<String, dynamic>> produtosMap = await _database.query("produto");

    List<Cliente> clientes =
        clientesMap.map((e) => Cliente.fromMap(e)).toList();
    List<Produto> produtos =
        produtosMap.map((e) => Produto.fromSQLite(e)).toList();
    List<PedidoDTO> pedidos =
        pedidosMap.map((e) => PedidoDTO.fromMap(e)).toList();
    List<Pedido> pedidosFormados = [];
    for (PedidoDTO pedidoDTO in pedidos) {
      try {
        Pedido pedido = Pedido.fromSQLite(pedidoDTO.toMap());
        pedido.cliente = clientes
            .firstWhere((element) => pedidoDTO.id_cliente == element.id);
        pedido.produto = produtos
            .firstWhere((element) => pedidoDTO.id_produto == element.id);
        pedidosFormados.add(pedido);
      } catch (e) {
        debugPrint("Erro ao preencher pedidos");
        break;
      }
    }
    return pedidosFormados;
  }

  @override
  Future<Pedido> updatePedido(Pedido pedido) {
    // TODO: implement updatePedido
    throw UnimplementedError();
  }
}
