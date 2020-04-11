import 'package:flutter/material.dart';
import 'package:horta/models/produtos.dart';
import 'package:horta/services/produtos.dart';

class ListaProdutosScreen extends StatefulWidget {
  @override
  _ListaProdutosScreenState createState() => _ListaProdutosScreenState();
}

class _ListaProdutosScreenState extends State<ListaProdutosScreen> {
  List<Produtos> produtos = [];

  Produtos selectProduto;
  
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
        title: Text("Add produtos"),
      ),
      body: ListView(
        padding: EdgeInsets.all(40.0),
        children: <Widget>[
          Row(
            children: <Widget>[
              DropdownButton(
                onChanged: (value){
                  setState(() {
                    selectProduto = value;
                  });
                },
                value: selectProduto,
                  hint: Text("Nome dos produtos"),
                  items: this.produtos.map((value) => DropdownMenuItem(
                            child: 
                              Text(value.produto),
     
                            value: value,
                          ))
                      .toList())
            ],
          )
        ],
      ),
    );
  }
}
