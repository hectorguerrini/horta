import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:horta/formfield.dart';
import 'package:horta/models/horta.dart';
import 'package:horta/models/icons_app_icons.dart';
import 'package:horta/models/user.dart';
import 'package:horta/services/database.dart';

class MinhaHortaScreen extends StatefulWidget {
  @override
  _MinhaHortaScreenState createState() => _MinhaHortaScreenState();
}

class _MinhaHortaScreenState extends State<MinhaHortaScreen> with RouteAware {
  final TextEditingController nomeHortaCtrl = new TextEditingController();
  final TextEditingController minhaHistoriaCtrl = new TextEditingController();
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
        nomeHortaCtrl.text = minhaHorta.nomeHorta;
        minhaHistoriaCtrl.text = minhaHorta.minhaHistoria;
        horaStart = minhaHorta.abertura != null ? TimeOfDay.fromDateTime(minhaHorta.abertura.toDate()) : null;        
        horaEnd = minhaHorta.fechamento != null ? TimeOfDay.fromDateTime(minhaHorta.fechamento.toDate()) : null;
      });
    });
  }

  bool editNomeHorta = false;
  bool editMinhaHistoria = false;
  @override
  Widget build(BuildContext context) {    
    return Scaffold(
      appBar: AppBar(title: Text("Minha Horta")),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: <Widget>[
          ListTile(
            title: FormFieldsCustom.animatedForm('Nome da Horta', this.editNomeHorta, 12, 18),
            subtitle: this.editNomeHorta
              ? TextFormField(
                  controller: nomeHortaCtrl,
                  onChanged: (value) {
                    setState(() {
                      this.minhaHorta.nomeHorta = value;
                    });
                  })
              : Text(this.minhaHorta.nomeHorta.toUpperCase()),
            trailing: IconButton(
              icon: this.editNomeHorta
                  ? Icon(Icons.check_circle_outline)
                  : Icon(Icons.edit),
              onPressed: () {
                setState(() {
                  this.editNomeHorta = !this.editNomeHorta;
                });
              })
          ),
          Divider(),
          ListTile(
            title: FormFieldsCustom.animatedForm('Minha Historia', this.editMinhaHistoria, 12, 18),
            subtitle: this.editMinhaHistoria
              ? TextFormField(
                  controller: minhaHistoriaCtrl,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  onChanged: (value) {
                    setState(() {
                      this.minhaHorta.minhaHistoria = value;
                    });
                  })
              : Text(this.minhaHorta.minhaHistoria.toUpperCase()),        
            trailing: IconButton(
              icon: this.editMinhaHistoria
                  ? Icon(Icons.check_circle_outline)
                  : Icon(Icons.edit),
              onPressed: () {
                setState(() {
                  this.editMinhaHistoria = !this.editMinhaHistoria;
                });
              })            
          ),
          Divider(),
          Text('Horario de Funcionamento',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Divider(),
          ListTile(
            leading: Icon(Icons.timer),
            title: Text("Horario de abertura"),
            subtitle:
                Text((horaStart == null ? 'Sem Horario' : horaStart.format(context))),
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
                  minhaHorta.abertura = Timestamp.fromDate(date);
                  horaStart = time;
                });
              },
            ),
          ),
          ListTile(
            leading: Icon(Icons.timer_off),
            title: Text("Horario de Fechamento"),
            subtitle:
                Text((horaEnd == null ? 'Sem Horario' : horaEnd.format(context))),
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
                  minhaHorta.fechamento = Timestamp.fromDate(date);
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
                    this.editNomeHorta = false;
                    this.editMinhaHistoria = false;
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
