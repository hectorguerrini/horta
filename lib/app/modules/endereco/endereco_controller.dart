import 'dart:async';
import 'dart:math';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:horta/app/modules/endereco/model/endereco_model.dart';
import 'package:mobx/mobx.dart';

import 'repositories/endereco_repository.dart';

part 'endereco_controller.g.dart';

class EnderecoController = _EnderecoControllerBase with _$EnderecoController;

abstract class _EnderecoControllerBase with Store {
  final EnderecoRepository _repository = Modular.get();

  @observable
  Placemark selectedEndereco;
  @observable
  Location locationEndereco;

  @observable
  Position currentPosition;

  @observable
  Placemark currentAddress;

  @observable
  bool _searching = false;

  @observable
  String name;

  _EnderecoControllerBase() {
    getCurrentLocation();
    getEnderecos();
  }

  @observable
  var hortasAparecer = [];

  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 4));
    //print("2");
    return "Paulo Kogos";
  }

  @observable
  ObservableFuture<String> asyncCallToRepository;

  @action
  getEnderecos() {
    _repository.getEnderecoHorta();
  }

  @action
  searchEndereco(String value) async {
    try {
      _searching = true;
      locationEndereco = (await locationFromAddress(value))[0];
      selectedEndereco = (await placemarkFromCoordinates(
          locationEndereco.latitude, locationEndereco.longitude))[0];
      _searching = false;
    } catch (e) {
      //print(e);
    }
  }

  @action
  editAddress() {
    Modular.to.pushNamed('/perfil/endereco/mapa', arguments: {
      'latLng': LatLng(locationEndereco.latitude, locationEndereco.longitude),
      'address': selectedEndereco
    });
  }

  @action
  getCurrentLocation() async {
    try {
      currentPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      currentAddress = (await placemarkFromCoordinates(
          currentPosition.latitude, currentPosition.longitude))[0];
    } catch (e) {
      //print(e);
    }
  }

  @action
  setCurrentAddress() {
    selectedEndereco = currentAddress;
    locationEndereco = Location(
        latitude: currentPosition.latitude,
        longitude: currentPosition.longitude,
        timestamp: currentPosition.timestamp);
    editAddress();
  }

  @computed
  String get getUserLocation => currentAddress != null
      ? (currentAddress.thoroughfare +
          (currentAddress.name != null ? ', ' + currentAddress.name : '') +
          ' - ' +
          currentAddress.subLocality +
          ', ' +
          currentAddress.subAdministrativeArea +
          ', ' +
          currentAddress.postalCode)
      : '';
  @computed
  String get getSelectedEndereco => selectedEndereco != null
      ? (selectedEndereco.thoroughfare +
          ' - ' +
          selectedEndereco.subLocality +
          ', ' +
          selectedEndereco.subAdministrativeArea +
          ', ' +
          selectedEndereco.postalCode)
      : '';
  @computed
  bool get isSearching => _searching;
}
