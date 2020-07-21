import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:horta/components/buttons.dart';
import 'package:horta/components/formfield.dart';
import 'package:horta/models/icons_app_icons.dart';
import 'package:horta/screens/perfil/perfil_controller.dart';
import 'package:provider/provider.dart';

class MinhaHortaScreen extends StatefulWidget {
  @override
  _MinhaHortaScreenState createState() => _MinhaHortaScreenState();
}

class _MinhaHortaScreenState extends State<MinhaHortaScreen> with RouteAware {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final PerfilController perfilController =
        Provider.of<PerfilController>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Minha Horta")),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: <Widget>[
          FormFieldCustom(
            labelText: 'Nome da Horta',
            controller: perfilController.nomeCtrl,
            onChanged: perfilController.changeNomeHorta,
          ),
          Divider(),
          FormFieldCustom(
            labelText: 'Minha Historia',
            controller: perfilController.minhaHistoriaCtrl,
            onChanged: perfilController.changeMinhaHistoria,
            keyboardType: TextInputType.multiline,
          ),
          Divider(),
          Text('Horario de Funcionamento',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Divider(),
          Observer(
            builder: (_) {
              return ListTile(
                leading: Icon(Icons.timer),
                title: Text("Horario de abertura"),
                subtitle: Text(perfilController.getAbertura ?? 'Sem Horario'),
                trailing: FlatButton(
                  child: Text("Editar"),
                  color: Colors.transparent,
                  onPressed: () async {
                    TimeOfDay time = await _showTimePicker(
                        perfilController.minhaHorta.abertura);
                    perfilController.setTimeAbertura(time);
                  },
                ),
              );
            },
          ),
          Observer(
            builder: (_) {
              return ListTile(
                leading: Icon(Icons.timer_off),
                title: Text("Horario de Fechamento"),
                subtitle: Text(perfilController.getFechamento ?? 'Sem Horario'),
                trailing: FlatButton(
                  child: Text("Editar"),
                  color: Colors.transparent,
                  onPressed: () async {
                    TimeOfDay time = await _showTimePicker(
                        perfilController.minhaHorta.fechamento);
                    perfilController.setTimeFechamento(time);
                  },
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
                leading: Icon(IconsApp.money),
                title: Text('Dinheiro', style: TextStyle(fontSize: 18)),
                trailing: Switch(
                  activeColor: Colors.green,
                  value: perfilController.minhaHorta.dinheiro,
                  onChanged: perfilController.changeDinheiro,
                ),
              );
            },
          ),
          Observer(
            builder: (_) {
              return ListTile(
                leading: Icon(IconsApp.credit_card),
                title: Text('Cartão Debito', style: TextStyle(fontSize: 18)),
                trailing: Switch(
                    activeColor: Colors.green,
                    value: perfilController.minhaHorta.cartaoDebito,
                    onChanged: perfilController.changeCartaoDebito),
              );
            },
          ),
          Observer(
            builder: (_) {
              return ListTile(
                leading: Icon(IconsApp.credit_card_alt),
                title: Text('Cartão Credito', style: TextStyle(fontSize: 18)),
                trailing: Switch(
                    activeColor: Colors.green,
                    value: perfilController.minhaHorta.cartaoCredito,
                    onChanged: perfilController.changeCartaoCredito),
              );
            },
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              AppButtons.flatButtonIconSave(() {
                perfilController.saveHortaPerfil().then((onValue) async {
                  await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CupertinoAlertDialog(
                            title: Text('Mensagem'),
                            content: Text('Perfil atualizado com successo'));
                      });
                });
              })
            ],
          )
        ],
      ),
    );
  }

  Future<TimeOfDay> _showTimePicker(DateTime initialTime) async {
    return await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(initialTime) ?? TimeOfDay.now(),
      builder: (BuildContext context, Widget child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
          child: child,
        );
      },
    );
  }
}
