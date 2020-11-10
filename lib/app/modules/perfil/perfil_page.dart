import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'perfil_controller.dart';

class PerfilPage extends StatefulWidget {
  final String title;
  const PerfilPage({Key key, this.title = "Perfil"}) : super(key: key);

  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends ModularState<PerfilPage, PerfilController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
          padding:
              EdgeInsets.symmetric(horizontal: size.width * 0.02, vertical: 20),
          child: ListView(children: <Widget>[
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Stack(
                  overflow: Overflow.visible,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.green[600],
                      radius: size.width * 0.2,
                      child: Icon(FontAwesome.user),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                            color: Colors.green[600],
                            borderRadius: BorderRadius.circular(80)),
                        alignment: AlignmentDirectional.center,
                        child: IconButton(
                          icon: Icon(Icons.camera_alt, size: 20),
                          onPressed: () async {
                            // await actionSheetModel(context);
                          },
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                Observer(builder: (_) {
                  return ListTile(
                    title: Text(
                      controller.getUserNome,
                      style: TextStyle(fontSize: 24),
                      textAlign: TextAlign.center,
                    ),
                    subtitle: Text(
                      controller.getUserEmail,
                      style: TextStyle(fontSize: 22),
                      textAlign: TextAlign.center,
                    ),
                  );
                })
              ],
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text(
                'Editar Perfil',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'informações pessoais',
                style: TextStyle(fontSize: 18, color: Colors.black54),
              ),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () => Modular.to.pushNamed('/perfil/conta'),
            ),
            Divider(),
            if (controller.getIsAgricultor)
              ListTile(
                leading: Icon(Icons.info_outline),
                title: Text(
                  'Editar Minha Horta',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  'informações da horta, Forma Pgto, Horario',
                  style: TextStyle(fontSize: 18, color: Colors.black54),
                ),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () => Modular.to.pushNamed('/perfil/horta'),
              ),
            Divider(),
            ListTile(
              leading: Icon(FontAwesome5.map_marker_alt),
              title: Text(
                'Endereço',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'Atualizar Endereço',
                style: TextStyle(fontSize: 18, color: Colors.black54),
              ),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () => Modular.to.pushNamed('/perfil/endereco'),
            ),
            Divider(),
            ListTile(
              leading: Icon(FontAwesome5.sign_out_alt),
              title: Text(
                'Sair da conta',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              onTap: controller.logout,
            )
          ])),
    );
  }
}
