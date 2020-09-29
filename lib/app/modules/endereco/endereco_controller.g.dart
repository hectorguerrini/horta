// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'endereco_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EnderecoController on _EnderecoControllerBase, Store {
  Computed<String> _$getUserLocationComputed;

  @override
  String get getUserLocation => (_$getUserLocationComputed ??= Computed<String>(
          () => super.getUserLocation,
          name: '_EnderecoControllerBase.getUserLocation'))
      .value;
  Computed<String> _$getSelectedEnderecoComputed;

  @override
  String get getSelectedEndereco => (_$getSelectedEnderecoComputed ??=
          Computed<String>(() => super.getSelectedEndereco,
              name: '_EnderecoControllerBase.getSelectedEndereco'))
      .value;
  Computed<bool> _$isSearchingComputed;

  @override
  bool get isSearching =>
      (_$isSearchingComputed ??= Computed<bool>(() => super.isSearching,
              name: '_EnderecoControllerBase.isSearching'))
          .value;

  final _$selectedEnderecoAtom =
      Atom(name: '_EnderecoControllerBase.selectedEndereco');

  @override
  Placemark get selectedEndereco {
    _$selectedEnderecoAtom.reportRead();
    return super.selectedEndereco;
  }

  @override
  set selectedEndereco(Placemark value) {
    _$selectedEnderecoAtom.reportWrite(value, super.selectedEndereco, () {
      super.selectedEndereco = value;
    });
  }

  final _$locationEnderecoAtom =
      Atom(name: '_EnderecoControllerBase.locationEndereco');

  @override
  Location get locationEndereco {
    _$locationEnderecoAtom.reportRead();
    return super.locationEndereco;
  }

  @override
  set locationEndereco(Location value) {
    _$locationEnderecoAtom.reportWrite(value, super.locationEndereco, () {
      super.locationEndereco = value;
    });
  }

  final _$currentPositionAtom =
      Atom(name: '_EnderecoControllerBase.currentPosition');

  @override
  Position get currentPosition {
    _$currentPositionAtom.reportRead();
    return super.currentPosition;
  }

  @override
  set currentPosition(Position value) {
    _$currentPositionAtom.reportWrite(value, super.currentPosition, () {
      super.currentPosition = value;
    });
  }

  final _$currentAddressAtom =
      Atom(name: '_EnderecoControllerBase.currentAddress');

  @override
  Placemark get currentAddress {
    _$currentAddressAtom.reportRead();
    return super.currentAddress;
  }

  @override
  set currentAddress(Placemark value) {
    _$currentAddressAtom.reportWrite(value, super.currentAddress, () {
      super.currentAddress = value;
    });
  }

  final _$_searchingAtom = Atom(name: '_EnderecoControllerBase._searching');

  @override
  bool get _searching {
    _$_searchingAtom.reportRead();
    return super._searching;
  }

  @override
  set _searching(bool value) {
    _$_searchingAtom.reportWrite(value, super._searching, () {
      super._searching = value;
    });
  }

  final _$searchEnderecoAsyncAction =
      AsyncAction('_EnderecoControllerBase.searchEndereco');

  @override
  Future searchEndereco(String value) {
    return _$searchEnderecoAsyncAction.run(() => super.searchEndereco(value));
  }

  final _$getCurrentLocationAsyncAction =
      AsyncAction('_EnderecoControllerBase.getCurrentLocation');

  @override
  Future getCurrentLocation() {
    return _$getCurrentLocationAsyncAction
        .run(() => super.getCurrentLocation());
  }

  final _$_EnderecoControllerBaseActionController =
      ActionController(name: '_EnderecoControllerBase');

  @override
  dynamic getEnderecos() {
    final _$actionInfo = _$_EnderecoControllerBaseActionController.startAction(
        name: '_EnderecoControllerBase.getEnderecos');
    try {
      return super.getEnderecos();
    } finally {
      _$_EnderecoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic editAddress() {
    final _$actionInfo = _$_EnderecoControllerBaseActionController.startAction(
        name: '_EnderecoControllerBase.editAddress');
    try {
      return super.editAddress();
    } finally {
      _$_EnderecoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCurrentAddress() {
    final _$actionInfo = _$_EnderecoControllerBaseActionController.startAction(
        name: '_EnderecoControllerBase.setCurrentAddress');
    try {
      return super.setCurrentAddress();
    } finally {
      _$_EnderecoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedEndereco: ${selectedEndereco},
locationEndereco: ${locationEndereco},
currentPosition: ${currentPosition},
currentAddress: ${currentAddress},
getUserLocation: ${getUserLocation},
getSelectedEndereco: ${getSelectedEndereco},
isSearching: ${isSearching}
    ''';
  }
}
