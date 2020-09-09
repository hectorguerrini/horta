import 'package:flutter_modular/flutter_modular.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';

part 'mapa_controller.g.dart';

class MapaController = _MapaControllerBase with _$MapaController;

abstract class _MapaControllerBase with Store {
  GoogleMapController _googleMapController;

  final MarkerId _markerId = MarkerId('1');

  @observable
  CameraPosition _initialCameraPosition;

  @observable
  LatLng _latLng;

  @observable
  Placemark _address;

  @observable
  ObservableMap<MarkerId, Marker> _markers =
      <MarkerId, Marker>{}.asObservable();

  @observable
  bool _loadingAddress = false;

  _MapaControllerBase() {
    _latLng = Modular.args.data['latLng'];
    _address = Modular.args.data['address'];
    _initialCameraPosition = CameraPosition(target: _latLng, zoom: 18);
  }
  @computed
  CameraPosition get getInitialCameraPosition => _initialCameraPosition;

  @computed
  Set<Marker> get getMarker => _markers.values.toSet();

  @computed
  bool get getLoading => _loadingAddress;

  /*@computed
  String get getSelectedEndereco => (_address.thoroughfare +
      ' - ' +
      _address.subLocality +
      ', ' +
      _address.subAdministrativeArea);
*/
  @computed
  String get getSelectedEndereco => _address.thoroughfare;
  @computed
  String get getSelectedLocal => _address.subLocality +
      ', ' +
      _address.subAdministrativeArea;
  @action
  onMapCreated(GoogleMapController controller) {
    _googleMapController = controller;
    _googleMapController
        .animateCamera(CameraUpdate.newCameraPosition(_initialCameraPosition));
    Marker _marker = Marker(
        markerId: _markerId,
        position: _latLng,
        flat: true,
        visible: true,
        icon: BitmapDescriptor.defaultMarker);
    _markers[_markerId] = _marker;
  }

  @action
  onCameraMove(CameraPosition cameraPosition) {
    _markers[_markerId] =
        _markers[_markerId].copyWith(positionParam: cameraPosition.target);
  }

  @action
  onCameraIdle() async {
    _loadingAddress = true;
    _latLng = _markers[_markerId].position;
    try {
      _address = (await placemarkFromCoordinates(
          _latLng.latitude, _latLng.longitude))[0];
      _loadingAddress = false;
    } catch (e) {
      print(e);
    }
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
