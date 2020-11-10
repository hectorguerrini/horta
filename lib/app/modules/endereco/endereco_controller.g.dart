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
  Computed<bool> _$isSearchingComputed;

  @override
  bool get isSearching =>
      (_$isSearchingComputed ??= Computed<bool>(() => super.isSearching,
              name: '_EnderecoControllerBase.isSearching'))
          .value;

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

  final _$currentPositionAtom =
      Atom(name: '_EnderecoControllerBase.currentPosition');

  @override
  EnderecoModel get currentPosition {
    _$currentPositionAtom.reportRead();
    return super.currentPosition;
  }

  @override
  set currentPosition(EnderecoModel value) {
    _$currentPositionAtom.reportWrite(value, super.currentPosition, () {
      super.currentPosition = value;
    });
  }

  final _$listEnderecosAtom =
      Atom(name: '_EnderecoControllerBase.listEnderecos');

  @override
  ObservableStream<List<EnderecoModel>> get listEnderecos {
    _$listEnderecosAtom.reportRead();
    return super.listEnderecos;
  }

  @override
  set listEnderecos(ObservableStream<List<EnderecoModel>> value) {
    _$listEnderecosAtom.reportWrite(value, super.listEnderecos, () {
      super.listEnderecos = value;
    });
  }

  final _$nameAtom = Atom(name: '_EnderecoControllerBase.name');

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

  final _$hortasAparecerAtom =
      Atom(name: '_EnderecoControllerBase.hortasAparecer');

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

  final _$asyncCallToRepositoryAtom =
      Atom(name: '_EnderecoControllerBase.asyncCallToRepository');

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
  dynamic editAddress(EnderecoModel enderecoModel) {
    final _$actionInfo = _$_EnderecoControllerBaseActionController.startAction(
        name: '_EnderecoControllerBase.editAddress');
    try {
      return super.editAddress(enderecoModel);
    } finally {
      _$_EnderecoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentPosition: ${currentPosition},
listEnderecos: ${listEnderecos},
getUserLocation: ${getUserLocation},
isSearching: ${isSearching}
    ''';
  }
}
