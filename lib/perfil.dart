import 'package:flutter/material.dart';
// import 'package:flat_icons_flutter/flat_icons_flutter.dart';

class PerfilScreenPage extends StatefulWidget {
  @override
  _PerfilScreenState createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreenPage> {
  final email = TextEditingController();
  final idade = TextEditingController();
  final cpf = TextEditingController();
  final wpp = TextEditingController();
  final nomeHorta = TextEditingController();
  final sobreMim = TextEditingController();
  bool edit = false;
  TimeOfDay horaStart = TimeOfDay(hour: 8,minute: 0);
  TimeOfDay horaEnd = TimeOfDay(hour: 18,minute: 0);
  void pressEdit() {
    setState(() {
      edit = !edit;
      print('isEdit $edit');
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Icon(
                  Icons.account_circle,
                  color: Colors.grey,
                  size: size.width * 0.15,
                ),
                ConstrainedBox(
                    constraints: BoxConstraints(
                        maxWidth: size.width * 0.8,
                        maxHeight: size.height * 0.25),
                    child: Container(
                      child: Text(
                        'Hector Guerrini Herrera',
                        style: TextStyle(fontSize: 24),
                        textAlign: TextAlign.center,
                      ),
                    )),
              ],
            ),
            Divider(),
            Text('Informações Pessoais',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            Divider(),
            TextField(
              style: TextStyle(fontSize: 18),
              enabled: edit,
              decoration: InputDecoration(
                labelText: 'Idade',
              ),
              controller: idade,
              keyboardType: TextInputType.number,
            ),
            Divider(),
            TextField(
              style: TextStyle(fontSize: 18),
              enabled: edit,
              decoration: InputDecoration(
                labelText: 'CPF',
              ),
              controller: cpf,
              keyboardType: TextInputType.number,
            ),
            Divider(),
            TextField(
              style: TextStyle(fontSize: 18),
              enabled: edit,
              decoration: InputDecoration(
                labelText: 'Whatsapp',
              ),
              controller: wpp,
              keyboardType: TextInputType.phone,
            ),
            Divider(),
            TextField(
              style: TextStyle(fontSize: 18),
              enabled: edit,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
              controller: email,
              keyboardType: TextInputType.emailAddress,
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
              controller: nomeHorta,
            ),
            Divider(),
            TextField(
              style: TextStyle(fontSize: 18),
              enabled: edit,
              decoration: InputDecoration(
                labelText: 'Minha Historia',
              ),
              controller: sobreMim,
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
          ])),
    );
  }
}
