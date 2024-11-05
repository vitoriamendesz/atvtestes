import 'package:flutter/material.dart';
import 'livro.dart';
import 'package:http/http.dart' as http;


class ListagemScreen extends StatelessWidget {
  final List<Livro> livros;
  final http.Client client;

  ListagemScreen({required this.livros, required this.client});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Listagem de Livros')),
      body: ListView.builder(
        itemCount: livros.length,
        itemBuilder: (context, index) {
          final livro = livros[index];
          return ListTile(
            title: Text(livro.titulo),
            subtitle: Text(livro.autor),
          );
        },
      ),
    );
  }
}
