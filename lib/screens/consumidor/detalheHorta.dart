import 'package:flutter/material.dart';
import 'package:horta/main.dart';
import 'package:horta/models/horta.dart';
import 'package:horta/models/produtos.dart';
import 'package:horta/services/produtos.dart';
import 'package:intl/intl.dart';

class DetalheHorta extends StatefulWidget {
  @override
  _DetalheHortaState createState() => _DetalheHortaState();
}

class _DetalheHortaState extends State<DetalheHorta> with RouteAware {
  NumberFormat currency = new NumberFormat.currency(
      locale: "pt_BR", decimalDigits: 2, symbol: "R\$");
  HortaDocument hortaDoc;
  List<ProdutosDocument> listaProdutos = [];
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context));
  }

  @override
  void didPush() {
    super.didPush();
    this.hortaDoc = ModalRoute.of(context).settings.arguments;
    this.getProdutos();
  }

  @override
  void initState() {
    super.initState();
    
  }

  void getProdutos() {
    ProdutosService(uid: this.hortaDoc.uid).getMeusProdutos().then((value) {
      setState(() {
        this.listaProdutos = value.documents
          .map((v) => ProdutosDocument.fromJson(
              {'uid': v.documentID, 'produtos': v.data}))
          .toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.1,
      ),
      body: CustomScrollView(                
        slivers: <Widget>[        
          SliverList(
              delegate: SliverChildListDelegate([
            Stack(
              children: <Widget>[
                Image.network(
                    'https://via.placeholder.com/${(size.width.round())}X${(size.height * 0.2).round()}',
                    width: size.width,
                    height: size.height * 0.2,
                    color: Color.fromRGBO(255, 255, 255, 0.5),
                    colorBlendMode: BlendMode.modulate),
                Positioned(
                    top: size.height * 0.1,
                    width: size.width,
                    child: Text(
                      this.hortaDoc.horta.nomeHorta,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    )),
                Positioned(
                    bottom: 0,
                    left: 20,
                    child: Text(
                      "Avenida Roberto Marinho 3600",
                      style: TextStyle(fontSize: 16, color: Colors.black87),
                    ))
              ],
            ),
            SizedBox(height: 20),
            // Container(
            //   padding: EdgeInsets.symmetric(horizontal: 20),
            //   child: Text("Historia da Horta", 
            //     style: TextStyle(
            //       fontWeight: FontWeight.w400,
            //       fontSize: 16
            //     )),
            // ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(this.hortaDoc.horta.minhaHistoria, 
                style: TextStyle(
                  fontWeight: FontWeight.w300,

                )),
            ),
            
            
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Text("Produtos Disponiveis",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
            ),
          ])),
          SliverList(
            delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {  
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: <Widget>[
                    Divider(),
                    ListTile(
                      leading: Image.asset(
                          this.listaProdutos.elementAt(index).produtos.icon),
                      title: Text(
                          this.listaProdutos.elementAt(index).produtos.produto,
                          style: TextStyle(fontSize: 16, color: Colors.black)),
                      subtitle: Text(
                          "${currency.format(this.listaProdutos.elementAt(index).produtos.preco)} ${this.listaProdutos.elementAt(index).produtos.unidade}",
                          style: TextStyle(fontSize: 16, color: Colors.black54)),
                    ),
                    
                  ],
                )
                
              );
                       
            },            
            childCount: this.listaProdutos.length,            
          )),
        ],
      ),
    );
  }
}
