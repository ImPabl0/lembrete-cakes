import 'package:flutter/material.dart';
import 'package:lembrete_cakes/Styles/input_decorations.dart';
import 'package:lembrete_cakes/Styles/text_styles.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Container(
              width: double.infinity,
              alignment: Alignment.centerLeft,
              child: const Text(
                "Buscar pedidos",
                style: CustomTextStyles.pinkBigTitle,
              )),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 10),
            child: TextFormField(
              decoration: CustomInputDecorations.defaultDecoration.copyWith(
                  hintText: "Pesquise por nome",
                  suffixIcon: const Icon(Icons.search)),
            ),
          ),
          Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 15),
              child: const Text(
                "Resultados",
                style: TextStyle(fontSize: 20, color: Color(0xFF543927)),
              ))
        ],
      ),
    );
  }
}
