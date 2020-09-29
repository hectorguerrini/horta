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
  Computed<bool> _$isValidComputed;

  @override
  bool get isValid => (_$isValidComputed ??= Computed<bool>(() => super.isValid,
          name: '_MapaControllerBase.isValid'))
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

  final _$showContainerAtom = Atom(name: '_MapaControllerBase.showContainer');

  @override
  bool get showContainer {
    _$showContainerAtom.reportRead();
    return super.showContainer;
  }

  @override
  set showContainer(bool value) {
    _$showContainerAtom.reportWrite(value, super.showContainer, () {
      super.showContainer = value;
    });
  }

  final _$showColumnAtom = Atom(name: '_MapaControllerBase.showColumn');

  @override
  bool get showColumn {
    _$showColumnAtom.reportRead();
    return super.showColumn;
  }

  @override
  set showColumn(bool value) {
    _$showColumnAtom.reportWrite(value, super.showColumn, () {
      super.showColumn = value;
    });
  }

  final _$numeroAtom = Atom(name: '_MapaControllerBase.numero');

  @override
  String get numero {
    _$numeroAtom.reportRead();
    return super.numero;
  }

  @override
  set numero(String value) {
    _$numeroAtom.reportWrite(value, super.numero, () {
      super.numero = value;
    });
  }

  final _$onCameraMoveAsyncAction =
      AsyncAction('_MapaControllerBase.onCameraMove');

  @override
  Future onCameraMove(CameraPosition cameraPosition) {
    return _$onCameraMoveAsyncAction
        .run(() => super.onCameraMove(cameraPosition));
  }

  final _$onCameraIdleAsyncAction =
      AsyncAction('_MapaControllerBase.onCameraIdle');

  @override
  Future onCameraIdle() {
    return _$onCameraIdleAsyncAction.run(() => super.onCameraIdle());
  }

  final _$searchNumberAsyncAction =
      AsyncAction('_MapaControllerBase.searchNumber');

  @override
  Future searchNumber() {
    return _$searchNumberAsyncAction.run(() => super.searchNumber());
  }

  final _$salvarEnderecoAsyncAction =
      AsyncAction('_MapaControllerBase.salvarEndereco');

  @override
  Future salvarEndereco() {
    return _$salvarEnderecoAsyncAction.run(() => super.salvarEndereco());
  }

  final _$_MapaControllerBaseActionController =
      ActionController(name: '_MapaControllerBase');

  @override
  dynamic setNumberCtrl(String value) {
    final _$actionInfo = _$_MapaControllerBaseActionController.startAction(
        name: '_MapaControllerBase.setNumberCtrl');
    try {
      return super.setNumberCtrl(value);
    } finally {
      _$_MapaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

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
  dynamic openConfirmAddress() {
    final _$actionInfo = _$_MapaControllerBaseActionController.startAction(
        name: '_MapaControllerBase.openConfirmAddress');
    try {
      return super.openConfirmAddress();
    } finally {
      _$_MapaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic closeAddress() {
    final _$actionInfo = _$_MapaControllerBaseActionController.startAction(
        name: '_MapaControllerBase.closeAddress');
    try {
      return super.closeAddress();
    } finally {
      _$_MapaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
showContainer: ${showContainer},
showColumn: ${showColumn},
numero: ${numero},
getInitialCameraPosition: ${getInitialCameraPosition},
getMarker: ${getMarker},
getLoading: ${getLoading},
getSelectedEndereco: ${getSelectedEndereco},
getSelectedLocal: ${getSelectedLocal},
isValid: ${isValid}
    ''';
  }
}
