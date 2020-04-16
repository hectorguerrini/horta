import 'package:flutter/material.dart';
import 'package:horta/models/produtos.dart';
import 'package:horta/services/produtos.dart';

class ListaProdutosScreen extends StatefulWidget {
  @override
  _ListaProdutosScreenState createState() => _ListaProdutosScreenState();
}

class _ListaProdutosScreenState extends State<ListaProdutosScreen> {
  List<Produtos> produtos = [];
  final TextEditingController precoProdutoCtrl = new TextEditingController();
  Produtos selectProduto;
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

  Widget criarProduto(){
    return(ListTile(
            enabled: false,
            leading: Icon(Icons.ac_unit),
            title: Text("Nome do produto"),
            trailing: Text("Preco" + " UNIDADE"),
          ));
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
                  this.selectProduto = objetoComNomeEIcone;
                
                });
              },
              value: selectProduto,
              hint: Text("Nome do produto"),
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
          ListTile(
            leading: Text("Preco do produto"),
            trailing: Text("Reais"),  
            title: TextField(
            enabled: true,
            keyboardType: TextInputType.number,
            controller: precoProdutoCtrl,
            onChanged: (dynamic value) {
              setState(() {
                if (selectProduto != null)
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
              onChanged: (unidadeProduto) {
                setState(() {
                  if (selectProduto != null)
                    selectProduto.unidade = unidadeProduto;
                });
              },
              value: selectProduto != null ? selectProduto.unidade : null,
              hint: Text("quantidade"),
              items: <String>['Kilo', 'Duzia', 'Unidade']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        
          
          
          (selectProduto 
             == null ? 
            Container(
              height: 64,
              width: 64,
              child: Image.asset("assets/vegetable.png", fit: BoxFit.contain)
            ) : Container(
              height: 64,
              width: 64,
              child: Image.asset(selectProduto.icon, fit: BoxFit.contain))             
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
