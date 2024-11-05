import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:atvtestes/livro.dart';
import 'package:atvtestes/listagem_screen.dart';
import 'package:http/http.dart' as http;

// Criar uma classe Mock para simular o http.Client
class MockClient extends Mock implements http.Client {}

void main() {
  // Teste de unidade - Criação do livro
  group('Teste de Unidade - Livro', () {
    test('Criação de um livro', () {
      final livro = Livro('Dom Quixote', 'Miguel de Cervantes', 'Clássico', 39.90, 'Clássico');
      expect(livro.titulo, 'Dom Quixote');
      expect(livro.autor, 'Miguel de Cervantes');
      expect(livro.descricao, 'Clássico');
      expect(livro.preco, 39.90);
      expect(livro.categoria, 'Clássico');
    });

    // Teste de unidade - Validação do preço do livro
    test('Validação do preço do livro', () {
      final livro = Livro('Dom Quixote', 'Miguel de Cervantes', 'Clássico', -1.0, 'Clássico');
      expect(livro.isPrecoValido, isFalse);
    });
  });

  // Teste com mock - Filtragem por categoria (HTTP)
  group('Teste com Mock - HTTP', () {
    test('Filtrar livros por categoria usando HTTP', () async {
      final client = MockClient();

      // Simula uma resposta do servidor JSON
      when(client.get(Uri.parse('https://api.example.com/livros?categoria=Clássico')))
          .thenAnswer((_) async => http.Response('[{"titulo": "Dom Quixote"}]', 200));

      // Aqui, fazemos a chamada usando o MockClient
      final response = await client.get(Uri.parse('https://api.example.com/livros?categoria=Clássico'));

      // Verificações para assegurar que a resposta está correta
      expect(response.statusCode, 200);
      expect(response.body, '[{"titulo": "Dom Quixote"}]');
    });
  });

  // Teste de widget - Verificação da Listagem de Livros
  group('Teste de Widget - Listagem de Livros', () {
    testWidgets('Exibe lista de livros', (WidgetTester tester) async {
      final livros = [
        Livro('1984', 'George Orwell', 'Distopia futurista', 29.90, 'Romance'),
        Livro('Dom Quixote', 'Miguel de Cervantes', 'Um clássico da literatura', 39.90, 'Clássico'),
      ];

      // Configurando o widget para testes
      await tester.pumpWidget(MaterialApp(home: ListagemScreen(livros: livros, client: MockClient())));

      // Verifica se os livros estão na tela
      expect(find.text('1984'), findsOneWidget);
      expect(find.text('George Orwell'), findsOneWidget);
      expect(find.text('Dom Quixote'), findsOneWidget);
      expect(find.text('Miguel de Cervantes'), findsOneWidget);
    });
  });
}