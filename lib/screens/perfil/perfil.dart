import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:horta/screens/perfil/perfil_controller.dart';
import 'package:horta/services/app.dart';
import 'package:horta/services/perfil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:horta/auth_controller.dart';

class PerfilScreenPage extends StatefulWidget {
  @override
  _PerfilScreenState createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreenPage> {
  // File _image;
  // Future getImageGaleria() async {
  //   var image = await ImagePicker.pickImage(source: ImageSource.gallery);
  //   AppService(context: context).showLoading();
  //   setState(() {
  //     _image = image;
  //     PerfilService(uid: User.uid).updatePhoto(_image).then((onValue) {
  //       Navigator.pop(context);
  //       showDialog(
  //           context: context,
  //           builder: (BuildContext context) {
  //             return CupertinoAlertDialog(
  //                 title: Text('Mensagem'),
  //                 content: Text('Foto de perfil atualizado com successo'));
  //           });
  //     });
  //   });
  // }

  // Future getImageCamera() async {
  //   var image = await ImagePicker.pickImage(source: ImageSource.camera);
  //   AppService(context: context).showLoading();
  //   setState(() {
  //     _image = image;
  //     PerfilService(uid: User.uid).updatePhoto(_image).then((onValue) {
  //       Navigator.pop(context);
  //       showDialog(
  //           context: context,
  //           builder: (BuildContext context) {
  //             return CupertinoAlertDialog(
  //                 title: Text('Mensagem'),
  //                 content: Text('Foto de perfil atualizado com successo'));
  //           });
  //     });
  //   });
  // }

  Future actionSheetModel(BuildContext context) async {
    await showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return CupertinoActionSheet(
            title: Text('Editar Foto'),
            cancelButton: CupertinoActionSheetAction(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            actions: <Widget>[
              CupertinoActionSheetAction(
                  onPressed: () {
                    // getImageGaleria();
                    Navigator.pop(context);
                  },
                  child: Text('Galeria')),
              CupertinoActionSheetAction(
                  onPressed: () {
                    // getImageCamera();
                    Navigator.pop(context);
                  },
                  child: Text('Camera'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final authController = Provider.of<AuthController>(context);
    final perfilController = Provider.of<PerfilController>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Meu Perfil'),
      actions: <Widget>[
            FlatButton.icon(
              onPressed: () async {
                await authController.signOut();
              },
              icon: Icon(Icons.person),
              label: Text('Sair'),
              textColor: Colors.white,
            )
          ],),
      
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
                      backgroundImage: perfilController.image != null
                          ? FileImage(perfilController.image)
                          : (authController.photoUrl != null
                              ? NetworkImage(authController.photoUrl)
                              : AssetImage('assets/account.png')),
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
                            await actionSheetModel(context);
                          },
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                ListTile(
                  title: Text(
                    (authController.displayName ?? ''),
                    style: TextStyle(fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
                  subtitle: Text(
                    authController.email ?? '',
                    style: TextStyle(fontSize: 22),
                    textAlign: TextAlign.center,
                  ),
                )
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
              onTap: () {
                Navigator.pushNamed(context, '/perfil/conta');
              },
            ),
            Divider(),
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
              onTap: () {
                Navigator.pushNamed(context, '/perfil/horta');
              },
            ),
            Divider()
          ])),
    );
  }
}
