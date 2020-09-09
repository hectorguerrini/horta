import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'mapa_controller.dart';

class MapaPage extends StatefulWidget {
  final String title;
  const MapaPage({Key key, this.title = "Selecione o Endereço"})
      : super(key: key);

  @override
  _MapaPageState createState() => _MapaPageState();
}

class _MapaPageState extends ModularState<MapaPage, MapaController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
            color: Colors.red,
            icon: Icon(
              Icons.keyboard_arrow_left,
              color: Colors.orange,
              size: 48,
            ),
            onPressed: () => Modular.to.pop()),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Observer(builder: (_) {
            return GoogleMap(
              initialCameraPosition: controller.getInitialCameraPosition,
              onMapCreated: controller.onMapCreated,
              onCameraMove: controller.onCameraMove,
              onCameraIdle: controller.onCameraIdle,
              markers: Set<Marker>.of(controller.getMarker),
              myLocationEnabled: true,
              liteModeEnabled: true,
              
              padding: EdgeInsets.only( bottom: 54),
            );
          }),
          Positioned(
            bottom: 16,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal:16.0),
              child: RaisedButton(
                  color: Colors.orange,
                  child: Text(
                    'Confirmar Endereço',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {}),
            ),
          ),
          Positioned(
            top: 0,
            width: MediaQuery.of(context).size.width,
            child: Observer(builder: (_) {
              if (controller.getLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListTile(
                dense: true,
                title: Text(
                  controller.getSelectedEndereco,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16,color: Colors.orange)
                ),
                subtitle: Text(
                  controller.getSelectedLocal,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}
