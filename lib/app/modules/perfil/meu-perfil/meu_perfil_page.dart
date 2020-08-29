import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:horta/app/modules/perfil/meu-perfil/meu_perfil_controller.dart';
import 'package:horta/app/shared/components/formfield_widget.dart';

class MeuPerfilPage extends StatefulWidget {
  final String title;

  const MeuPerfilPage({Key key, this.title = 'Meu Perfil'}) : super(key: key);
  @override
  _MeuPerfilPageState createState() => _MeuPerfilPageState();
}

class _MeuPerfilPageState
    extends ModularState<MeuPerfilPage, MeuPerfilController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        child: ListView(
          children: <Widget>[
            Text('Informações Pessoais',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Divider(),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Observer(builder: (_) {
                return FormFieldWidget(
                  labelText: 'Nome Completo',
                  msgError: !controller.getNomeValid
                      ? 'Nome não pode ser vazio.'
                      : null,
                  controller: controller.nomeCtrl,
                );
              }),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Observer(builder: (_) {
                return FormFieldWidget(
                    labelText: 'CPF',
                    msgError: !controller.getCpfValid ? 'CPF Invalido.' : null,
                    controller: controller.cpfCtrl,
                    onChanged: controller.changeCpf,
                    keyboardType: TextInputType.number);
              }),
            ),
            Text('Dados de Contato',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Divider(),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Observer(builder: (_) {
                return FormFieldWidget(
                    labelText: 'Celular',
                    msgError: !controller.getCelularValid
                        ? 'Numero de telefon invalido.'
                        : null,
                    controller: controller.celularCtrl,
                    onChanged: controller.changeCelular,
                    keyboardType: TextInputType.number);
              }),
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
            // ButtonBar(
            //   alignment: MainAxisAlignment.center,
            //   children: <Widget>[
            //     AppButtons.flatButtonIconSave(() {
            //       perfilController.savePerfil().then((onValue) async {
            //         await showDialog(
            //             context: context,
            //             builder: (BuildContext context) {
            //               return CupertinoAlertDialog(
            //                   title: Text('Mensagem'),
            //                   content: Text('Perfil atualizado com successo'));
            //             });
            //       });
            //     })
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
