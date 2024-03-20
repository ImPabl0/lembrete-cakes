import 'package:flutter/material.dart';
import 'package:lembrete_cakes/Styles/color_pallet.dart';
import 'package:lembrete_cakes/Styles/text_styles.dart';
part 'components/add_pedido_header.dart';

class NovoPedido extends StatelessWidget {
  NovoPedido({
    super.key,
  });

  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        alignment: Alignment.centerLeft,
        child: _Header(
          pageController: pageController,
        ),
      ),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: PageView(
            controller: pageController,
            children: [
              const _FirstPageAddPedido(),
              Container(),
              Container(),
            ],
          ),
        ),
      ),
    ]);
  }
}

class _FirstPageAddPedido extends StatelessWidget {
  const _FirstPageAddPedido();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Insira os dados do cliente",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                        color: Color(0xFF514039)),
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: "Qual o nome do seu cliente?"),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration:
                      const InputDecoration(hintText: "Qual o endereço?"),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(hintText: "Telefone"),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(hintText: "Email"),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Pedido e entrega",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                        color: Color(0xFF514039)),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Data do pedido",
                          suffixIcon: Icon(Icons.calendar_month_outlined,
                              color: Theme.of(context).primaryColor),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Data de entrega",
                          suffixIcon: Icon(Icons.calendar_month_outlined,
                              color: Theme.of(context).primaryColor),
                        ),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Text(
                    "Informações sobre o produto",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                        color: Color(0xFF514039)),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Text(
                    "Qual o produto?",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 11,
                        color: Color(0xFF514039)),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
