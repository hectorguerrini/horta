import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:horta/main.dart';
import 'package:horta/models/horta.dart';
import 'package:horta/models/icons_app_icons.dart';
import 'package:horta/models/user.dart';
import 'package:horta/services/database.dart';
import 'package:provider/provider.dart';

class MinhaHortaScreen extends StatefulWidget {
  @override
  _MinhaHortaScreenState createState() => _MinhaHortaScreenState();
}

class _MinhaHortaScreenState extends State<MinhaHortaScreen> with RouteAware {
  final TextEditingController nomeHortaCtrl = new TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  Horta minhaHorta;
  TimeOfDay horaStart;
  TimeOfDay horaEnd;
  DateTime today = DateTime.now();
  @override
  void initState() {
    super.initState();
    minhaHorta = new Horta();
    getHorta();
  }

  void getHorta() {
    DatabaseService(uid: User.uid).gethortaPerfil().then((value) {
      setState(() {
        minhaHorta = Horta.fromJson(value.data);
        nomeHortaCtrl.text = minhaHorta.nomeHorta ?? '';
      });
    });
  }

  bool edit = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text("Minha Horta")),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: <Widget>[
          (edit
              ? ListTile(
                  leading:
                      Text("Nome da Horta", style: TextStyle(fontSize: 18)),
                  title: TextFormField(
                      controller: nomeHortaCtrl,
                      onChanged: (val) {
                        setState(() {
                          minhaHorta.nomeHorta = val;
                        });
                      }),
                  subtitle: Text(''),
                  trailing: Icon(Icons.check_circle_outline),
                  onTap: () {
                    setState(() {
                      edit = false;
                    });
                  },
                )
              : ListTile(
                  title: Text("Nome da Horta", style: TextStyle(fontSize: 18)),
                  subtitle: Text(minhaHorta.nomeHorta == null
                      ? ''
                      : minhaHorta.nomeHorta.toUpperCase()),
                  trailing: Icon(Icons.edit),
                  onTap: () {
                    setState(() {
                      edit = true;
                    });
                  },
                )),
          Divider(),
          ListTile(
            title: Text("Nome da Horta", style: TextStyle(fontSize: 18)),
            subtitle: Text(minhaHorta.minhaHistoria == null
                ? ''
                : minhaHorta.nomeHorta.toUpperCase()),
            trailing: Icon(Icons.edit),
            onTap: () {},
          ),
          Divider(),
          Text('Horario de Funcionamento',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Divider(),
          ListTile(
            leading: Icon(Icons.timer),
            title: Text("Horario de abertura"),
            subtitle:
                Text((horaStart == null ? '' : horaStart.format(context))),
            trailing: FlatButton(              
              child: Text("Editar"),
              color: Colors.transparent,
              onPressed: () async {
                TimeOfDay time = await showTimePicker(
                    context: context,
                    initialTime:
                        horaStart == null ? TimeOfDay.now() : horaStart,
                    builder: (BuildContext context, Widget child) {
                      return MediaQuery(
                        data: MediaQuery.of(context)
                            .copyWith(alwaysUse24HourFormat: false),
                        child: child,
                      );
                    },
                  );
                setState(() {                  
                  TimeOfDay t = time == null ? horaStart : time;
                  DateTime date = DateTime(today.year, today.month,
                      today.day, t.hour, t.minute);
                  //minhaHorta.abertura = Timestamp.fromDate(date);
                  horaStart = time;
                });
              },
            ),
          ),
          ListTile(
            leading: Icon(Icons.timer_off),
            title: Text("Horario de Fechamento"),
            subtitle:
                Text((horaEnd == null ? '' : horaEnd.format(context))),
            trailing: FlatButton(              
              child: Text("Editar"),
              color: Colors.transparent,
              onPressed: () async {
                TimeOfDay time = await showTimePicker(
                    context: context,
                    initialTime:
                        horaEnd == null ? TimeOfDay.now() : horaEnd,
                    builder: (BuildContext context, Widget child) {
                      return MediaQuery(
                        data: MediaQuery.of(context)
                            .copyWith(alwaysUse24HourFormat: false),
                        child: child,
                      );
                    },
                  );
                setState(() {                  
                  TimeOfDay t = time == null ? horaEnd : time;
                  DateTime date = DateTime(today.year, today.month,
                      today.day, t.hour, t.minute);
                  //minhaHorta.abertura = Timestamp.fromDate(date);
                  horaEnd = time;
                });
                
              },
            ),
          ),
          Divider(),
          Text('Formas de Pagamento',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Divider(),
          ListTile(
            leading: Icon(IconsApp.money),
            title: Text('Dinheiro', style: TextStyle(fontSize: 18)),
            trailing: Switch(
              activeColor: Colors.green,
              onChanged: (value) => {
                setState(() {
                  minhaHorta.dinheiro = value;
                })
              },
              value: minhaHorta.dinheiro,
            ),
          ),
          ListTile(
            leading: Icon(IconsApp.credit_card),
            title: Text('Cartão Debito', style: TextStyle(fontSize: 18)),
            trailing: Switch(
              activeColor: Colors.green,
              onChanged: (value) => {
                setState(() {
                  minhaHorta.cartaoDebito = value;
                })
              },
              value: minhaHorta.cartaoDebito,
            ),
          ),
          ListTile(
            leading: Icon(IconsApp.credit_card_alt),
            title: Text('Cartão Credito', style: TextStyle(fontSize: 18)),
            trailing: Switch(
              activeColor: Colors.green,
              onChanged: (value) => {
                setState(() {
                  minhaHorta.cartaoCredito = value;
                })
              },
              value: minhaHorta.cartaoCredito,
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton.icon(
                  onPressed: () async {
                    await DatabaseService(uid: User.uid)
                        .updateHortaPerfil(minhaHorta);
                    await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CupertinoAlertDialog(
                              title: Text('Mensagem'),
                              content: Text('Perfil atualizado com successo'));
                        });
                    edit = false;
                  },
                  icon: Icon(Icons.save),
                  label: Text('Salvar'),
                  color: Colors.white,
                  textColor: Colors.green,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(color: Colors.green))),
            ],
          )
        ],
      ),
    );
  }
}
