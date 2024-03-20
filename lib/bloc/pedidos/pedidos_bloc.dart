import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lembrete_cakes/Datasource/sqlite.dart';
import 'package:lembrete_cakes/Models/pedido.dart';
import 'package:lembrete_cakes/repositories/pedido_repository.dart';

part 'pedidos_event.dart';
part 'pedidos_state.dart';

class PedidosBloc extends Bloc<PedidosEvent, PedidosState> {
  PedidoRepository? _pedidoRepository;
  Future<PedidoRepository> get _getPedidoRepository async {
    return _pedidoRepository ??=
        PedidoRepositoryImpl(database: await SQLiteController.getDatabase());
  }

  PedidosBloc() : super(PedidosInitialState(pedidos: const [])) {
    // on<PedidosEvent>((event, emit) {

    // });
    on<BuscarTodosOsPedidosEvent>(
      (event, emit) async {
        ///Emite estado de carregamento
        emit.call(PedidosCarregandoPedidosState(pedidos: const []));
        PedidoRepository pedidoRepository = await _getPedidoRepository;
        List<Pedido> pedidos = await pedidoRepository.getPedidos();
        emit.call(PedidosCarregadosState(pedidos: pedidos));
      },
    );
  }
}
