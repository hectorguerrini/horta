import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:horta/screens/consumidor/horta_controller.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DetalheHorta extends StatefulWidget {
  @override
  _DetalheHortaState createState() => _DetalheHortaState();
}

class _DetalheHortaState extends State<DetalheHorta> {
  NumberFormat currency = new NumberFormat.currency(
      locale: "pt_BR", decimalDigits: 2, symbol: "R\$");

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final HortaController hortaController =
        Provider.of<HortaController>(context);
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
            Observer(builder: (_) {
              return Stack(
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
                        hortaController.detalheHorta.nomeHorta,
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
              );
            }),
            SizedBox(height: 20),
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
          Observer(builder: (_) {
            return SliverList(
                delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: <Widget>[
                        Divider(),
                        ListTile(
                          leading: Image.asset(hortaController.listaProdutos
                              .elementAt(index)
                              .icon),
                          title: Text(
                              hortaController.listaProdutos
                                  .elementAt(index)
                                  .produto,
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black)),
                          subtitle: Text(
                              "${currency.format(hortaController.listaProdutos.elementAt(index).preco)} ${hortaController.listaProdutos.elementAt(index).unidade}",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black54)),
                        ),
                      ],
                    ));
              },
              childCount: hortaController.listaProdutos.length,
            ));
          }),
        ],
      ),
    );
  }
}
