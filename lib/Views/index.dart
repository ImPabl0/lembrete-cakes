import 'package:flutter/material.dart';
import 'package:lembrete_cakes/Models/bolo.dart';
import 'package:lembrete_cakes/Models/cliente.dart';
import 'package:lembrete_cakes/Models/pedido.dart';
import 'package:lembrete_cakes/Presenters/index_presenter.dart';
import 'package:lembrete_cakes/Responsive/responsive.dart';
import 'package:lembrete_cakes/Views/Widgets/card_pedido.dart';

class Index extends StatelessWidget {
  const Index({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Poppins'),
      debugShowCheckedModeBanner: false,
      home: const IndexBody(),
    );
  }
}

class IndexBody extends StatefulWidget {
  const IndexBody({super.key});

  @override
  State<IndexBody> createState() => _IndexBodyState();
}

class _IndexBodyState extends State<IndexBody> {
  IndexPresenter indexPresenter = IndexPresenter(pedidos: [
    Pedido(
        cliente: Cliente(
            nome: "Pablo",
            endereco: "Ali",
            telefone: "tal",
            email: "@gmail.com"),
        produto: Bolo(caracteristica: "Grande"),
        dataDoPedido: DateTime.now(),
        dataDaEntrega: DateTime.now()),
    Pedido(
        cliente: Cliente(
            nome: "Pablo",
            endereco: "Ali",
            telefone: "tal",
            email: "@gmail.com"),
        produto: Bolo(caracteristica: "Grande"),
        dataDoPedido: DateTime.now(),
        dataDaEntrega: DateTime.now()),
    Pedido(
        cliente: Cliente(
            nome: "Pablo",
            endereco: "Ali",
            telefone: "tal",
            email: "@gmail.com"),
        produto: Bolo(caracteristica: "Grande"),
        dataDoPedido: DateTime.now(),
        dataDaEntrega: DateTime.now()),
    Pedido(
        cliente: Cliente(
            nome: "Pablo",
            endereco: "Ali",
            telefone: "tal",
            email: "@gmail.com"),
        produto: Bolo(caracteristica: "Grande"),
        dataDoPedido: DateTime.now(),
        dataDaEntrega: DateTime.now()),
    Pedido(
        cliente: Cliente(
            nome: "Pablo",
            endereco: "Ali",
            telefone: "tal",
            email: "@gmail.com"),
        produto: Bolo(caracteristica: "Grande"),
        dataDoPedido: DateTime.now(),
        dataDaEntrega: DateTime.now()),
    Pedido(
        cliente: Cliente(
            nome: "Pablo",
            endereco: "Ali",
            telefone: "tal",
            email: "@gmail.com"),
        produto: Bolo(caracteristica: "Grande"),
        dataDoPedido: DateTime.now(),
        dataDaEntrega: DateTime.now()),
    Pedido(
        cliente: Cliente(
            nome: "Pablo",
            endereco: "Ali",
            telefone: "tal",
            email: "@gmail.com"),
        produto: Bolo(caracteristica: "Grande"),
        dataDoPedido: DateTime.now(),
        dataDaEntrega: DateTime.now()),
    Pedido(
        cliente: Cliente(
            nome: "Pablo",
            endereco: "Ali",
            telefone: "tal",
            email: "@gmail.com"),
        produto: Bolo(caracteristica: "Grande"),
        dataDoPedido: DateTime.now(),
        dataDaEntrega: DateTime.now()),
  ]);

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context: context);
    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Container(
              margin: EdgeInsets.only(top: constraints.maxHeight * 0.05),
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: constraints.maxWidth * 0.05),
                      child: Column(
                        children: [
                          SizedBox(
                            width: constraints.maxWidth,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Seus pedidos',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: responsive.fractional * 2.5,
                                      color: const Color(0xFFE4A8AB)),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      top: constraints.maxHeight * 0.01),
                                  child: const Text(
                                    'Hoje',
                                    style: TextStyle(color: Color(0xFF543927)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              margin: EdgeInsets.only(
                                  top: constraints.maxHeight * 0.01),
                              child: ListView(
                                children: List.generate(
                                    indexPresenter.pedidos.length, (index) {
                                  Pedido pedido = indexPresenter.pedidos[index];
                                  return CardPedido(pedido: pedido);
                                }),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: constraints.maxWidth,
                    height: 70,
                    decoration: BoxDecoration(
                        color: const Color(0xFFE4A8AB),
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(19))),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
