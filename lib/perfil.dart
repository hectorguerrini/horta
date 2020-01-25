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
  void pressEdit() {
    setState(() {
      edit = !edit;
      print('isEdit $edit');
    });
  }
  String sobre =
        'parturient montes nascetur ridiculus mus mauris vitae ultricies leo integer malesuada nunc vel risus commodo viverra maecenas accumsan lacus vel facilisis volutpat est velit egestas dui id ornare arcu odio ut sem nulla pharetra diam sit amet nisl suscipit adipiscing bibendum est ultricies integer quis auctor elit sed vulputate mi sit amet mauris commodo quis imperdiet massa tincidunt nunc pulvinar sapien et ligula ullamcorper malesuada proin libero nunc consequat interdum varius sit amet mattis vulputate enim nulla aliquet porttitor lacus luctus accumsan tortor posuere ac ut consequat semper viverra nam libero justo laoreet sit amet cursus sit amet dictum sit';
  void initState() {
    idade.value = TextEditingValue(text: '50');
    cpf.value = TextEditingValue(text: '446.847.728-88');
    sobreMim.value = TextEditingValue(text: sobre);
    super.initState();
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
          ])),
    );
  }
}
