import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:horta/buttons.dart';

import 'package:horta/models/perfil.dart';
import 'package:horta/models/user.dart';
import 'package:horta/services/perfil.dart';

class ContaScreen extends StatefulWidget {
  @override
  _ContaScreenState createState() => _ContaScreenState();
}

class _ContaScreenState extends State<ContaScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController nomeCtrl = new TextEditingController();
  Perfil perfil;
  @override
  void initState() {
    super.initState();
    perfil = new Perfil();
    getPerfil();
  }

  void getPerfil() async {
    // AppService(context: context).showLoading();
    PerfilService(uid: User.uid).getUserPerfil().then((value) {
      setState(() {
        perfil = Perfil.fromJson(value.data);
        nomeCtrl.text = perfil.nome;
      });
      // AppService().closeLoading();
    });
  }

  bool edit = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text("Conta"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: <Widget>[
          ListTile(
            leading: edit
                ? Text("Nome Completo", style: TextStyle(fontSize: 18))
                : null,
            title: edit
                ? TextFormField(
                    controller: nomeCtrl,
                    onChanged: (value) {
                      setState(() {
                        perfil.nome = value;
                      });
                    },
                  )
                : Text("Nome Completo", style: TextStyle(fontSize: 18)),
            subtitle: edit ? null : Text(perfil.nome.toUpperCase()),
            trailing:
                edit ? Icon(Icons.check_circle_outline) : Icon(Icons.edit),
            onTap: () {
              setState(() {
                edit = !edit;
              });
            },
          ),
          Divider(),
          ListTile(
            title: Text("Idade", style: TextStyle(fontSize: 18)),
            subtitle:
                Text(perfil.idade == null ? 'N/A' : perfil.idade.toString()),
            trailing: Icon(Icons.edit),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            title: Text("CPF", style: TextStyle(fontSize: 18)),
            subtitle: Text(perfil.cpf ?? ''),
            trailing: Icon(Icons.edit),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            title: Text("Whatsapp", style: TextStyle(fontSize: 18)),
            subtitle: Text(perfil.wpp ?? ''),
            trailing: Icon(Icons.edit),
            onTap: () {},
          ),
          Divider(),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              AppButtons.flatButtonIconSave(() {
                PerfilService(uid: User.uid)
                    .updateUserPerfil(perfil)
                    .then((onValue) async {
                  await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CupertinoAlertDialog(
                            title: Text('Mensagem'),
                            content: Text('Perfil atualizado com successo'));
                      });
                  edit = false;
                });
              })
            ],
          )
        ],
      ),
    );
  }
}
