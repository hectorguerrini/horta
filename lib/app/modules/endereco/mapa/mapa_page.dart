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
        backgroundColor: Colors.white.withOpacity(0.5),
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
        alignment: Alignment.topLeft,
        children: <Widget>[
          Observer(builder: (_) {
            return GoogleMap(
              initialCameraPosition: controller.getInitialCameraPosition,
              onMapCreated: controller.onMapCreated,
              onCameraMove: controller.onCameraMove,
              onCameraIdle: controller.onCameraIdle,
              markers: Set<Marker>.of(controller.getMarker),
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              padding: EdgeInsets.only(
                  top: 24, bottom: MediaQuery.of(context).size.height * 0.3),
            );
          }),
          Positioned(
            bottom: 0,
            height: MediaQuery.of(context).size.height * 0.3,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32), topRight: Radius.circular(32)),
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Observer(builder: (_) {
                      if (controller.getLoading) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return Text(
                        controller.getSelectedEndereco,
                        style: TextStyle(fontSize: 16),
                      );
                    }),
                    Container(
                      width: 100,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.search,
                        onFieldSubmitted: controller.setNumber,
                        decoration: InputDecoration(labelText: 'Nº'),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 8),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.search,
                        onFieldSubmitted: controller.setNumber,
                        decoration: InputDecoration(labelText: 'Complemento'),
                      ),
                    ),
                    RaisedButton(
                        color: Colors.green,
                        child: Text(
                          'Confirmar',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {}),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
