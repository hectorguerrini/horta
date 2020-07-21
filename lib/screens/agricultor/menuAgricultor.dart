import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:horta/models/produtos_model.dart';
import 'package:horta/screens/agricultor/menuAgricultor_controller.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class MenuAgricultorScreen extends StatefulWidget {
  @override
  _MenuAgricultorScreenState createState() => _MenuAgricultorScreenState();
}

class _MenuAgricultorScreenState extends State<MenuAgricultorScreen> {
  NumberFormat currency = new NumberFormat.currency(
      locale: "pt_BR", decimalDigits: 2, symbol: "R\$");

  @override
  Widget build(BuildContext context) {
    final MenuAgricultorController menuAgricultorController =
        Provider.of<MenuAgricultorController>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu Agricultor"),
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
            textTheme: ButtonTextTheme.primary,
            padding: EdgeInsets.all(10),
            color: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(18.0),
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/listaProdutos');
            },
            child: Text(
              "Adicionar produto",
              textScaleFactor: 1.8,
            ),
          ),
          Divider(),
          Observer(builder: (_) {
            if (menuAgricultorController.listaProdutos.hasError) {
              return Center(
                child: RaisedButton(
                  onPressed: menuAgricultorController.getMeusProdutos,
                  child: Text('Error'),
                ),
              );
            }
            if (menuAgricultorController.listaProdutos.data == null) {
              return Center(child: CircularProgressIndicator());
            }

            List<ProdutosModel> lista =
                menuAgricultorController.listaProdutos.data;
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
                  subtitle:
                      Text("${currency.format(item.preco)} / ${item.unidade}"),
                  trailing: Switch(
                      value: item.disponibilidade,
                      onChanged: (value) {
                        menuAgricultorController.changeDisponibilidade(
                            value, item);
                      }),
                  onTap: () async {
                    await actionSheetModel(
                        context, item, menuAgricultorController);
                  },
                );
              },
            ));
          })
        ],
      ),
    );
  }
}

Future actionSheetModel(BuildContext context, ProdutosModel _produto,
    MenuAgricultorController menuCtrl) async {
  await showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return CupertinoActionSheet(
          title: Text('Editar o Produto'),
          cancelButton: CupertinoActionSheetAction(
            child: Text('Voltar'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: <Widget>[
            CupertinoActionSheetAction(
                onPressed: () async {
                  menuCtrl.editProduto(_produto);
                  Navigator.pushNamed(context, '/listaProdutos');
                },
                child: Text('Editar')),
            CupertinoActionSheetAction(
                onPressed: () {
                  //FUNCAO DE EXCLUIR
                  // ProdutosService(uid: User.uid).deleteMeusProdutos(produto.uid);
                  Navigator.pop(context);
                },
                child: Text('Excluir'))
          ],
        );
      });
}
