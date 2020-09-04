// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mapa_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MapaController on _MapaControllerBase, Store {
  Computed<CameraPosition> _$getInitialCameraPositionComputed;

  @override
  CameraPosition get getInitialCameraPosition =>
      (_$getInitialCameraPositionComputed ??= Computed<CameraPosition>(
              () => super.getInitialCameraPosition,
              name: '_MapaControllerBase.getInitialCameraPosition'))
          .value;
  Computed<String> _$getSelectedEnderecoComputed;

  @override
  String get getSelectedEndereco => (_$getSelectedEnderecoComputed ??=
          Computed<String>(() => super.getSelectedEndereco,
              name: '_MapaControllerBase.getSelectedEndereco'))
      .value;

  final _$_initialCameraPositionAtom =
      Atom(name: '_MapaControllerBase._initialCameraPosition');

  @override
  CameraPosition get _initialCameraPosition {
    _$_initialCameraPositionAtom.reportRead();
    return super._initialCameraPosition;
  }

  @override
  set _initialCameraPosition(CameraPosition value) {
    _$_initialCameraPositionAtom
        .reportWrite(value, super._initialCameraPosition, () {
      super._initialCameraPosition = value;
    });
  }

  final _$_latLngAtom = Atom(name: '_MapaControllerBase._latLng');

  @override
  LatLng get _latLng {
    _$_latLngAtom.reportRead();
    return super._latLng;
  }

  @override
  set _latLng(LatLng value) {
    _$_latLngAtom.reportWrite(value, super._latLng, () {
      super._latLng = value;
    });
  }

  final _$_addressAtom = Atom(name: '_MapaControllerBase._address');

  @override
  Placemark get _address {
    _$_addressAtom.reportRead();
    return super._address;
  }

  @override
  set _address(Placemark value) {
    _$_addressAtom.reportWrite(value, super._address, () {
      super._address = value;
    });
  }

  final _$setNumberAsyncAction = AsyncAction('_MapaControllerBase.setNumber');

  @override
  Future setNumber(String value) {
    return _$setNumberAsyncAction.run(() => super.setNumber(value));
  }

  final _$_MapaControllerBaseActionController =
      ActionController(name: '_MapaControllerBase');

  @override
  dynamic onMapCreated(GoogleMapController controller) {
    final _$actionInfo = _$_MapaControllerBaseActionController.startAction(
        name: '_MapaControllerBase.onMapCreated');
    try {
      return super.onMapCreated(controller);
    } finally {
      _$_MapaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic goCurrentLocation() {
    final _$actionInfo = _$_MapaControllerBaseActionController.startAction(
        name: '_MapaControllerBase.goCurrentLocation');
    try {
      return super.goCurrentLocation();
    } finally {
      _$_MapaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
getInitialCameraPosition: ${getInitialCameraPosition},
getSelectedEndereco: ${getSelectedEndereco}
    ''';
  }
}
