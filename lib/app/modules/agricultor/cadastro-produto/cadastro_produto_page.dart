import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:horta/app/enumeration/hortalicas_enum.dart';
import 'package:horta/app/enumeration/unidade_enum.dart';
import 'package:horta/app/modules/agricultor/cadastro-produto/cadastro_produto_controller.dart';
import 'package:horta/app/shared/components/toast_widget.dart';
import 'package:horta/app/shared/utils/constants.dart';
import 'package:oktoast/oktoast.dart';

class CadastroProdutoPage extends StatefulWidget {
  @override
  _CadastroProdutoPageState createState() => _CadastroProdutoPageState();
}

class _CadastroProdutoPageState
    extends ModularState<CadastroProdutoPage, CadastroProdutoController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de produtos"),
      ),
      body: ListView(
        padding: EdgeInsets.all(20.0),
        children: <Widget>[
          Observer(builder: (_) {
            return Card(
              shape: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[500])),
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 8, bottom: 8),
                child: DropdownButton(
                  isExpanded: true,
                  onChanged: controller.setProduto,
                  value: controller.getNomeProduto,
                  hint: Text("Nome do produto"),
                  underline: Container(
                    height: 0,
                  ),
                  items: Hortalicas.values
                      .map((value) => DropdownMenuItem(
                            child: Text.rich(TextSpan(children: [
                              WidgetSpan(
                                  child: Image.asset(
                                ICON_HORTALICAS[value],
                                fit: BoxFit.cover,
                                width: 24,
                                alignment: Alignment.centerLeft,
                              )),
                              TextSpan(text: "\t" + value.toShortString())
                            ])),
                            value: value,
                          ))
                      .where((element) =>
                          !controller.getMeusProdutos
                              .map((e) => e.produto)
                              .contains(element.value) ||
                          element.value == controller.getNomeProduto)
                      .toList(),
                ),
              ),
            );
          }),
          Row(
            children: [
              Observer(builder: (_) {
                return Expanded(
                  flex: 1,
                  child: Card(
                    child: TextFormField(
                      enabled: controller.getNomeProduto != null,
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      controller: controller.precoProdutoCtrl,
                      onChanged: controller.setPreco,
                      decoration: InputDecoration(
                          labelText: 'Preço do Produto',
                          border: OutlineInputBorder()),
                    ),
                  ),
                );
              }),
              Observer(builder: (_) {
                return Expanded(
                  flex: 1,
                  child: Card(
                    shape: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[500])),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 16, top: 5.5, bottom: 5.5),
                      child: DropdownButton(
                        isExpanded: true,
                        onChanged: controller.setUnidade,
                        value: controller.getUnidadeProduto,
                        underline: Container(
                          height: 0,
                        ),
                        hint: Text("quantidade"),
                        items: Unidade.values
                            .map((value) => DropdownMenuItem(
                                  child: Text.rich(TextSpan(children: [
                                    TextSpan(text: value.toShortString())
                                  ])),
                                  value: value,
                                ))
                            .toList(),
                      ),
                    ),
                  ),
                );
              }),
            ],
          ),
          Divider(),
          Observer(builder: (_) {
            return ListTile(
              leading: (controller.getIconProduto == null
                  ? Container(
                      height: 64,
                      width: 64,
                      child: Image.asset("assets/vegetable.png",
                          fit: BoxFit.contain))
                  : Container(
                      height: 64,
                      width: 64,
                      child: Image.asset(controller.getIconProduto,
                          fit: BoxFit.contain))),
              title: controller.getNomeProduto == null
                  ? Text("Nome do produto")
                  : Text(controller.getNomeProduto.toShortString()),
              trailing: controller.getPrecoProduto == null
                  ? Text("R\$ 0,00 reais")
                  : Text(controller.getPrice),
            );
          }),
          Divider(),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                  color: Colors.green,
                  child: Text("Salvar"),
                  onPressed: () async {
                    await controller.salvar();
                    showToastWidget(
                        ToastWidget(
                          msg: 'Produto Cadastrado',
                        ),
                        position: ToastPosition.bottom);
                    Modular.to.pop();
                  })
            ],
          )
        ],
      ),
    );
  }
}
