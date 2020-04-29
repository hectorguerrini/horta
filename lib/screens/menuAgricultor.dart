import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:horta/models/produtos.dart';
import 'package:horta/models/user.dart';
import 'package:horta/screens/perfil/meusProdutos.dart';
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
  
  void getListaProdutos(){
    this.listaProdutos = listaProdutos;
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
      body: Column(children: <Widget>[
        RaisedButton(
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
            ),
            Expanded(child:ListView.builder(
        itemCount: this.listaProdutos.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if(index == 0){
            return Divider();
          }
          return ListTile(
            leading: Image.asset(this.listaProdutos.elementAt(index-1).icon, fit: BoxFit.contain),
            title: Text(this.listaProdutos.elementAt(index-1).produto),
            trailing: Text("${currency.format(this.listaProdutos.elementAt(index-1).preco)} / ${this.listaProdutos.elementAt(index-1).unidade}"),
            subtitle: Divider(),
            onTap: () async { 
              await actionSheetModel(context);
            },
          );
        },
            )
        )

      ],),
      
      
      );  
  }
  Future actionSheetModel(BuildContext context) async {
    await showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return CupertinoActionSheet(          
          title: Text('Editar o item'),
          cancelButton: CupertinoActionSheetAction(
            child: Text('Voltar'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: <Widget>[
            CupertinoActionSheetAction(
              onPressed: () {
                // FUNCAO DE EDITAR
                Navigator.pop(context);
              },
              child: Text('Editar')
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                //FUNCAO DE EXCLUIR
                ProdutosService().deleteMeusProdutos("AwnAzids3MaRT79MCAvb");
                Navigator.pop(context);
              },
              child: Text('Excluir')
            )
          ],
        );
      }
    );
  }
}

