import 'package:bloc/bloc.dart';
import 'package:lembrete_cakes/Models/pedido.dart';
import 'package:meta/meta.dart';

part 'pedidos_event.dart';
part 'pedidos_state.dart';

class PedidosBloc extends Bloc<PedidosEvent, PedidosState> {
  PedidosBloc() : super(PedidosInitial(pedidos: [])) {
    on<PedidosEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
