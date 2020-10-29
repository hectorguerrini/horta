import 'dart:async';

import 'package:flutter/services.dart';
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
  bool _searching = false;

  @observable
  EnderecoModel currentPosition;

  @observable
  ObservableStream<List<EnderecoModel>> listEnderecos;

  _EnderecoControllerBase() {
    getCurrentLocation();
    if (listEnderecos == null) {
      getEnderecos();
    }
  }

  @action
  getEnderecos() {
    listEnderecos = _repository.getEnderecoHorta().asObservable();
  }

  @action
  searchEndereco(String value) async {
    try {
      _searching = true;
      var locationEndereco = (await locationFromAddress(value))[0];
      var selectedEndereco = (await placemarkFromCoordinates(
          locationEndereco.latitude, locationEndereco.longitude))[0];
      currentPosition = currentPosition.fromPlacemarkandGeoPoint(
          selectedEndereco,
          LatLng(locationEndereco.latitude, locationEndereco.longitude));
      editAddress(currentPosition);
      _searching = false;
    } on PlatformException catch (e) {
      _searching = false;
      print(e);
      switch (e.code) {
        case 'NOT_FOUND':
          break;
        default:
      }
    }
  }

  @action
  editAddress(EnderecoModel enderecoModel) {
    Modular.to.pushNamed('/perfil/endereco/mapa',
        arguments: {'endereco': enderecoModel});
  }

  @action
  getCurrentLocation() async {
    try {
      var _position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      var _address = (await placemarkFromCoordinates(
          _position.latitude, _position.longitude))[0];

      currentPosition = currentPosition.fromPlacemarkandGeoPoint(
          _address, LatLng(_position.latitude, _position.longitude));
    } catch (e) {
      print(e);
    }
  }

  @computed
  String get getUserLocation => currentPosition != null
      ? (currentPosition.logradouro +
          (currentPosition.numero != null
              ? ', ' + currentPosition.numero
              : '') +
          ' - ' +
          currentPosition.bairro +
          ', ' +
          currentPosition.cidade +
          ', ' +
          currentPosition.cep)
      : '';

  @computed
  bool get isSearching => _searching;
}
