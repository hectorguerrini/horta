// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hortas_lista_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HortasListaController on _HortasListaControllerBase, Store {
  Computed<String> _$getUserLocationComputed;

  @override
  String get getUserLocation => (_$getUserLocationComputed ??= Computed<String>(
          () => super.getUserLocation,
          name: '_HortasListaControllerBase.getUserLocation'))
      .value;
  Computed<String> _$getSelectedEnderecoComputed;

  @override
  String get getSelectedEndereco => (_$getSelectedEnderecoComputed ??=
          Computed<String>(() => super.getSelectedEndereco,
              name: '_HortasListaControllerBase.getSelectedEndereco'))
      .value;
  Computed<bool> _$isSearchingComputed;

  @override
  bool get isSearching =>
      (_$isSearchingComputed ??= Computed<bool>(() => super.isSearching,
              name: '_HortasListaControllerBase.isSearching'))
          .value;

  final _$selectedEnderecoAtom =
      Atom(name: '_HortasListaControllerBase.selectedEndereco');

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
      Atom(name: '_HortasListaControllerBase.locationEndereco');

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
      Atom(name: '_HortasListaControllerBase.currentPosition');

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
      Atom(name: '_HortasListaControllerBase.currentAddress');

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

  final _$_searchingAtom = Atom(name: '_HortasListaControllerBase._searching');

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

  final _$nameAtom = Atom(name: '_HortasListaControllerBase.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$aparecerAtom = Atom(name: '_HortasListaControllerBase.aparecer');

  @override
  bool get aparecer {
    _$aparecerAtom.reportRead();
    return super.aparecer;
  }

  @override
  set aparecer(bool value) {
    _$aparecerAtom.reportWrite(value, super.aparecer, () {
      super.aparecer = value;
    });
  }

  final _$hortasAparecerAtom =
      Atom(name: '_HortasListaControllerBase.hortasAparecer');

  @override
  List<dynamic> get hortasAparecer {
    _$hortasAparecerAtom.reportRead();
    return super.hortasAparecer;
  }

  @override
  set hortasAparecer(List<dynamic> value) {
    _$hortasAparecerAtom.reportWrite(value, super.hortasAparecer, () {
      super.hortasAparecer = value;
    });
  }

  final _$listaHortasAtom =
      Atom(name: '_HortasListaControllerBase.listaHortas');

  @override
  ObservableStream<List<HortaModel>> get listaHortas {
    _$listaHortasAtom.reportRead();
    return super.listaHortas;
  }

  @override
  set listaHortas(ObservableStream<List<HortaModel>> value) {
    _$listaHortasAtom.reportWrite(value, super.listaHortas, () {
      super.listaHortas = value;
    });
  }

  final _$asyncCallToRepositoryAtom =
      Atom(name: '_HortasListaControllerBase.asyncCallToRepository');

  @override
  ObservableFuture<String> get asyncCallToRepository {
    _$asyncCallToRepositoryAtom.reportRead();
    return super.asyncCallToRepository;
  }

  @override
  set asyncCallToRepository(ObservableFuture<String> value) {
    _$asyncCallToRepositoryAtom.reportWrite(value, super.asyncCallToRepository,
        () {
      super.asyncCallToRepository = value;
    });
  }

  final _$todasDistanciasAsyncAction =
      AsyncAction('_HortasListaControllerBase.todasDistancias');

  @override
  Future todasDistancias() {
    return _$todasDistanciasAsyncAction.run(() => super.todasDistancias());
  }

  final _$chamarTodasDistanciasAsyncAction =
      AsyncAction('_HortasListaControllerBase.chamarTodasDistancias');

  @override
  Future<void> chamarTodasDistancias() {
    return _$chamarTodasDistanciasAsyncAction
        .run(() => super.chamarTodasDistancias());
  }

  final _$searchEnderecoAsyncAction =
      AsyncAction('_HortasListaControllerBase.searchEndereco');

  @override
  Future searchEndereco(String value) {
    return _$searchEnderecoAsyncAction.run(() => super.searchEndereco(value));
  }

  final _$getCurrentLocationAsyncAction =
      AsyncAction('_HortasListaControllerBase.getCurrentLocation');

  @override
  Future getCurrentLocation() {
    return _$getCurrentLocationAsyncAction
        .run(() => super.getCurrentLocation());
  }

  final _$_HortasListaControllerBaseActionController =
      ActionController(name: '_HortasListaControllerBase');

  @override
  dynamic getHortas() {
    final _$actionInfo = _$_HortasListaControllerBaseActionController
        .startAction(name: '_HortasListaControllerBase.getHortas');
    try {
      return super.getHortas();
    } finally {
      _$_HortasListaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getEnderecos() {
    final _$actionInfo = _$_HortasListaControllerBaseActionController
        .startAction(name: '_HortasListaControllerBase.getEnderecos');
    try {
      return super.getEnderecos();
    } finally {
      _$_HortasListaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic editAddress() {
    final _$actionInfo = _$_HortasListaControllerBaseActionController
        .startAction(name: '_HortasListaControllerBase.editAddress');
    try {
      return super.editAddress();
    } finally {
      _$_HortasListaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCurrentAddress() {
    final _$actionInfo = _$_HortasListaControllerBaseActionController
        .startAction(name: '_HortasListaControllerBase.setCurrentAddress');
    try {
      return super.setCurrentAddress();
    } finally {
      _$_HortasListaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedEndereco: ${selectedEndereco},
locationEndereco: ${locationEndereco},
currentPosition: ${currentPosition},
currentAddress: ${currentAddress},
name: ${name},
aparecer: ${aparecer},
hortasAparecer: ${hortasAparecer},
listaHortas: ${listaHortas},
asyncCallToRepository: ${asyncCallToRepository},
getUserLocation: ${getUserLocation},
getSelectedEndereco: ${getSelectedEndereco},
isSearching: ${isSearching}
    ''';
  }
}
