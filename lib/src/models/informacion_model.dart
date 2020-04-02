
import 'dart:convert';

InformacionModel informacionModelFromJson(String str) => InformacionModel.fromJson(json.decode(str));

String informacionModelToJson(InformacionModel data) => json.encode(data.toJson());

class InformacionModel {
  int id;
  String nombres;
  String apellidos;
  DateTime fecha;
  int ci;

  InformacionModel({
    this.id,
    this.nombres,
    this.apellidos,
    this.fecha,
    this.ci,
  });

  factory InformacionModel.fromJson(Map<String, dynamic> json) => InformacionModel(
    id: json["id"],
    nombres: json["nombres"],
    apellidos: json["apellidos"],
    fecha: DateTime.parse(json["fecha"]),
    ci: json["ci"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nombres": nombres,
    "apellidos": apellidos,
    "fecha": fecha.toIso8601String(),
    "ci": ci,
  };
}
