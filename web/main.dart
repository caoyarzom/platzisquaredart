import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:firebase/firebase.dart';
import 'package:platzisquaredart/app_component.template.dart' as ng;

import 'main.template.dart' as self;

const appBaseHref = const OpaqueToken<String>('appBaseHref');

@GenerateInjector([
  routerProviders,
  const ValueProvider.forToken(appBaseHref, '/'),
  const ClassProvider(LocationStrategy, useClass: HashLocationStrategy),

])
final InjectorFactory injector = self.injector$Injector;

void main() {
  // Initialize Firebase
  initializeApp(
      apiKey: "AIzaSyDTB689-mkKlOOZXF5D4AqpsLVLEHA4wVM",
      authDomain: "platzisquaredart.firebaseapp.com",
      databaseURL: "https://platzisquaredart.firebaseio.com",
      projectId: "platzisquaredart",
      storageBucket: "platzisquaredart.appspot.com",
      messagingSenderId: "60710632953");

  runApp(ng.AppComponentNgFactory, createInjector: injector);
}
