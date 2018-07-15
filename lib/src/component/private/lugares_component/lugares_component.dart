import 'dart:async';
import 'dart:html';

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';
import 'package:google_maps/google_maps.dart';
import 'package:google_maps/google_maps.dart' as gmap;
import 'package:platzisquaredart/src/front/model/lugares.dart';
import 'package:platzisquaredart/src/front/routes.dart';
import 'package:platzisquaredart/src/front/services/lugares_services.dart';

@Component(
  selector: 'lugares-component',
  styleUrls: ['lugares_component.css'],
  templateUrl: 'lugares_component.html',
  directives: [materialDirectives, NgFor, NgIf, formDirectives, routerDirectives],
  pipes: [commonPipes],
  providers: [const ClassProvider(LugaresServices), const ClassProvider(Routes)],
)
class LugaresComponent implements OnInit, OnActivate {
  final LugaresServices _lugaresServices;
  final Routes routes;

  LugaresComponent(this._lugaresServices, this.routes);

  Lugares lugares = new Lugares();
  List<Lugares> lugaresList = [];
  @ViewChild("mapCanvas")
  DivElement mapCanvas;

  final stgo = new LatLng(-33.4533624, -70.714213);
  final List<Marker> markers = [];
  GMap luagresmap;

  initGmap() {
    final mapOptions = new MapOptions()
      ..zoom = 12
      ..center = stgo;

   luagresmap = new GMap(mapCanvas, mapOptions);

  }


  loadAll(){
    onFinish(response){
      this.lugaresList = response[0];
      print(lugaresList);

      lugaresList.forEach((position){
        markers.add(new Marker(new MarkerOptions()
          ..position = new LatLng(position.lat, position.lng)
          ..map = luagresmap
          ..animation = gmap.Animation.DROP));
      });

    }

    Future.wait([_lugaresServices.getALL()])
        .then((List response)=> onFinish(response));

  }

  @override
  ngOnInit() async {
    loadAll();
    initGmap();
  }

  @override
  void onActivate(_, RouterState current) {
 /*   print('Current ${current.path}');
    print('toUrl ${current.toUrl()}');
    loadAll();*/
  }

}
