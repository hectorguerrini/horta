import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'agricultor_controller.dart';
import 'models/produtos_model.dart';

class AgricultorPage extends StatefulWidget {
  final String title;
  const AgricultorPage({Key key, this.title = "Agricultor"}) : super(key: key);

  @override
  _AgricultorPageState createState() => _AgricultorPageState();
}

class _AgricultorPageState
    extends ModularState<AgricultorPage, AgricultorController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            FlatButton.icon(
              onPressed: () {},
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
              label: Text(
                'Adicionar',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.green,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(color: Colors.green)),
            ),
            Divider(),
            Observer(builder: (_) {
              if (controller.listaProdutos.hasError) {
                return Center(
                  child: RaisedButton(
                    onPressed: controller.getMeusProdutos,
                    child: Text('Reload'),
                  ),
                );
              }
              if (controller.listaProdutos.data == null) {
                return Center(child: CircularProgressIndicator());
              }

              List<ProdutosModel> lista = controller.listaProdutos.data;

              if (lista.length == 0) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                      child: Text(
                    "Nenhum Produto cadastrado",
                    style: TextStyle(color: Colors.black54),
                  )),
                );
              }
              return Expanded(
                  child: ListView.builder(
                itemCount: lista.length,
                itemBuilder: (BuildContext context, int index) {
                  ProdutosModel item = lista[index];
                  return ListTile(
                    leading: Image.asset(item.icon, fit: BoxFit.contain),
                    title: Row(
                      children: <Widget>[
                        Text(item.produto),
                        Spacer(),
                        item.disponibilidade
                            ? Text(
                                "Disponível",
                                style: TextStyle(color: Colors.green),
                              )
                            : Text(
                                "Indisponível",
                                style: TextStyle(color: Colors.red),
                              )
                      ],
                    ),
                    subtitle: Text(
                        "${controller.currency.format(item.preco)} / ${item.unidade}"),
                    trailing: Switch(
                        value: item.disponibilidade,
                        onChanged: (value) {
                          controller.changeDisponibilidade(value, item);
                        }),
                    onTap: () async {
                      // await actionSheetModel(
                      //     context, item, menuAgricultorController);
                    },
                  );
                },
              ));
            })
          ],
        ),
      ),
    );
  }
}
