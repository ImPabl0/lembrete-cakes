import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:lembrete_cakes/Datasource/sqlite.dart';
import 'package:lembrete_cakes/Models/cliente.dart';
import 'package:lembrete_cakes/Models/dto/pedido_dto.dart';
import 'package:lembrete_cakes/Models/pedido.dart';
import 'package:lembrete_cakes/Models/produto.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

part 'pedidos_event.dart';
part 'pedidos_state.dart';

class PedidosBloc extends Bloc<PedidosEvent, PedidosState> {
  List<Pedido> _pedidos = [];

  PedidosBloc() : super(PedidosInitialState(pedidos: const [])) {
    // on<PedidosEvent>((event, emit) {

    // });
    on<BuscarTodosOsPedidosEvent>(
      (event, emit) async {
        ///Emite estado de carregamento

        emit.call(CarregandoPedidosState(pedidos: const []));
        Database database = await SQLiteController.getDatabase();

        ///Busca no banco todos os pedidos, clientes e produtos

        List<Map<String, dynamic>> pedidosMap = await database.query("pedido");
        List<Map<String, dynamic>> clientesMap =
            await database.query("cliente");
        List<Map<String, dynamic>> produtosMap =
            await database.query("produto");

        List<Cliente> clientes =
            clientesMap.map((e) => Cliente.fromMap(e)).toList();
        List<Produto> produtos =
            produtosMap.map((e) => Produto.fromSQLite(e)).toList();
        List<PedidoDTO> pedidos =
            pedidosMap.map((e) => PedidoDTO.fromMap(e)).toList();
        List<Pedido> pedidosFormados = [];

        ///Preenche todos os pedidos com seus respectivos produtos e clientes

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
            continue;
          }
        }

        ///Seta a lista padrão com o resultado buscado

        _pedidos = pedidosFormados;

        ///Emite o estado de pedido carregado

        emit.call(PedidosCarregadosState(pedidos: pedidosFormados));
      },
    );
  }
}
