import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:horta/app/modules/perfil/minha-horta/minha_horta_controller.dart';
import 'package:horta/app/shared/components/formfield_widget.dart';

class MinhaHortaPage extends StatefulWidget {
  final String title;

  const MinhaHortaPage({Key key, this.title = 'Minha Horta'}) : super(key: key);
  @override
  _MinhaHortaPageState createState() => _MinhaHortaPageState();
}

class _MinhaHortaPageState
    extends ModularState<MinhaHortaPage, MinhaHortaController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: <Widget>[
          Text('Informações Da Horta',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Divider(),
          FormFieldWidget(
            labelText: 'Nome da Horta',
            controller: controller.nomeHortaCtrl,
            onChanged: controller.changeNomeHorta,
          ),
          Divider(),
          FormFieldWidget(
            labelText: 'Minha Historia',
            controller: controller.minhaHistoriaCtrl,
            onChanged: controller.changeMinhaHistoria,
            keyboardType: TextInputType.multiline,
          ),
          Divider(),
          Text('Horario de Funcionamento',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Divider(),
          Observer(
            builder: (_) {
              return ListTile(
                leading: Icon(
                  Icons.timer,
                  size: 32,
                ),
                title: Text("Horario de abertura"),
                subtitle: Text(controller.getAberturaString),
                trailing: FlatButton(
                  child: Text("Editar"),
                  color: Colors.transparent,
                  onPressed: () => showTimePicker(
                      context: context,
                      initialTime: controller.getAbertura,
                      builder: (BuildContext context, Widget child) {
                        return MediaQuery(
                          data: MediaQuery.of(context)
                              .copyWith(alwaysUse24HourFormat: false),
                          child: child,
                        );
                      }).then(controller.setTimeAbertura),
                ),
              );
            },
          ),
          Observer(
            builder: (_) {
              return ListTile(
                leading: Icon(
                  Icons.timer_off,
                  size: 32,
                ),
                title: Text("Horario de Fechamento"),
                subtitle: Text(controller.getFechamentoString),
                trailing: FlatButton(
                  child: Text("Editar"),
                  color: Colors.transparent,
                  onPressed: () => showTimePicker(
                      context: context,
                      initialTime: controller.getAbertura,
                      builder: (BuildContext context, Widget child) {
                        return MediaQuery(
                          data: MediaQuery.of(context)
                              .copyWith(alwaysUse24HourFormat: false),
                          child: child,
                        );
                      }).then(controller.setTimeFechamento),
                ),
              );
            },
          ),
          Divider(),
          Text('Formas de Pagamento',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Divider(),
          Observer(
            builder: (_) {
              return ListTile(
                leading: Icon(FontAwesome.money,
                    color: controller.getDinheiro ? Colors.green : Colors.grey),
                title: Text(
                  'Dinheiro',
                  style: TextStyle(fontSize: 18),
                ),
                trailing: Switch(
                  activeColor: Colors.green,
                  value: controller.getDinheiro,
                  onChanged: controller.changeDinheiro,
                ),
              );
            },
          ),
          Observer(
            builder: (_) {
              return ListTile(
                leading: Icon(FontAwesome.credit_card,
                    color: controller.getCartaoDebito
                        ? Colors.green
                        : Colors.grey),
                title: Text('Cartão Debito', style: TextStyle(fontSize: 18)),
                trailing: Switch(
                    activeColor: Colors.green,
                    value: controller.getCartaoDebito,
                    onChanged: controller.changeCartaoDebito),
              );
            },
          ),
          Observer(
            builder: (_) {
              return ListTile(
                leading: Icon(FontAwesome.credit_card_alt,
                    color: controller.getCartaoCredito
                        ? Colors.green
                        : Colors.grey),
                title: Text('Cartão Credito', style: TextStyle(fontSize: 18)),
                trailing: Switch(
                    activeColor: Colors.green,
                    value: controller.getCartaoCredito,
                    onChanged: controller.changeCartaoCredito),
              );
            },
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 8),
            child: Observer(builder: (_) {
              return RaisedButton(
                onPressed: controller.fieldsIsValid ? controller.save : null,
                child: Text(
                  'Atualizar',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.green,
                padding: EdgeInsets.all(16),
              );
            }),
          )
        ],
      ),
    );
  }
}
