import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lembrete_cakes/Models/pedido.dart';
import 'package:lembrete_cakes/Styles/text_styles.dart';
import 'package:lembrete_cakes/Views/Widgets/card_pedido.dart';

import '../common/pedidos_controller/bloc/pedidos_bloc.dart';

class PedidoPage extends StatefulWidget {
  const PedidoPage({
    super.key,
  });

  @override
  State<PedidoPage> createState() => _PedidoPageState();
}

class _PedidoPageState extends State<PedidoPage> {
  List<Pedido> pedidos = [];

  @override
  void initState() {
    loadPedidos();
    super.initState();
  }

  late PedidosBloc pedidosBlocProvider = context.read<PedidosBloc>();
  Future<void> loadPedidos() async {
    pedidosBlocProvider.add(BuscarTodosOsPedidosEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Seus pedidos',
                  style: CustomTextStyles.pinkBigTitle,
                ),
              ],
            ),
          ),
          BlocBuilder<PedidosBloc, PedidosState>(
            bloc: pedidosBlocProvider,
            builder: (context, state) {
              if (state is CarregandoPedidosState) {
                return const CircularProgressIndicator();
              } else {
                return Expanded(
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    margin: const EdgeInsets.only(top: 10),
                    child: ListView.separated(
                      itemCount: state.pedidos.length,
                      itemBuilder: (context, index) {
                        Pedido pedido = state.pedidos[index];
                        return CardPedido(pedido: pedido);
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          height: 10,
                        );
                      },
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
