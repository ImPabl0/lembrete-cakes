// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lembrete_cakes/Features/index/components/custom_bottom_navigator.dart';
import 'package:lembrete_cakes/Features/pedido/pedido_page.dart';
import 'package:lembrete_cakes/Styles/color_pallet.dart';

import '../../bloc/pedidos/pedidos_bloc.dart';
import '../novo_pedido/novo_pedido_page.dart';

class Index extends StatelessWidget {
  const Index({super.key});
  final BorderSide defaultBorderSide =
      const BorderSide(width: 2, color: Color(0xFFE5E2E1));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          inputDecorationTheme: InputDecorationTheme(
              hintStyle: TextStyle(
                  fontSize: 13, fontWeight: FontWeight.w400, color: grey),
              enabledBorder: OutlineInputBorder(
                  borderSide: defaultBorderSide,
                  borderRadius: BorderRadius.circular(10)),
              border: OutlineInputBorder(
                borderSide: defaultBorderSide,
                borderRadius: BorderRadius.circular(10),
              )),
          colorScheme: const ColorScheme.light(
              background: Color(0xFFffffff),
              primary: Color(0xFFE4A8AB),
              error: Color(0xFFEF3A3A),
              secondary: Color(0xFF514039)),
          fontFamily: 'Poppins',
          primaryColor: const Color(0xFFE4A8AB)),
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
  List<MenuItem> menu = [
    const MenuItem(name: "Início", icon: Icons.home, page: PedidoPage()),
    MenuItem(name: "Novo", icon: Icons.add_circle_outline, page: NovoPedido()),
    MenuItem(name: "Agenda", icon: Icons.calendar_month, page: Container()),
  ];

  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocListener<PedidosBloc, PedidosState>(
        listener: (context, state) {
          if (state is PedidosErroState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.red,
              margin: const EdgeInsets.only(bottom: 80, left: 10, right: 10),
              content: Text(
                state.cause,
                style: const TextStyle(color: Colors.white),
              ),
              behavior: SnackBarBehavior.floating,
            ));
          }
        },
        child: Scaffold(
          body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return Container(
                margin: EdgeInsets.only(top: constraints.maxHeight * 0.05),
                child: Column(
                  children: [
                    Expanded(
                        child: PageView.builder(
                      itemCount: menu.length,
                      itemBuilder: (context, index) => menu[index].page,
                      controller: pageController,
                    )),
                    CustomBottomNavigator(
                      pageController: pageController,
                      itensMenu: menu,
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
