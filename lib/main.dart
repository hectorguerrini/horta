import 'package:flutter/material.dart';
import 'package:horta/screens/agricultor/listaProdutos.dart';
import 'package:horta/screens/agricultor/menuAgricultor.dart';
import 'package:horta/screens/agricultor/menuAgricultor_controller.dart';
import 'package:horta/screens/authenticate/authenticate.dart';
import 'package:horta/screens/consumidor/detalheHorta.dart';
import 'package:horta/screens/consumidor/horta_controller.dart';
import 'package:horta/auth_controller.dart';
import 'package:horta/screens/home/home.dart';
import 'package:horta/screens/perfil/conta.dart';
import 'package:horta/screens/perfil/minhaHorta.dart';
import 'package:horta/screens/perfil/perfil.dart';
import 'package:horta/screens/perfil/perfil_controller.dart';
import 'package:horta/services/consumidor.dart';
import 'package:horta/services/perfil.dart';
import 'package:horta/services/produtos.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());
final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authController = new AuthController();
    return MultiProvider(
      providers: [
        Provider<AuthController>(create: (_) => authController),
        Provider<HortaController>(
            create: (_) => HortaController(ConsumidorService())),
        Provider<PerfilController>(
          create: (_) =>
              PerfilController(PerfilService(uid: authController.getUid)),
          dispose: (_, perfilController) => perfilController.dispose(),
        ),
        Provider<MenuAgricultorController>(
            create: (_) => MenuAgricultorController(
                ProdutosService(uid: authController.getUid)))
      ],
      child: MaterialApp(
        title: 'Named Routes',
        initialRoute: '/',
        navigatorObservers: [routeObserver],
        routes: {
          '/': (context) => HomeScreen(),
          '/perfil': (context) => PerfilScreenPage(),
          '/perfil/conta': (context) => ContaScreen(),
          '/perfil/horta': (context) => MinhaHortaScreen(),
          '/auth': (context) => Authenticate(),
          '/detalhe': (context) => DetalheHorta(),
          '/listaProdutos': (context) => ListaProdutosScreen(),
          '/menuAgricultor': (context) => MenuAgricultorScreen(),
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
