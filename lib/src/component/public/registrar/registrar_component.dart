import 'dart:async';

import 'package:angular/angular.dart';


import 'package:angular_components/angular_components.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:platzisquaredart/src/auth/auth_services.dart';
import 'package:platzisquaredart/src/front/model/usuario.dart';


@Component(
  selector: 'registrar',
  styleUrls: ['registrar_component.css'],
  templateUrl: 'registrar_component.html',
  directives: [
    MaterialCheckboxComponent,
    MaterialFabComponent,
    MaterialIconComponent,
    materialInputDirectives,
    NgFor,
    NgIf,formDirectives

  ],
  providers: [const ClassProvider(AuthServices)],
)
class RegistrarComponent implements OnInit {
  Usuario user = new Usuario();
  final AuthServices authServices;


RegistrarComponent(this.authServices);

  void registrar(){
    authServices.registerFireBase(user.mailUser, user.pwd);
  }
  @override
  void ngOnInit() {
    // TODO: implement ngOnInit
  }

}
