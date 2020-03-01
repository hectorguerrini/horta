import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:horta/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:horta/models/user.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  User user;
  int _selectedIndex;
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print('state = $state');
    _selectedIndex = 0;
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 1 && user == null) {        
        Navigator.pushNamed(context, '/auth');
      }
      else if (_selectedIndex == 1 && user != null) {        
        Navigator.pushNamed(context, '/perfil');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    
    user = Provider.of<User>(context);
    final size = MediaQuery.of(context).size;
    final _auth = AuthService();
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
        body: Container(
          padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
          child: Center(
            child: Text('Lista de hortas')
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home), 
              title: Text('Home')
            ),
            user == null
            ? BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.signInAlt),
              title: Text('Login')
            )
            : BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              title: Text('Perfil')
            )
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped
        ));
  }
}
