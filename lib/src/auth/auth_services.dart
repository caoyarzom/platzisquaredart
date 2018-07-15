import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:firebase/firebase.dart' as fbase;
import 'package:firebase/src/auth.dart';

@Injectable()
class AuthServices {
  Auth auth = fbase.auth();
  final Router router;

  AuthServices(this.router);

  void loginFireBAse(String email, String pwd) {
    this.auth.signInWithEmailAndPassword(email, pwd).then((response) async {
      print('Logeado ${response.toJson()}');
      await router.navigate("/lugares");
    }).catchError((e) {
      print('error =>${e}');
    });
  }

  void registerFireBase(String email, String pwd) {
    this.auth.createUserWithEmailAndPassword(email, pwd).then((response) async {
      print("Usuario resgistado ${response.toJson()}");
      await router.navigate("/login");
    }).catchError((e) => print('Error => ${e}'));
  }

  Future logout() async {
    auth.signOut().then((response) => print('Logout => ${response}'));
    await router.navigate('/login');
  }

  Stream<fbase.User> isLogged() => this.auth.onAuthStateChanged;
}
