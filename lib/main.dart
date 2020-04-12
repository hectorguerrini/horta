import 'package:flutter/material.dart';
import 'package:horta/screens/authenticate/authenticate.dart';
import 'package:horta/screens/consumidor/detalheHorta.dart';
import 'package:horta/screens/home/home.dart';
import 'package:horta/screens/listaProdutos.dart';
import 'package:horta/screens/menuAgricultor.dart';
import 'package:horta/screens/perfil/conta.dart';
import 'package:horta/screens/perfil/minhaHorta.dart';
import 'package:horta/screens/perfil/perfil.dart';
import 'package:horta/services/auth.dart';
import 'package:provider/provider.dart';


void main() => runApp(MyApp());
final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();
class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: AuthService().user,
      child: MaterialApp(
        title: 'Named Routes',
        initialRoute: '/',
        navigatorObservers: [routeObserver],
        routes: {
          // When navigating to the "/" route, build the FirstScreen widget.
          '/': (context) => MenuAgricultorScreen(),          
          // When navigating to the "/second" route, build the SecondScreen widget.          
          '/perfil': (context) => PerfilScreenPage(),          
          '/perfil/conta': (context) => ContaScreen(),
          '/perfil/horta': (context) => MinhaHortaScreen(),
          '/auth': (context) => Authenticate(),
          '/detalhe': (context) => DetalheHorta(),
          '/listaProdutos': (context) => ListaProdutosScreen(),
          '/menuAgricultor': (context) => MenuAgricultorScreen()
        },
        theme: ThemeData(
          primaryColor: Colors.green,
          dividerTheme: DividerThemeData(
            thickness: 1,         
          ),
        ),
      ),
    );
  }
}
