import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import '../component/private/lugares_component/lugares_component.template.dart' as lc;
import '../component/private/contacto_component/contacto_component.template.dart' as contactoc;
import '../component/private/crear_component/crear_component.template.dart' as crearc;
import '../component/public/login/login_component.template.dart' as loginc;
import '../component/public/registrar/registrar_component.template.dart' as registerc;
import 'route_paths.dart' as paths;

@Injectable()
class Routes{
  RoutePath get lugares => paths.lugares;
  RoutePath get contacto => paths.contacto;
  RoutePath get detalles => paths.detalle;
  RoutePath get crear => paths.crear;
  RoutePath get login => paths.login;
  RoutePath get registrar => paths.registrar;

  final List<RouteDefinition> all = [
    RouteDefinition.redirect(path: '', redirectTo: paths.login.toUrl()),
    RouteDefinition(
      path: paths.lugares.path,
      component: lc.LugaresComponentNgFactory,
    ),
    RouteDefinition(
      path: paths.login.path,
      component: loginc.LoginComponentNgFactory,
    ),
    RouteDefinition(
      path: paths.registrar.path,
      component: registerc.RegistrarComponentNgFactory,
    ),
    RouteDefinition(
      path: paths.contacto.path,
      component: contactoc.ContactoComponentNgFactory,
    ),
    RouteDefinition(
      path: paths.crear.path,
      component: crearc.CrearComponentNgFactory,
    )
  ];

}