import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:lembrete_cakes/Datasource/sqlite.dart';
import 'package:lembrete_cakes/Features/index/index.dart';

import 'bloc/pedidos/pedidos_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SQLiteController.startDB();
  Intl.systemLocale = "pt_BR";
  initializeDateFormatting("pt_BR", null);
  runApp(BlocProvider(
    create: (context) => PedidosBloc(),
    child: const Index(),
  ));
}
