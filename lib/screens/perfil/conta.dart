import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:horta/components/buttons.dart';
import 'package:horta/components/formfield.dart';
import 'package:horta/screens/perfil/perfil_controller.dart';
import 'package:provider/provider.dart';

class ContaScreen extends StatefulWidget {
  @override
  _ContaScreenState createState() => _ContaScreenState();
}

class _ContaScreenState extends State<ContaScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final PerfilController perfilController =
        Provider.of<PerfilController>(context);
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text("Conta"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: <Widget>[
          FormFieldCustom(
              labelText: 'Nome Completo',
              controller: perfilController.nomeCtrl,
              onChanged: perfilController.changeNome),
          Divider(),
          FormFieldCustom(
              labelText: 'CPF',
              controller: perfilController.cpfCtrl,
              onChanged: perfilController.changeCpf,
              keyboardType: TextInputType.number),
          Divider(),
          FormFieldCustom(
              labelText: 'Telefone',
              controller: perfilController.wppCtrl,
              onChanged: perfilController.changeWpp,
              keyboardType: TextInputType.number),
          Divider(),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              AppButtons.flatButtonIconSave(() {
                perfilController.savePerfil().then((onValue) async {
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
}
