import 'package:angular_router/angular_router.dart';

final lugares = RoutePath(path: '/lugares');
final detalle = RoutePath(path: '/detalle/:id');
final contacto = RoutePath(path: '/contacto');
final crear = RoutePath(path: '/crear');
final login = RoutePath(path: '/login');
final registrar = RoutePath(path: '/registrar');
const idParam = 'id';
final hero = RoutePath(path: '${detalle.path}/:$idParam');

int getId(Map<String, String> parameters) {
  final id = parameters[idParam];
  return id == null ? null : int.tryParse(id);
}
