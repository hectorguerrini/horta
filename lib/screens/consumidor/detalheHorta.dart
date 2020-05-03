import 'package:flutter/material.dart';
import 'package:horta/main.dart';
import 'package:horta/models/horta.dart';
import 'package:intl/intl.dart';
class DetalheHorta extends StatefulWidget {
  @override
  _DetalheHortaState createState() => _DetalheHortaState();
}

class _DetalheHortaState extends State<DetalheHorta> with RouteAware{  
  NumberFormat currency = new NumberFormat.currency(locale: "pt_BR",decimalDigits: 2, symbol: "R\$");
  HortaDocument hortaDoc;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context));
  }

  @override
  void didPush() {
    super.didPush();
    this.hortaDoc = ModalRoute.of(context).settings.arguments;
  }
  @override
  void initState() {    
    super.initState();
  }
  void getProdutos() {
    
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
              delegate: SliverChildListDelegate(
                [
                  Stack(
                    children: <Widget>[
                      Image.network('https://via.placeholder.com/${(size.width.round())}X${(size.height*0.2).round()}',
                        width: size.width,
                        height: size.height * 0.2,
                        color: Color.fromRGBO(255, 255, 255, 0.5),
                        colorBlendMode: BlendMode.modulate
                      ),                  
                      Positioned(
                        top: size.height * 0.1,
                        width: size.width,                                        
                        child: Text("Horta do Ronaldo", 
                      
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20,color: Colors.black, fontWeight: FontWeight.bold),
                          )                  
                      ),
                      Positioned(
                        bottom: 0,
                        left: 20,
                        child: Text("Avenida Roberto Marinho 3600",
                          style: TextStyle(fontSize: 16, color: Colors.black87),
                        )
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Text("Produtos Disponiveis", style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold)),
                  ),
                ]
              )
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  if ( index % 2 == 0) {                    
                    return Padding(child: Divider(height: 1),padding: EdgeInsets.symmetric(horizontal:20));       
                  }
                  return Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: Column(
                      children: <Widget>[                        
                        ListTile(                                                                                              
                          leading: Image.asset("assets/vegetable-garden.png"), // 64px flatIcons
                          title: Text("Cenoura", style: TextStyle(fontSize: 16, color: Colors.black)),
                          subtitle:Text("${currency.format(12.5)} kg", style: TextStyle(fontSize: 16, color: Colors.black54)),
                          onTap: (){},
                        ),
                        Divider(),
                        ListTile(                                                                                              
                          leading: Image.asset("assets/cauliflower.png"), // 64px flatIcons
                          title: Text("Couve Flor", style: TextStyle(fontSize: 16, color: Colors.black)),
                          subtitle:Text("${currency.format(2.5)} kg", style: TextStyle(fontSize: 16, color: Colors.black54)),
                          onTap: (){},
                        )
                      ]
                    )
                  );    
                },
                childCount: 2,
                
              )
            )
          ],
        ),
    );
  }
}