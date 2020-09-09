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
  Computed<Set<Marker>> _$getMarkerComputed;

  @override
  Set<Marker> get getMarker =>
      (_$getMarkerComputed ??= Computed<Set<Marker>>(() => super.getMarker,
              name: '_MapaControllerBase.getMarker'))
          .value;
  Computed<bool> _$getLoadingComputed;

  @override
  bool get getLoading =>
      (_$getLoadingComputed ??= Computed<bool>(() => super.getLoading,
              name: '_MapaControllerBase.getLoading'))
          .value;
  Computed<String> _$getSelectedEnderecoComputed;

  @override
  String get getSelectedEndereco => (_$getSelectedEnderecoComputed ??=
          Computed<String>(() => super.getSelectedEndereco,
              name: '_MapaControllerBase.getSelectedEndereco'))
      .value;
  Computed<String> _$getSelectedLocalComputed;

  @override
  String get getSelectedLocal => (_$getSelectedLocalComputed ??=
          Computed<String>(() => super.getSelectedLocal,
              name: '_MapaControllerBase.getSelectedLocal'))
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

  final _$_markersAtom = Atom(name: '_MapaControllerBase._markers');

  @override
  ObservableMap<MarkerId, Marker> get _markers {
    _$_markersAtom.reportRead();
    return super._markers;
  }

  @override
  set _markers(ObservableMap<MarkerId, Marker> value) {
    _$_markersAtom.reportWrite(value, super._markers, () {
      super._markers = value;
    });
  }

  final _$_loadingAddressAtom =
      Atom(name: '_MapaControllerBase._loadingAddress');

  @override
  bool get _loadingAddress {
    _$_loadingAddressAtom.reportRead();
    return super._loadingAddress;
  }

  @override
  set _loadingAddress(bool value) {
    _$_loadingAddressAtom.reportWrite(value, super._loadingAddress, () {
      super._loadingAddress = value;
    });
  }

  final _$onCameraIdleAsyncAction =
      AsyncAction('_MapaControllerBase.onCameraIdle');

  @override
  Future onCameraIdle() {
    return _$onCameraIdleAsyncAction.run(() => super.onCameraIdle());
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
  dynamic onCameraMove(CameraPosition cameraPosition) {
    final _$actionInfo = _$_MapaControllerBaseActionController.startAction(
        name: '_MapaControllerBase.onCameraMove');
    try {
      return super.onCameraMove(cameraPosition);
    } finally {
      _$_MapaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
getInitialCameraPosition: ${getInitialCameraPosition},
getMarker: ${getMarker},
getLoading: ${getLoading},
getSelectedEndereco: ${getSelectedEndereco},
getSelectedLocal: ${getSelectedLocal}
    ''';
  }
}
