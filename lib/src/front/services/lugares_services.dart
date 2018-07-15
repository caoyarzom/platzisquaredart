import 'dart:async';
import 'dart:convert';
import 'dart:html';

import 'package:angular/angular.dart';
import 'package:firebase/firebase.dart';
import 'package:http/browser_client.dart';
import 'package:http/http.dart';
import 'package:platzisquaredart/src/front/model/lugares.dart';

@Injectable()
class LugaresServices {
  final Database db = database();
  final client = new BrowserClient();

  Future<List<Lugares>> getALL() async {
    List<Lugares> listGetAll = [];
    DatabaseReference ref = db.ref("lugares/");

    ref.onValue.listen((lugares) {
      DataSnapshot dataSnapshot = lugares.snapshot;

      var jsonString = jsonEncode(dataSnapshot.val());
      Map it = jsonDecode(jsonString);
/*      List key = it.keys.toList();*/
      listGetAll = it.values.map((data) => new Lugares.fromJson(data)).toList();

      print('listGetAll-Servicio ${listGetAll.first.toJson()}');
    });
    return listGetAll;
  }

  Future create(Lugares lugares) async {
    return db.app
        .database()
        .ref("lugares")
        .push(lugares.toJson());
  }

  Future obtenerGeoData(direccion) async {
    ///http://maps.google.com/maps/api/geocode/json?address=9-55+calle+72,+Bogota,Colombia

    Response httpGet = await client.get(
        'http://maps.google.com/maps/api/geocode/json?address=' + direccion).then((result){
          window.console.log(result.body);
          Map maps = jsonDecode(result.body);

         window.console.log(maps["results"]);
        });
    window.console.log(httpGet);

    return client.get(
        'http://maps.google.com/maps/api/geocode/json?address=' + direccion);
  }
}
