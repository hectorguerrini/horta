import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:horta/screens/agricultor/menuAgricultor_controller.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ListaProdutosScreen extends StatefulWidget {
  @override
  _ListaProdutosScreenState createState() => _ListaProdutosScreenState();
}

class _ListaProdutosScreenState extends State<ListaProdutosScreen> {
  NumberFormat currency = new NumberFormat.currency(
      locale: "pt_BR", decimalDigits: 2, symbol: "R\$");

  @override
  Widget build(BuildContext context) {
    final MenuAgricultorController menuAgricultorController =
        Provider.of<MenuAgricultorController>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de produtos"),
      ),
      body: ListView(
        padding: EdgeInsets.all(20.0),
        children: <Widget>[
          Observer(builder: (_) {
            return Container(
              margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: DropdownButton(
                isExpanded: true,
                onChanged: menuAgricultorController.setProduto,
                value: menuAgricultorController.nomeProduto,
                hint: Text("Nome do produto"),
                items: menuAgricultorController.comboProdutos
                    .map((value) => DropdownMenuItem(
                          child: Text(
                            value.produto,
                          ),
                          value: value.produto,
                        ))
                    .toList(),
              ),
            );
          }),
          Observer(builder: (_) {
            return ListTile(
              leading: Text("Preco do produto"),
              trailing: Text("Reais"),
              title: TextField(
                enabled: menuAgricultorController.nomeProduto != null,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                controller: menuAgricultorController.precoProdutoCtrl,
                onChanged: menuAgricultorController.setPreco,
              ),
            );
          }),
          Divider(),
          Observer(builder: (_) {
            return Container(
              margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: DropdownButton(
                isExpanded: true,
                onChanged: menuAgricultorController.setUnidade,
                value: menuAgricultorController.unidadeProduto,
                hint: Text("quantidade"),
                items: <String>['Kilo', 'Duzia', 'Unidade']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            );
          }),
          Observer(builder: (_) {
            return ListTile(
              leading: (menuAgricultorController.iconProduto == null
                  ? Container(
                      height: 64,
                      width: 64,
                      child: Image.asset("assets/vegetable.png",
                          fit: BoxFit.contain))
                  : Container(
                      height: 64,
                      width: 64,
                      child: Image.asset(menuAgricultorController.iconProduto,
                          fit: BoxFit.contain))),
              title: menuAgricultorController.nomeProduto == null
                  ? Text("Nome do produto")
                  : Text(menuAgricultorController.nomeProduto),
              trailing: menuAgricultorController.precoProduto == null
                  ? Text("R\$ 0,00 reais")
                  : Text(
                      "${currency.format(menuAgricultorController.precoProduto)} por ${menuAgricultorController.unidadeProduto}"),
            );
          }),
          Divider(),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                  color: Colors.green,
                  child: Text("Salvar"),
                  onPressed: () async {
                    await menuAgricultorController.salvar();
                    await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CupertinoAlertDialog(
                            title: Text("Mensagem"),
                            content: Text("Salvo."),
                          );
                        });
                    Navigator.pop(context);
                  })
            ],
          )
        ],
      ),
    );
  }
}
