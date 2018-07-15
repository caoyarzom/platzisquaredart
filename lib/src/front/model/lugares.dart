import 'package:json_annotation/json_annotation.dart';
part 'lugares.g.dart';

@JsonSerializable()
class Lugares extends Object with _$LugaresSerializerMixin{
  num lugaresId;
  String plan;
  num cercania;
  num distancia;
  num active;
  num lat;
  num lng;
  String nombreLugar;
  String descripcion;
  String calle;
  String ciudad;
  String pais;

  Lugares(
      {this.lugaresId,
      this.plan,
      this.cercania,
      this.distancia,
      this.active,
      this.nombreLugar,
      this.descripcion,
      this.calle,
      this.ciudad,
      this.pais});
  factory Lugares.fromJson(Map<String, dynamic> json) => _$LugaresFromJson(json);
}
