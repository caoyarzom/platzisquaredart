import 'dart:html';

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';
import 'package:google_maps/google_maps.dart';
import 'package:platzisquaredart/src/front/model/lugares.dart';
import 'package:platzisquaredart/src/front/routes.dart';
import 'package:platzisquaredart/src/front/services/lugares_services.dart';

@Component(
    selector: 'crear-component',
    styleUrls: ['crear_component.css'],
    templateUrl: 'crear_component.html',
    directives: [
      MaterialCheckboxComponent,
      MaterialFabComponent,
      MaterialIconComponent,
      materialInputDirectives,
      NgFor,
      NgIf,
      formDirectives,
      routerDirectives
    ],
    pipes: [commonPipes],
    providers: [ClassProvider(Routes), ClassProvider(LugaresServices)])
class CrearComponent implements OnInit {
  final Routes routes;
  final Router router;
  final LugaresServices lugaresServices;
  Geocoder geocoder = new Geocoder();

  CrearComponent(this.routes, this.lugaresServices, this.router);

  dynamic lugar = new Lugares();

  guardarLugar() {
    /*  window.console.log(lugar);*/

    final String direccion = this.lugar.calle + ',' + this.lugar.ciudad + ',' +
        this.lugar.pais;
    final request = new GeocoderRequest()
      ..address = direccion;
    geocoder.geocode(request, (results, status) {
      if (status == GeocoderStatus.OK) {
        lugar.lat = results[0].geometry.location.lat;
        lugar.lng = results[0].geometry.location.lng;

        lugar.lugaresId = new DateTime.now().millisecondsSinceEpoch;
        lugaresServices
            .create(lugar)
            .then((l) => router.navigate(routes.lugares.toUrl()))
            .catchError((e) => window.console.log(e));
      } else {
        window.console.log(
            'Geocode was not successful for the following reason: $status');
      }
    });


  }

  @override
  void ngOnInit() {}
}
