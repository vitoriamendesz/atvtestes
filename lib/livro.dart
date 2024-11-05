import 'package:atvtestes/livro.dart';

class Livro {
  String titulo;
  String autor;
  String descricao;
  double preco;
  String categoria;

  Livro(this.titulo, this.autor, this.descricao, this.preco, this.categoria);

  bool get isPrecoValido => preco >= 0;
}
