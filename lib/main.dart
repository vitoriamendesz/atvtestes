import 'package:flutter/material.dart';
import 'listagem_screen.dart';
import 'formulario_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Biblioteca Digital',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ListagemScreen(),
      routes: {
        '/listagem': (context) => ListagemScreen(),
        '/formulario': (context) => FormularioScreen(),
      },
    );
  }
}
