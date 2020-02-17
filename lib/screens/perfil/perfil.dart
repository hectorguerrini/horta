import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:horta/icons_app_icons.dart';
import 'package:horta/models/perfil.dart';
import 'package:horta/services/database.dart';
import 'package:provider/provider.dart';
import 'package:horta/models/user.dart';

class PerfilScreenPage extends StatefulWidget {
  @override
  _PerfilScreenState createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreenPage> {
  Perfil perfil = new Perfil();


  bool edit = false;
  TimeOfDay horaStart = TimeOfDay(hour: 8,minute: 0);
  TimeOfDay horaEnd = TimeOfDay(hour: 18,minute: 0);
  bool dinheiro = false;
  bool cardDebito = false;
  bool cardCredito = false;
  void pressEdit() {
    setState(() {
      edit = !edit;
      print('isEdit $edit');
    });
  }
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final user = Provider.of<User>(context);
    
    DatabaseService(uid: user.uid).getUserPerfil().then((value) {
    
      setState(() {
        perfil = Perfil.fromJson(value.data);  
      });      

    });

    
    return Scaffold(
      appBar: AppBar(
        title: Text('Meu Perfil'),
        actions: <Widget>[
          IconButton(
            onPressed: pressEdit,
            icon: Icon(Icons.edit),
          )
        ],
      ),
      body: Container(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
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
                      (perfil.nome ?? ''),
                      style: TextStyle(fontSize: 24),
                      textAlign: TextAlign.center,
                    ),
                  )
                ),
              ],
            ),
            Divider(),
            Text(
              perfil.email ?? '',
              style: TextStyle(fontSize: 22)
            ),
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
                    initialTime: horaStart == null ? TimeOfDay.now() : horaStart,
                    builder: (BuildContext context, Widget child) {
                      return MediaQuery(
                        data: MediaQuery.of(context)
                            .copyWith(alwaysUse24HourFormat: false),
                        child: child,
                      );
                    },
                  ).then((time) => {
                    setState(() {
                      debugPrint('Time:'+time.toString());                      
                      horaStart = time == null ? horaStart : time;
                    })
                  }),
                ),
                Text(
                  'Abre as: ' + (horaStart == null ? '' : horaStart.format(context)) ,
                  style: TextStyle(fontSize: 18)
                )
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
                  ),
                ),
                Text('Fecha as: ' + horaEnd.format(context), style: TextStyle(fontSize: 18))
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
                Expanded( flex: 1 ,child: Icon(IconsApp.money)),
                Expanded( flex: 4 ,child: Text('Dinheiro', style: TextStyle(fontSize: 18))),                
                Expanded(
                  flex: 1,
                  child: Switch(
                    onChanged: (value) => {
                      setState(()=>{
                        dinheiro = value
                      })
                    },
                    value: dinheiro,
                  ),
                )
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded( flex: 1 ,child: Icon(IconsApp.credit_card)),
                Expanded( flex: 4 ,child: Text('Cartao Debito', style: TextStyle(fontSize: 18))),                
                Expanded(
                  flex: 1,
                  child: Switch(
                    onChanged: (value) => {
                      setState(()=>{
                        cardDebito = value
                      })
                    },
                    value: cardDebito,
                  ),
                )
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded( flex: 1 ,child: Icon(IconsApp.credit_card_alt)),
                Expanded( flex: 4 ,child: Text('Cartao Credito', style: TextStyle(fontSize: 18))),                
                Expanded(
                  flex: 1,
                  child: Switch(
                    onChanged: (value) => {
                      setState(()=>{
                        cardCredito = value
                      })
                    },
                    value: cardCredito,
                  ),
                )
              ],
            ) 
          ])),
    );
  }
}
