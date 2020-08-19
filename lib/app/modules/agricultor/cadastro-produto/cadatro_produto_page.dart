// import 'package:flutter/material.dart';
// import 'package:flutter_mobx/flutter_mobx.dart';
// import 'package:flutter_modular/flutter_modular.dart';
// import 'package:horta/app/modules/agricultor/cadastro-produto/cadastro_produto_controller.dart';

// class CadastroProdutoPage extends StatefulWidget {
//   @override
//   _CadastroProdutoPageState createState() => _CadastroProdutoPageState();
// }

// class _CadastroProdutoPageState
//     extends ModularState<CadastroProdutoPage, CadastroProdutoController> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Lista de produtos"),
//       ),
//       body: ListView(
//         padding: EdgeInsets.all(20.0),
//         children: <Widget>[
//           Observer(builder: (_) {
//             return Container(
//               margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
//               child: DropdownButton(
//                 isExpanded: true,
//                 onChanged: controller.setProduto,
//                 value: controller.nomeProduto,
//                 hint: Text("Nome do produto"),
//                 items: controller.comboProdutos
//                     .map((value) => DropdownMenuItem(
//                           child: Text(
//                             value.produto,
//                           ),
//                           value: value.produto,
//                         ))
//                     .toList(),
//               ),
//             );
//           }),
//           Observer(builder: (_) {
//             return ListTile(
//               leading: Text("Preco do produto"),
//               trailing: Text("Reais"),
//               title: TextField(
//                 enabled: controller.nomeProduto != null,
//                 keyboardType: TextInputType.numberWithOptions(decimal: true),
//                 controller: controller.precoProdutoCtrl,
//                 onChanged: controller.setPreco,
//               ),
//             );
//           }),
//           Divider(),
//           Observer(builder: (_) {
//             return Container(
//               margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
//               child: DropdownButton(
//                 isExpanded: true,
//                 onChanged: controller.setUnidade,
//                 value: controller.unidadeProduto,
//                 hint: Text("quantidade"),
//                 items: <String>['Kilo', 'Duzia', 'Unidade']
//                     .map<DropdownMenuItem<String>>((String value) {
//                   return DropdownMenuItem<String>(
//                     value: value,
//                     child: Text(value),
//                   );
//                 }).toList(),
//               ),
//             );
//           }),
//           Observer(builder: (_) {
//             return ListTile(
//               leading: (controller.iconProduto == null
//                   ? Container(
//                       height: 64,
//                       width: 64,
//                       child: Image.asset("assets/vegetable.png",
//                           fit: BoxFit.contain))
//                   : Container(
//                       height: 64,
//                       width: 64,
//                       child: Image.asset(controller.iconProduto,
//                           fit: BoxFit.contain))),
//               title: controller.nomeProduto == null
//                   ? Text("Nome do produto")
//                   : Text(controller.nomeProduto),
//               trailing: controller.precoProduto == null
//                   ? Text("R\$ 0,00 reais")
//                   : Text(
//                       "${currency.format(controller.precoProduto)} por ${menuAgricultorController.unidadeProduto}"),
//             );
//           }),
//           Divider(),
//           ButtonBar(
//             alignment: MainAxisAlignment.center,
//             children: <Widget>[
//               RaisedButton(
//                   color: Colors.green,
//                   child: Text("Salvar"),
//                   onPressed: () async {
//                     await menuAgricultorController.salvar();
//                     await showDialog(
//                         context: context,
//                         builder: (BuildContext context) {
//                           return CupertinoAlertDialog(
//                             title: Text("Mensagem"),
//                             content: Text("Salvo."),
//                           );
//                         });
//                     Navigator.pop(context);
//                   })
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
