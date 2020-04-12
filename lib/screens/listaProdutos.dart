import 'package:flutter/material.dart';
import 'package:horta/models/produtos.dart';
import 'package:horta/models/user.dart';
import 'package:horta/services/database.dart';
import 'package:horta/services/produtos.dart';

class ListaProdutosScreen extends StatefulWidget {
  @override
  _ListaProdutosScreenState createState() => _ListaProdutosScreenState();
}

class _ListaProdutosScreenState extends State<ListaProdutosScreen> {
  List<Produtos> produtos = [];
  final TextEditingController precoProdutoCtrl = new TextEditingController();
  final TextEditingController quantidadeCtrl = new TextEditingController();
  Produtos selectProduto = new Produtos();
  List unidade = ["kg, unidade, duzia"];

  @override
  void initState() {
    super.initState();
    getListaProdutos();
  }

  void getListaProdutos() {
    List<Produtos> lista = [];
    ProdutosService().listaProdutos().then((value) {
      value.documents.forEach((value) {
        lista.add(Produtos.fromJson(value.data));
      });
      setState(() {
        produtos = lista;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de produtos"),
      ),
      body: ListView(
        padding: EdgeInsets.all(20.0),
        children: <Widget>[




          Container(
            margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: DropdownButton(
              isExpanded: true,
              onChanged: (objetoComNomeEIcone) {
                setState(() {
                  selectProduto = objetoComNomeEIcone;
                });
              },
              value: selectProduto.produto != null ? selectProduto : null,
              hint: Text("Nome dos produtos"),
              items: this
                  .produtos
                  .map((value) => DropdownMenuItem(
                        child: Text(
                          value.produto,
                        ),
                        value: value,
                      ))
                  .toList(),
            ),
          ),





          Divider(),
          ListTile(
            leading: Text("Preco do produto"),
            trailing: Text("Reais"),
            title: TextFormField(
              keyboardType: TextInputType.number,
              controller: precoProdutoCtrl,
              onChanged: (dynamic value) {
                setState(() {
                  selectProduto.preco = value;
                });
              },
            ),
          ),
          Divider(),



          Container(
            margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: DropdownButton(
              isExpanded: true,
              onChanged: (unidadeProduto){
                  setState(() {
                    selectProduto.unidade = unidadeProduto;
                    
                  });
                },
                value: selectProduto.unidade,
                hint: Text("Quantidade dos produtos"),
                items: <String>['Kilo','Duzia', 'Unidade']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                ),
          ),
          
          
          
          Divider(),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                  color: Colors.green,
                  child: Text("Salvar"),
                  onPressed: () {
                    Navigator.pushNamed(context, '/menuAgricultor');
                  })
            ],
          )
        ],
      ),
    );
  }
}
