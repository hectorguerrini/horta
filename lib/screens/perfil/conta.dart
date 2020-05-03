import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
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
  final TextEditingController cpfCtrl =
      new MaskedTextController(mask: '000.000.000-00');
  final TextEditingController wppCtrl =
      new MaskedTextController(mask: '(00) 00000-0000');
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
        cpfCtrl.text = perfil.cpf;
        wppCtrl.text = perfil.wpp;
      });
      // AppService().closeLoading();
    });
  }

  Widget animatedForm(String descricao, bool b) {
    return AnimatedDefaultTextStyle(
        style: b
            ? TextStyle(fontSize: 12, color: Colors.black87)
            : TextStyle(fontSize: 18, color: Colors.black87),
        child: Text(descricao),
        duration: Duration(milliseconds: 200),
        curve: Curves.easeIn);
  }

  bool editNome = false;  
  bool editCpf = false;
  bool editWpp = false;
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
              title: this.animatedForm('Nome Completo', this.editNome),
              subtitle: this.editNome
                  ? TextFormField(
                      controller: nomeCtrl,
                      onChanged: (value) {
                        setState(() {
                          this.perfil.nome = value;
                        });
                      })
                  : Text(this.perfil.nome.toUpperCase()),
              trailing: IconButton(
                  icon: this.editNome
                      ? Icon(Icons.check_circle_outline)
                      : Icon(Icons.edit),
                  onPressed: () {
                    setState(() {
                      this.editNome = !this.editNome;
                    });
                  })),
          Divider(),
          ListTile(
              title: this.animatedForm('CPF', this.editCpf),
              subtitle: this.editCpf
                  ? TextFormField(
                      controller: cpfCtrl,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        setState(() {
                          this.perfil.cpf = value;
                        });
                      })
                  : Text(this.perfil.cpf ?? ''),
              trailing: IconButton(
                  icon: this.editCpf
                      ? Icon(Icons.check_circle_outline)
                      : Icon(Icons.edit),
                  onPressed: () {
                    setState(() {
                      this.editCpf = !this.editCpf;
                    });
                  })),
          Divider(),
          ListTile(
              title: this.animatedForm('Telefone', this.editWpp),
              subtitle: this.editWpp
                  ? TextFormField(
                      controller: wppCtrl,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        setState(() {
                          this.perfil.wpp = value;
                        });
                      })
                  : Text(this.perfil.wpp ?? ''),
              trailing: IconButton(
                  icon: this.editCpf
                      ? Icon(Icons.check_circle_outline)
                      : Icon(Icons.edit),
                  onPressed: () {
                    setState(() {
                      this.editWpp = !this.editWpp;
                    });
                  })),
          Divider(),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              AppButtons.flatButtonIconSave(() {
                PerfilService(uid: User.uid)
                    .updateUserPerfil(this.perfil)
                    .then((onValue) async {
                  await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CupertinoAlertDialog(
                            title: Text('Mensagem'),
                            content: Text('Perfil atualizado com successo'));
                      });
                  this.editNome = false;
                  this.editCpf = false;
                  this.editWpp = false;
                });
              })
            ],
          )
        ],
      ),
    );
  }
}
