import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:horta/icons_app_icons.dart';
import 'package:horta/models/perfil.dart';
import 'package:horta/services/database.dart';

class PerfilScreenPage extends StatefulWidget {
  @override
  _PerfilScreenState createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreenPage> {
  final nomeCtrl = TextEditingController();
  final idadeCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final wppCtrl = TextEditingController();
  final cpfCtrl = TextEditingController();
  final hortaCtrl = TextEditingController();
  final historiaCtrl = TextEditingController();

  Perfil perfil;
  FirebaseUser user;

  bool edit = false;
  TimeOfDay horaStart = TimeOfDay(hour: 8, minute: 0);
  TimeOfDay horaEnd = TimeOfDay(hour: 18, minute: 0);
  DateTime today = DateTime.now();
  @override
  void initState() {
    super.initState();
    perfil = new Perfil();
    getPerfil();
  }

  void getPerfil() async {
    user = await FirebaseAuth.instance.currentUser();

    DatabaseService(uid: user.uid).getUserPerfil().then((value) {
      setState(() {
        perfil = Perfil.fromJson(value.data);
        nomeCtrl.text = perfil.nome;
        idadeCtrl.text = perfil.idade.toString();
        emailCtrl.text = perfil.email;
        wppCtrl.text = perfil.wpp;
        cpfCtrl.text = perfil.cpf;
        hortaCtrl.text = perfil.nomeHorta;
        historiaCtrl.text = perfil.minhaHistoria;
        DateTime t1 = DateTime.fromMillisecondsSinceEpoch(
            perfil.abertura.millisecondsSinceEpoch);
        horaStart = TimeOfDay.fromDateTime(t1);
        DateTime t2 = DateTime.fromMillisecondsSinceEpoch(
            perfil.fechamento.millisecondsSinceEpoch);
        horaEnd = TimeOfDay.fromDateTime(t2);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Meu Perfil'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              setState(() {
                edit = !edit;
                print('isEdit $edit');
              });
            },
            icon: Icon(Icons.edit),
          )
        ],
      ),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: ListView(children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(
                  Icons.account_circle,
                  color: Colors.grey,
                  size: size.width * 0.15,
                ),
                Container(
                    width: size.width * 0.75,
                    height: size.height * 0.1,
                    alignment: Alignment.center,
                    constraints: BoxConstraints(
                      maxWidth: size.width * 0.8,
                      maxHeight: size.height * 0.1,
                    ),
                    child: Container(
                      child: Text(
                        (this.perfil.nome ?? ''),
                        style: TextStyle(fontSize: 24),
                        textAlign: TextAlign.center,
                      ),
                    )),
              ],
            ),
            Divider(),
            Text(perfil.email ?? '', style: TextStyle(fontSize: 22)),
            Divider(),
            Text('Informações Pessoais',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            Divider(),
            TextFormField(
              style: TextStyle(fontSize: 18),
              enabled: edit,
              decoration: InputDecoration(
                labelText: 'Nome Completo',
              ),
              keyboardType: TextInputType.text,
              controller: nomeCtrl,
              onChanged: (val) {
                setState(() {
                  perfil.nome = val;
                });
              },
            ),
            Divider(),
            TextFormField(
              style: TextStyle(fontSize: 18),
              enabled: edit,
              decoration: InputDecoration(
                labelText: 'Idade',
              ),
              keyboardType: TextInputType.number,
              controller: idadeCtrl,
              onChanged: (val) {
                setState(() {
                  perfil.idade = int.parse(val);
                });
              },
            ),
            Divider(),
            TextFormField(
              style: TextStyle(fontSize: 18),
              enabled: edit,
              decoration: InputDecoration(
                labelText: 'CPF',
              ),
              keyboardType: TextInputType.number,
              controller: cpfCtrl,
              onChanged: (val) {
                setState(() {
                  perfil.cpf = val;
                });
              },
            ),
            Divider(),
            TextFormField(
              style: TextStyle(fontSize: 18),
              enabled: edit,
              decoration: InputDecoration(
                labelText: 'Whatsapp',
              ),
              keyboardType: TextInputType.phone,
              controller: wppCtrl,
              onChanged: (val) {
                setState(() {
                  perfil.wpp = val;
                });
              },
            ),
            Divider(),
            Text('Informações da Horta',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            Divider(),
            TextField(
              style: TextStyle(fontSize: 18),
              enabled: edit,
              decoration: InputDecoration(
                labelText: 'Nome da Horta',
              ),
              controller: hortaCtrl,
              onChanged: (val) {
                setState(() {
                  perfil.nomeHorta = val;
                });
              },
            ),
            Divider(),
            TextField(
              style: TextStyle(fontSize: 18),
              enabled: edit,
              decoration: InputDecoration(
                labelText: 'Minha Historia',
              ),
              maxLines: null,
              keyboardType: TextInputType.multiline,
              controller: historiaCtrl,
              onChanged: (val) {
                setState(() {
                  perfil.minhaHistoria = val;
                });
              },
            ),
            Divider(),
            Text('Horario de Funcionamento',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.timer),
                  onPressed: () => showTimePicker(
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
                  ).then((time) => {
                        setState(() {
                          debugPrint('Time:' + time.toString());
                          TimeOfDay t = time == null ? horaStart : time;
                          DateTime date = DateTime(today.year, today.month,
                              today.day, t.hour, t.minute);
                          perfil.abertura = Timestamp.fromDate(date);
                          horaStart = time;
                        })
                      }),
                ),
                Text(
                    'Abre as: ' +
                        (horaStart == null ? '' : horaStart.format(context)),
                    style: TextStyle(fontSize: 18))
              ],
            ),
            Divider(),
            Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.timer),
                  onPressed: () => showTimePicker(
                    context: context,
                    initialTime: horaEnd,
                    builder: (BuildContext context, Widget child) {
                      return MediaQuery(
                        data: MediaQuery.of(context)
                            .copyWith(alwaysUse24HourFormat: false),
                        child: child,
                      );
                    },
                  ).then((time) {
                    setState(() {
                      debugPrint('TimeEnd:' + time.toString());
                      TimeOfDay t = time == null ? horaEnd : time;
                      DateTime date = DateTime(
                          today.year, today.month, today.day, t.hour, t.minute);
                      perfil.fechamento = Timestamp.fromDate(date);
                      horaEnd = time;
                    });
                  }),
                ),
                Text('Fecha as: ' + horaEnd.format(context),
                    style: TextStyle(fontSize: 18))
              ],
            ),
            Divider(),
            Text('Formas de Pagamento',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(flex: 1, child: Icon(IconsApp.money)),
                Expanded(
                    flex: 4,
                    child: Text('Dinheiro', style: TextStyle(fontSize: 18))),
                Expanded(
                  flex: 1,
                  child: Switch(
                    onChanged: (value) => {
                      setState(() {
                        perfil.dinheiro = value;
                      })
                    },
                    value: perfil.dinheiro,
                  ),
                )
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(flex: 1, child: Icon(IconsApp.credit_card)),
                Expanded(
                    flex: 4,
                    child:
                        Text('Cartao Debito', style: TextStyle(fontSize: 18))),
                Expanded(
                  flex: 1,
                  child: Switch(
                    onChanged: (value) => {
                      setState(() {
                        perfil.cartaoDebito = value;
                      })
                    },
                    value: perfil.cartaoDebito,
                  ),
                )
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(flex: 1, child: Icon(IconsApp.credit_card_alt)),
                Expanded(
                    flex: 4,
                    child:
                        Text('Cartao Credito', style: TextStyle(fontSize: 18))),
                Expanded(
                  flex: 1,
                  child: Switch(
                      onChanged: (value) => {
                            setState(() {
                              perfil.cartaoCredito = value;
                            })
                          },
                      value: perfil.cartaoCredito),
                )
              ],
            ),
            Divider(),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton.icon(
                    onPressed: () async {
                      await DatabaseService(uid: user.uid)
                          .updateUserPerfil(perfil);
                      await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return CupertinoAlertDialog(
                                title: Text('Mensagem'),
                                content:
                                    Text('Perfil atualizado com successo'));
                          });
                      edit = false;
                    },
                    icon: Icon(Icons.save),
                    label: Text('Salvar'),
                    color: Colors.white,
                    textColor: Colors.green,                    
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(color: Colors.green)  
                      )
                    ),
              ],
            )
          ])),
    );
  }
}
