import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:horta/app/modules/perfil/models/horta_model.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'dart:math';
import 'repositories/hortas_lista_repository.dart';

part 'hortas_lista_controller.g.dart';

@Injectable()
class HortasListaController = _HortasListaControllerBase
    with _$HortasListaController;

abstract class _HortasListaControllerBase with Store {
  final HortasListaRepository _repository = Modular.get();
  var hortas = [
    {
      "nome": "Horta do Miltão",
      "fazendeiro": "Milton Assis",
      "foto": "assets/fotos_perfil/milton.jpg",
      "latitude": 34.4219983,
      "longitude": -122.084,
      "distancia": null
    },
    {
      "nome": "Cantinho do Jerson",
      "fazendeiro": "Jerson Amado",
      "foto": "assets/fotos_perfil/jerson.png",
      "latitude": 36.4219983,
      "longitude": -122.084,
      "distancia": null
    },
    {
      "nome": "Gracefield House",
      "fazendeiro": "Isabella",
      "foto": "assets/fotos_perfil/horta.jpg",
      "latitude": 34.4219983,
      "longitude": -122.084,
      "distancia": null
    },
    {
      "nome": "Stardew Valley",
      "fazendeiro": "Abigail",
      "foto": "assets/fotos_perfil/horta2.jpg",
      "latitude": 35.4219983,
      "longitude": -122.084,
      "distancia": null
    },
    {
      "nome": "Cantinho do Dante",
      "fazendeiro": "Dante o do Inferno",
      "foto": "assets/fotos_perfil/dante.jpg",
      "latitude": 34.7219983,
      "longitude": -122.084,
      "distancia": null
    },
    {
      "nome": "Colheita Feliz",
      "fazendeiro": "Maria Sorriso",
      "foto": "assets/fotos_perfil/horta3.jpg",
      "latitude": 34.4219983,
      "longitude": -122.084,
      "distancia": null
    },
    {
      "nome": "Franciscana",
      "fazendeiro": "Francisco Filho",
      "foto": "assets/fotos_perfil/franciso.jpg",
      "latitude": 35.4219983,
      "longitude": -122.084,
      "distancia": null
    },
  ];

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

  _HortasListaControllerBase() {
    getCurrentLocation();
    getEnderecos();
  }

  @observable
  bool aparecer = false;

  @observable
  var hortasAparecer = [];

  double roundDouble(double value, int places) {
    double mod = pow(10.0, places);
    return ((value * mod).round().toDouble() / mod);
  }

  @observable
  ObservableStream<List<HortaModel>> listaHortas;

  @action
  getHortas() {
    listaHortas = _repository.getHortas().asObservable();
    this.aparecer = true;
  }

  //EnderecoController enderecoController = new EnderecoController();
  @action
  todasDistancias() async {
    await getCurrentLocation().then((val) {
      for (int i = 0; i < hortas.length; i++) {
        double dist = distance(currentPosition.latitude, hortas[i]["latitude"],
            currentPosition.longitude, hortas[i]["longitude"]);
        print(dist);
        hortas[i]["distancia"] = roundDouble(dist, 2);
        if (dist < 15000) {
          hortasAparecer.add(hortas[i]);
        }
      }
    });
    //print(this.hortasAparecer);
    //this.aparecer = true;
    //print(this.aparecer);
  }

  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 4));
    //print("2");
    return "Paulo Kogos";
  }

  @observable
  ObservableFuture<String> asyncCallToRepository;

  @action
  Future<void> chamarTodasDistancias() async {
    return await ObservableFuture(todasDistancias());
    /*name = await asyncCallToRepository;*/
  }

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

  static double toRadians(double angleIn10thofaDegree) {
    // Angle in 10th
    // of a degree
    return (angleIn10thofaDegree * pi) / 180;
  }

  double distance(double lat1, double lat2, double lon1, double lon2) {
    // The math module contains
    // a function named toRadians
    // which converts from degrees
    // to radians.
    lon1 = toRadians(lon1);
    lon2 = toRadians(lon2);
    lat1 = toRadians(lat1);
    lat2 = toRadians(lat2);

    // Haversine formula
    double dlon = lon2 - lon1;
    double dlat = lat2 - lat1;
    double a =
        pow(sin(dlat / 2), 2) + cos(lat1) * cos(lat2) * pow(sin(dlon / 2), 2);

    double c = 2 * asin(sqrt(a));

    // Radius of earth in
    // kilometers. Use 3956
    // for miles
    double r = 6371;

    // calculate the result
    return (c * r);
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

  void irParaPerfil() {
    Modular.to.pushNamed('/agricultorPagina');
  }
}
