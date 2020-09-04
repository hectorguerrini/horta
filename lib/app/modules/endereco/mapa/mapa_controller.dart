import 'package:flutter_modular/flutter_modular.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';

part 'mapa_controller.g.dart';

class MapaController = _MapaControllerBase with _$MapaController;

abstract class _MapaControllerBase with Store {
  GoogleMapController _googleMapController;

  @observable
  CameraPosition _initialCameraPosition;

  @observable
  LatLng _latLng;

  @observable
  Placemark _address;

  _MapaControllerBase() {
    _latLng = Modular.args.data['latLng'];
    _address = Modular.args.data['address'];
    _initialCameraPosition = CameraPosition(target: _latLng, zoom: 18);
  }
  @computed
  CameraPosition get getInitialCameraPosition => _initialCameraPosition;

  @computed
  String get getSelectedEndereco => (_address.thoroughfare +
      ' - ' +
      _address.subLocality +
      ', ' +
      _address.subAdministrativeArea +
      ', ' +
      _address.postalCode);

  @action
  onMapCreated(GoogleMapController controller) {
    _googleMapController = controller;
  }

  @action
  goCurrentLocation() {
    // _googleMapController.animateCamera(CameraUpdate.newLatLngZoom(
    //     LatLng(currentPosition.latitude, currentPosition.longitude),
    //     currentPosition.accuracy));
  }
  @action
  setNumber(String value) async {
    var address = (_address.thoroughfare +
        ', $value'
            ' - ' +
        _address.subLocality);
    Location locations = (await locationFromAddress(address))[0];
    _googleMapController.animateCamera(CameraUpdate.newLatLngZoom(
        LatLng(locations.latitude, locations.longitude), 18));
  }
}
