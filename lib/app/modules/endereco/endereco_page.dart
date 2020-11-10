import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:horta/app/modules/endereco/model/endereco_model.dart';
import 'package:horta/app/shared/components/formfield_widget.dart';
import 'endereco_controller.dart';

import 'package:fluttericon/font_awesome5_icons.dart';

class EnderecoPage extends StatefulWidget {
  final String title;
  const EnderecoPage({Key key, this.title = "Endereço"}) : super(key: key);

  @override
  _EnderecoPageState createState() => _EnderecoPageState();
}

class _EnderecoPageState
    extends ModularState<EnderecoPage, EnderecoController> {
  //use 'controller' variable to access controller
  FutureBuilder() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Observer(builder: (_) {
                return FormFieldWidget(
                  labelText: 'Endereço',
                  onFieldSubmitted: controller.searchEndereco,
                  textInputAction: TextInputAction.search,
                  textCapitalization: TextCapitalization.words,
                  icon: Icon(Icons.search),
                  searching: controller.isSearching,
                );
              }),
            ),
            Observer(builder: (_) {
              return ListTile(
                leading: Icon(Icons.my_location),
                title: Text(
                  'Usar Localização atual',
                  style: TextStyle(fontSize: 16),
                ),
                dense: true,
                subtitle: controller.getUserLocation != ''
                    ? Text(controller.getUserLocation)
                    : Text('Carregando...'),
                trailing: controller.getUserLocation != ''
                    ? Icon(Icons.keyboard_arrow_right)
                    : Container(
                        height: 16,
                        width: 16,
                        child: CircularProgressIndicator(strokeWidth: 1),
                      ),
                onTap: () => controller.getUserLocation != ''
                    ? controller.editAddress(controller.currentPosition)
                    : null,
              );
            }),
            Divider(),
            Observer(builder: (_) {
              if (controller.listEnderecos.data == null)
                return Text('Nenhum Endereço cadastrado');
              List<EnderecoModel> lista = controller.listEnderecos.data;
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: lista.length,
                  itemBuilder: (context, index) => ListTile(
                        leading: Icon(
                          FontAwesome5.map_marker_alt,
                          color: Colors.green,
                        ),
                        title: Text(lista[index].enderecoFormat()),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () => controller.editAddress(lista[index]),
                      ));
            }),
          ],
        ),
      ),
    );
  }
}
