// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lembrete_cakes/Features/common/pedidos_controller/bloc/pedidos_bloc.dart';
import 'package:lembrete_cakes/Features/index/components/custom_bottom_navigator.dart';
import 'package:lembrete_cakes/Features/pedido/pedido_page.dart';
import 'package:lembrete_cakes/Features/search/search_page.dart';

import 'package:lembrete_cakes/Models/pedido.dart';

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
  List<MenuItem> menu = [
    MenuItem(name: "Início", icon: Icons.home),
    MenuItem(name: "Buscar", icon: Icons.search),
    MenuItem(name: "Novo", icon: Icons.add_circle_outline),
    MenuItem(name: "Agenda", icon: Icons.calendar_month),
    MenuItem(name: "Perfil", icon: Icons.person_outline),
  ];

  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Container(
              margin: EdgeInsets.only(top: constraints.maxHeight * 0.05),
              child: Column(
                children: [
                  Expanded(
                      child: PageView(
                    controller: pageController,
                    children: [PedidoPage(), SearchPage()],
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
    );
  }
}
