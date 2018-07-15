// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lugares.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Lugares _$LugaresFromJson(Map<String, dynamic> json) {
  return new Lugares(
      lugaresId: json['lugaresId'] as num,
      plan: json['plan'] as String,
      cercania: json['cercania'] as num,
      distancia: json['distancia'] as num,
      active: json['active'] as num,
      nombreLugar: json['nombreLugar'] as String,
      descripcion: json['descripcion'] as String,
      calle: json['calle'] as String,
      ciudad: json['ciudad'] as String,
      pais: json['pais'] as String)
    ..lat = json['lat'] as num
    ..lng = json['lng'] as num;
}

abstract class _$LugaresSerializerMixin {
  num get lugaresId;
  String get plan;
  num get cercania;
  num get distancia;
  num get active;
  num get lat;
  num get lng;
  String get nombreLugar;
  String get descripcion;
  String get calle;
  String get ciudad;
  String get pais;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'lugaresId': lugaresId,
        'plan': plan,
        'cercania': cercania,
        'distancia': distancia,
        'active': active,
        'lat': lat,
        'lng': lng,
        'nombreLugar': nombreLugar,
        'descripcion': descripcion,
        'calle': calle,
        'ciudad': ciudad,
        'pais': pais
      };
}
