import '../models/produto.dart';

class ProdutoRepository {
  final List<Produto> _produtos = [];

  List<Produto> getAll() => List.unmodifiable(_produtos);

  void add(Produto produto) => _produtos.add(produto);

  Produto getById(int id) {
    return _produtos.firstWhere((p) => p.id == id,
        orElse: () => throw Exception('Produto não encontrado'));
  }

  void update(Produto produto) {
    final index = _produtos.indexWhere((p) => p.id == produto.id);
    if (index == -1) throw Exception('Produto não encontrado');
    _produtos[index] = produto;
  }

  void remove(int id) => _produtos.removeWhere((p) => p.id == id);
}
