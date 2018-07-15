import 'package:json_annotation/json_annotation.dart';

part 'usuario.g.dart';
@JsonSerializable()
class Usuario  extends Object with _$UsuarioSerializerMixin{
  num userId;
  String mailUser;
  String pwd;
  String nombre;

  Usuario({this.userId, this.mailUser, this.pwd});

  factory Usuario.fromJson(Map<String, dynamic> json) => _$UsuarioFromJson(json);


}
