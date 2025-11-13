import '../models/produto.dart';
import '../repositories/produto_repository.dart';

class ProdutoService {
  final ProdutoRepository repository;

  ProdutoService(this.repository);

  void cadastrarProduto(String nome, double preco, int estoque) {
    final produto = Produto(
      id: repository.getAll().length + 1,
      nome: nome,
      preco: preco,
      estoque: estoque,
    );
    repository.add(produto);
  }

  void atualizarEstoque(int id, int novoEstoque) {
    final produto = repository.getById(id);
    repository.update(produto.copyWith(estoque: novoEstoque));
  }

  List<Produto> listarProdutos() => repository.getAll();
}
