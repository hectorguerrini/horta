import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:horta/app/modules/endereco/model/endereco_model.dart';
import 'package:horta/app/modules/endereco/repositories/endereco_repository.dart';
import 'package:horta/app/shared/components/toast_widget.dart';
import 'package:mobx/mobx.dart';
import 'package:oktoast/oktoast.dart';

part 'mapa_controller.g.dart';

class MapaController = _MapaControllerBase with _$MapaController;

abstract class _MapaControllerBase with Store {
  final EnderecoRepository _repository = Modular.get();
  final TextEditingController numeroCtrl = new TextEditingController();
  final TextEditingController complementoCtrl = new TextEditingController();
  GoogleMapController _googleMapController;

  final MarkerId _markerId = MarkerId('1');

  @observable
  CameraPosition _initialCameraPosition;

  @observable
  ObservableMap<MarkerId, Marker> _markers =
      <MarkerId, Marker>{}.asObservable();

  @observable
  bool _loadingAddress = false;

  @observable
  bool showContainer = false;

  @observable
  bool showColumn = false;

  @observable
  String numero = '';

  @observable
  EnderecoModel enderecoModel;

  _MapaControllerBase() {
    enderecoModel = Modular.args.data['endereco'];
    _initialCameraPosition =
        CameraPosition(target: enderecoModel.getLatLng, zoom: 18);
    setNumberCtrl(enderecoModel.numero);
    setComplementoCtrl(enderecoModel.complemento);
  }

  @computed
  CameraPosition get getInitialCameraPosition => _initialCameraPosition;

  @computed
  Set<Marker> get getMarker => _markers.values.toSet();

  @computed
  bool get getLoading => _loadingAddress;

  @computed
  String get getSelectedEndereco =>
      enderecoModel.logradouro + ' ' + enderecoModel.numero;
  @computed
  String get getSelectedLocal =>
      enderecoModel.bairro + ', ' + enderecoModel.cidade;

  @computed
  bool get isValid => numeroCtrl.text != '';

  @action
  setNumberCtrl(String value) => numeroCtrl.text = value;

  @action
  setComplementoCtrl(String value) => complementoCtrl.text = value;

  @action
  onMapCreated(GoogleMapController controller) {
    _googleMapController = controller;
    _googleMapController
        .animateCamera(CameraUpdate.newCameraPosition(_initialCameraPosition));
    Marker _marker = Marker(
        markerId: _markerId,
        position: enderecoModel.getLatLng,
        flat: true,
        visible: true,
        icon:
            BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange));
    _markers[_markerId] = _marker;
  }

  @action
  onCameraMove(CameraPosition cameraPosition) async {
    _markers.clear();

    Marker _marker = Marker(
        markerId: _markerId,
        position: cameraPosition.target,
        flat: false,
        visible: true,
        icon:
            BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange));
    _markers[_markerId] = _marker;
  }

  @action
  onCameraIdle() async {
    _loadingAddress = true;
    var _latLng = _markers[_markerId].position;
    try {
      var _address = (await placemarkFromCoordinates(
          _latLng.latitude, _latLng.longitude))[0];
      enderecoModel = enderecoModel.fromPlacemarkandGeoPoint(_address, _latLng);
      _loadingAddress = false;
    } catch (e) {
      print(e);
    }
  }

  @action
  searchNumber() async {
    var address = (enderecoModel.logradouro +
        ', $numeroCtrl.text'
            ' - ' +
        enderecoModel.bairro);

    Location locations = (await locationFromAddress(address))[0];
    var _address = (await placemarkFromCoordinates(
        locations.latitude, locations.longitude))[0];
    var _latLng = LatLng(locations.latitude, locations.longitude);
    enderecoModel = enderecoModel.fromPlacemarkandGeoPoint(_address, _latLng);
    _googleMapController.animateCamera(CameraUpdate.newLatLngZoom(_latLng, 18));
  }

  @action
  openConfirmAddress() {
    showContainer = true;
    Future.delayed(Duration(milliseconds: 800))
        .then((value) => showColumn = true);
  }

  @action
  closeAddress() {
    showContainer = false;
    showColumn = false;
  }

  @action
  salvarEndereco() async {
    try {
      enderecoModel = enderecoModel.copyWith(complemento: complementoCtrl.text);
      await _repository.updateEnderecoHorta(enderecoModel);
      showToastWidget(
          ToastWidget(
            msg: 'Salvo',
          ),
          duration: Duration(seconds: 2));
      Modular.to.pop();
    } catch (e) {
      print(e);
    }
  }
}
