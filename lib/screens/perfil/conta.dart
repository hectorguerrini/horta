import 'package:flutter/material.dart';

import 'package:horta/models/perfil.dart';
import 'package:horta/models/user.dart';
import 'package:horta/screens/bottomSheet.dart';

import 'package:horta/services/database.dart';

class ContaScreen extends StatefulWidget {
  @override
  _ContaScreenState createState() => _ContaScreenState();
}

class _ContaScreenState extends State<ContaScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  Perfil perfil;
  @override
  void initState() {
    super.initState();
    perfil = new Perfil();    
    getPerfil();
  }

  void getPerfil() async {            
    
    // AppService(context: context).showLoading();
    DatabaseService(uid: User.uid).getUserPerfil().then((value) {
      setState(() {
        perfil = Perfil.fromJson(value.data);        
       
      });
        // AppService().closeLoading();
    });
  }


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
            title: Text("Nome Completo",
              style: TextStyle(fontSize: 18)),
            subtitle: Text(perfil.nome.toUpperCase()),
            trailing: Icon(Icons.edit),    
            onTap: () {
              scaffoldKey.currentState.showBottomSheet(
                (BuildContext context) => BottomSheetWidget(),
                
              );
            },
          ),
          Divider(),
          ListTile(
            title: Text("Idade",
              style: TextStyle(fontSize: 18)),
            subtitle: Text(perfil.idade == null ? 'N/A' : perfil.idade.toString()),
            trailing: Icon(Icons.edit),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            title: Text("CPF",
              style: TextStyle(fontSize: 18)),
            subtitle: Text(perfil.cpf ?? ''),
            trailing: Icon(Icons.edit),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            title: Text("Whatsapp",
              style: TextStyle(fontSize: 18)),
            subtitle: Text(perfil.wpp ?? ''),
            trailing: Icon(Icons.edit),
            onTap: () {},
          ),
        ],
      ) ,
    );
  }
}

// TextFormField(
//   style: TextStyle(fontSize: 18),
//   enabled: edit,
//   decoration: InputDecoration(
//     labelText: 'Nome Completo',
//   ),
//   keyboardType: TextInputType.text,
//   controller: nomeCtrl,
//   onChanged: (val) {
//     setState(() {
//       perfil.nome = val;
//     });
//   },
// ),
// Divider(),
// TextFormField(
//   style: TextStyle(fontSize: 18),
//   enabled: edit,
//   decoration: InputDecoration(
//     labelText: 'Idade',
//   ),
//   keyboardType: TextInputType.number,
//   controller: idadeCtrl,
//   onChanged: (val) {
//     setState(() {
//       perfil.idade = int.parse(val);
//     });
//   },
// ),
// Divider(),
// TextFormField(
//   style: TextStyle(fontSize: 18),
//   enabled: edit,
//   decoration: InputDecoration(
//     labelText: 'CPF',
//   ),
//   keyboardType: TextInputType.number,
//   controller: cpfCtrl,
//   onChanged: (val) {
//     setState(() {
//       perfil.cpf = val;
//     });
//   },
// ),
// Divider(),
// TextFormField(
//   style: TextStyle(fontSize: 18),
//   enabled: edit,
//   decoration: InputDecoration(
//     labelText: 'Whatsapp',
//   ),
//   keyboardType: TextInputType.phone,
//   controller: wppCtrl,
//   onChanged: (val) {
//     setState(() {
//       perfil.wpp = val;
//     });
//   },
// ),