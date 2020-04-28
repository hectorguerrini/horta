import 'package:flutter/material.dart';
import 'package:horta/models/produtos.dart';
import 'package:horta/models/user.dart';
import 'package:horta/services/produtos.dart';
import 'package:intl/intl.dart';

class MenuAgricultorScreen extends StatefulWidget {
  @override
  _MenuAgricultorScreenState createState() => _MenuAgricultorScreenState();
}

class _MenuAgricultorScreenState extends State<MenuAgricultorScreen> {
  List<Produtos> listaProdutos = [];
  NumberFormat currency = new NumberFormat.currency(locale: "pt_BR",decimalDigits: 2, symbol: "R\$");
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getProdutos();
  }




  void getProdutos() {
    List<Produtos> lista = [];
    ProdutosService(uid: User.uid).getMeusProdutos()
      .then((onValue){
        onValue.documents.forEach((f){
          lista.add(Produtos.fromJson(f.data));
        });
        setState(() {
          this.listaProdutos = lista;
        });
      });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu Agricultor"), 
      ),
      body: ListView.builder(
        itemCount: this.listaProdutos.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if(index == 0){
            return RaisedButton(
              textTheme: ButtonTextTheme.primary,
              padding: EdgeInsets.all(10),
              color: Colors.blue,
              shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(18.0),
              ),
              onPressed: (){
                Navigator.pushNamed(context, '/listaProdutos').then((v){
                  this.getProdutos();
                });
              },
              child: Text("Adicionar produto",
              textScaleFactor: 1.8,
                ),
            );
          }
          return ListTile(
            leading: Image.asset(this.listaProdutos.elementAt(index-1).icon, fit: BoxFit.contain),
            title: Text(this.listaProdutos.elementAt(index-1).produto),
            trailing: Text("${currency.format(this.listaProdutos.elementAt(index-1).preco)} / ${this.listaProdutos.elementAt(index-1).unidade}"),
          );
        },
          
        )
      
      );  
  }
}

// List<Widget> listagemProdutos(List<Produtos> lista) {
  
//   List<Widget> listaW;
//   lista.forEach((f) {
//     listaW.add(
      
//     );
//   });  
//   return listaW;
// }