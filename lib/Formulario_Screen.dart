import 'package:flutter/material.dart';

class FormularioScreen extends StatelessWidget {
  final TextEditingController tituloController = TextEditingController();
  final TextEditingController autorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Adicionar Livro')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: tituloController,
              decoration: InputDecoration(labelText: 'Título'),
            ),
            TextField(
              controller: autorController,
              decoration: InputDecoration(labelText: 'Autor'),
            ),
            ElevatedButton(
              onPressed: () {
                // Implementação do botão "Salvar"
                // Adicionar o livro à lista (você pode implementar isso depois)
              },
              child: Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}

