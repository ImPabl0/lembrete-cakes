import 'package:lembrete_cakes/Models/enum/tipo_caracteristica.dart';

class TipoCaracteristicaDTO {
  final int? id;
  final int? idCaracteristica;
  final TipoCaracteristica tipo;

  TipoCaracteristicaDTO(
      {required this.id, required this.idCaracteristica, required this.tipo});

  factory TipoCaracteristicaDTO.fromSQLite(
      {required Map<String, dynamic> map}) {
    TipoCaracteristica tipo = TipoCaracteristica.values.firstWhere(
        (element) => element.name == map['tipo'],
        orElse: () => TipoCaracteristica.string);

    return TipoCaracteristicaDTO(
        id: map['id'], idCaracteristica: map['id_caracteristica'], tipo: tipo);
  }
}
