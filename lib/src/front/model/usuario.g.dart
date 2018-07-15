// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usuario.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Usuario _$UsuarioFromJson(Map<String, dynamic> json) {
  return new Usuario(
      userId: json['userId'] as num,
      mailUser: json['mailUser'] as String,
      pwd: json['pwd'] as String)
    ..nombre = json['nombre'] as String;
}

abstract class _$UsuarioSerializerMixin {
  num get userId;
  String get mailUser;
  String get pwd;
  String get nombre;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'userId': userId,
        'mailUser': mailUser,
        'pwd': pwd,
        'nombre': nombre
      };
}
