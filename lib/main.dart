import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lembrete_cakes/Datasource/sqlite.dart';
import 'package:lembrete_cakes/Features/common/pedidos_controller/bloc/pedidos_bloc.dart';
import 'package:lembrete_cakes/Features/index/index.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SQLiteController.startDB();
  runApp(BlocProvider(
    create: (context) => PedidosBloc(),
    child: const Index(),
  ));
}
