import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:platzisquaredart/src/auth/auth_services.dart';
import 'package:platzisquaredart/src/front/routes.dart';

// AngularDart info: https://webdev.dartlang.org/angular
// Components info: https://webdev.dartlang.org/components

@Component(
    selector: 'my-app',
    styleUrls: ['app_component.css'],
    templateUrl: 'app_component.html',
    directives: [routerDirectives, NgIf],
    providers: [ClassProvider(Routes),ClassProvider(AuthServices)])
class AppComponent implements OnActivate, OnInit, OnDeactivate, CanActivate {
  final Routes routes;
  bool loggedIn = false;
  final AuthServices authServices;

  AppComponent(this.routes, this.authServices){
    print('AppComponent.AppComponent  creado');
  }

   logout() {
     return authServices.logout();
   }


  @override
  void ngOnInit() {
    authServices.isLogged()
        .listen((user) => user != null ? loggedIn = true : loggedIn = false)
        .onError((e) {
      print('Error ${e}');
      loggedIn = false;
    });
    print('  authServices.isLogged() init; ${ authServices.isLogged().listen((
        user) =>
        print(user)) }');
    print('  loggedIn; ${ loggedIn }');

  }

  @override
  void onActivate(_, RouterState current) {
    // TODO: implement onActivate
    authServices.isLogged().listen((user)=> print('User ${user}'));
    print('  authServices.isLogged() OnActivate; ${ authServices.isLogged() }');
  }

  @override
  void onDeactivate(RouterState current, _) {
    print('AppComponent.AppComponent: onDeactivate: ${current?.toUrl()} -> ${_?.toUrl()}');
  }
  @override
  Future<bool> canNavigate() async {
    print('AppComponent.AppComponent: canNavigate');

  }

  @override
  Future<bool> canActivate(RouterState current, RouterState next) {
    print('AppComponent.canActivate');
  }

}
