import 'package:intl/intl.dart';

extension DateExtension on DateTime {
  String get horaFormatada {
    String string = toString();
    return string.split(" ").last.substring(0, 5);
  }

  String get dataFormatada {
    return DateFormat("dd/MM/yyyy").format(this);
  }

  String get dataDetalhada {
    return DateFormat("dd MMM yyyy")
        .format(this)
        .replaceAll(".", "")
        .toUpperCase();
  }
}

extension CurrencyFormat on double {
  String get toBRL {
    return NumberFormat.currency(locale: "pt_BR", symbol: "R\$").format(this);
  }
}
