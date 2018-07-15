import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';
import 'package:platzisquaredart/src/front/model/usuario.dart';
import 'package:platzisquaredart/src/front/routes.dart';

@Component(
  selector: 'contacto-component',
  styleUrls: ['contacto_component.css'],
  templateUrl: 'contacto_component.html',
  directives: [
    MaterialCheckboxComponent,
    MaterialFabComponent,
    MaterialIconComponent,
    materialInputDirectives,
    MaterialMultilineInputComponent,
    NgFor,
    NgIf,
    formDirectives,
    routerDirectives, materialDirectives
  ],
  providers: [const ClassProvider(Routes),materialProviders],
)
class ContactoComponent implements OnInit {
  final Routes routes;
  Usuario user = new Usuario();
  String mensaje;

  ContactoComponent(this.routes);

  @override
  void ngOnInit() {
    /*  print(routes.lugares.toUrl());*/
  }
}
