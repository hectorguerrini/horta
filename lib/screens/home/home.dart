import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:horta/main.dart';
import 'package:horta/screens/consumidor/listaHortas.dart';
import 'package:horta/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:horta/models/user.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with RouteAware {
  User user;
  int _selectedIndex = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();    
    routeObserver.subscribe(this, ModalRoute.of(context));
  }
  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }
  @override
  void didPush() {    
  }
  @override
  void didPopNext() {
    setState(() {
      _selectedIndex = 0;
    });
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 1 && User.uid != null) {        
        Navigator.pushNamed(context, '/menuAgricultor');
      }
      else if (_selectedIndex == 2 && user != null) {        
        Navigator.pushNamed(context, '/perfil');
      }
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
    user = Provider.of<User>(context);    
    final _auth = AuthService();
    return Scaffold(
        appBar: AppBar(
          title: Text('Welcome'),
          actions: <Widget>[
            user != null ? 
            FlatButton.icon(
              onPressed: () async {
                await _auth.signOut();
                Navigator.pushNamed(context, '/auth');
              },
              icon: Icon(Icons.person),
              label: Text('Sair'),
              textColor: Colors.white,
            )
            :
            Container()
          ],
        ),
        body: pageMain(),        
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home), 
              title: Text('Home')
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu), 
              title: Text('Menu')
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              title: Text('Perfil')
            )
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped
        ));
  }
}
