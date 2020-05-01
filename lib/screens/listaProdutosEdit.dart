import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:horta/models/produtos.dart';
import 'package:horta/models/user.dart';
import 'package:horta/services/produtos.dart';
import 'package:intl/intl.dart';

class ListaProdutosEditScreen extends StatefulWidget {
  @override
  _ListaProdutosEditScreenState createState() => _ListaProdutosEditScreenState();
}

class _ListaProdutosEditScreenState extends State<ListaProdutosEditScreen> with RouteAware {
  List<Produtos> produtos = [];
  final precoProdutoCtrl = new TextEditingController(text: "0,00");
  Produtos selectProduto;
  Produtos argsProdutos;
  List unidade = ["kg, unidade, duzia"];
  NumberFormat currency = new NumberFormat.currency(locale: "pt_BR",decimalDigits: 2, symbol: "R\$");

  
  @override
  void didPush() {
    super.didPush();
    argsProdutos = ModalRoute.of(context).settings.arguments;    
  }
  
  
  @override
  void initState() {
    super.initState();
    this.getListaProdutos();
  }
  
  void getListaProdutos() {
    List<Produtos> lista = [];
    ProdutosService().listaProdutos().then((value) {
      value.documents.forEach((value) {
        var prod = Produtos.fromJson(value.data);
        prod.preco = 0;
        prod.unidade = "Kilo";
        lista.add(prod);
      });
      setState(() {
        produtos = lista;
        if(argsProdutos != null){
          selectProduto = this.produtos.firstWhere((p) => p.produto == this.argsProdutos.produto);
          selectProduto.preco = argsProdutos.preco;  
          this.precoProdutoCtrl.text = argsProdutos.preco.toString();
        }        
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
          ListTile(title: Text(argsProdutos.produto.toString())),

          
          ListTile(
            leading: Text("Preco do produto"),
            trailing: Text("Reais"),  
            title: TextField(            
            enabled: true,
            keyboardType: TextInputType.number,
            controller: precoProdutoCtrl,      
            onChanged: (value) {
              setState(() {
                if (selectProduto != null)
                  selectProduto.preco = int.parse(value);
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
        
          
          ListTile(
            leading: (selectProduto 
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
            title: selectProduto == null ? Text("Nome do produto") : Text(selectProduto.produto),
            trailing: selectProduto == null ? Text("R\$ 0,00 reais") : Text("${currency.format(selectProduto.preco)} / ${selectProduto.unidade}"),
            
            
          ),
         
          Divider(),

          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(

                  color: Colors.green,
                  child: Text("Salvar"),
                  onPressed: () {                    
                    ProdutosService(uid: User.uid).updateMeusProdutos(selectProduto).then((onValue) async {
                      await showDialog(
                        context: context,
                        builder: (BuildContext context){
                          return CupertinoAlertDialog(
                            title: Text("Mensagem"),
                            content: Text("Salvo."),
                          );
                        }
                      );
                      Navigator.pop(context);                    
                    });
                  })
            ],
          )
        ],
      ),
    );
  }
}
