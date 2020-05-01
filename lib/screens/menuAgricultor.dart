import 'package:flutter/cupertino.dart';
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
  List<ProdutosDocument> listaProdutos = [];
  NumberFormat currency = new NumberFormat.currency(locale: "pt_BR",decimalDigits: 2, symbol: "\$");
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getProdutos();
  }
  

  void getProdutos() {
    List<ProdutosDocument> lista = [];
    ProdutosService(uid: User.uid).getMeusProdutos()
      .then((onValue){
        onValue.documents.forEach((f){
          ProdutosDocument p = ProdutosDocument.fromJson(
            {
              'uid': f.documentID,
              'produtos': f.data  
            }
          );
         
          
          lista.add(p);
        });
        setState(() {
           this.listaProdutos = lista;
        });
      });
  }

  Future actionSheetModel(BuildContext context, ProdutosDocument produto) async {
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
              onPressed: () {
                //FUNCAO DE EDITAR                
                Navigator.pop(context);
                Navigator.pushNamed(context, '/listaProdutos', arguments: produto);
              },
              child: Text('Editar')
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                //FUNCAO DE EXCLUIR
                ProdutosService(uid: User.uid).deleteMeusProdutos(produto.uid);
                Navigator.pop(context);
              },
              child: Text('Excluir')
            )
          ],
        );
      }
    );
  }
  @override
  Widget build(BuildContext context) {
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
              onPressed: (){
                Navigator.pushNamed(context, '/listaProdutos').then((v){
                  this.getProdutos();
                });
              },
              child: Text("Adicionar produto",
              textScaleFactor: 1.8,
                ),
            ),
            Divider(),
            Expanded(child:ListView.builder(
        itemCount: this.listaProdutos.length ,
        itemBuilder: (BuildContext context, int index) {
      
          return ListTile(
            leading: Image.asset(this.listaProdutos.elementAt(index).produtos.icon, fit: BoxFit.contain),
            title: Text(this.listaProdutos.elementAt(index).produtos.produto),
            trailing: Text("${currency.format(this.listaProdutos.elementAt(index).produtos.preco)} / ${this.listaProdutos.elementAt(index).produtos.unidade}"),
            subtitle: Divider(),
            onTap: () async {               
              await actionSheetModel(context, this.listaProdutos.elementAt(index));
              this.getProdutos();
            },
          );
        },
            )
        )

      ],),
      
      
      );  
  }
  
}

