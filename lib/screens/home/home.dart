import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:horta/auth_controller.dart';
import 'package:horta/screens/consumidor/listaHortas.dart';
import 'package:horta/services/auth.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with RouteAware {
  int _selectedIndex = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void didPopNext() {
    setState(() {
      _selectedIndex = 0;
    });
  }

  Widget pageMain() {
    switch (_selectedIndex) {
      case 0:
        return ListaHortasScreenPage();
        break;
      default:
        return ListaHortasScreenPage();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final authController = Provider.of<AuthController>(context);
    final _auth = AuthService();
    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
        // if (_selectedIndex == 1 && User.uid != null) {
        //   Navigator.pushNamed(context, '/menuAgricultor');
        // }
        if (_selectedIndex == 2 && authController.userLogged == null) {
          Navigator.pushNamed(context, '/auth');
        } else if (_selectedIndex == 2 && authController.userLogged != null) {
          Navigator.pushNamed(context, '/perfil');
        }
      });
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('Welcome'),
          actions: <Widget>[
            FlatButton.icon(
              onPressed: () async {
                await _auth.signOut();
              },
              icon: Icon(Icons.person),
              label: Text('Sair'),
              textColor: Colors.white,
            )
          ],
        ),
        body: pageMain(),
        bottomNavigationBar: Observer(builder: (_) {
          return BottomNavigationBar(items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home), title: Text('Home')),
            BottomNavigationBarItem(
                icon: Icon(Icons.menu), title: Text('Menu')),
            authController.userLogged == null
                ? BottomNavigationBarItem(
                    icon: FaIcon(FontAwesomeIcons.signInAlt),
                    title: Text('Login'))
                : BottomNavigationBarItem(
                    icon: Icon(Icons.account_circle), title: Text('Perfil'))
          ], currentIndex: _selectedIndex, onTap: _onItemTapped);
        }));
  }
}
