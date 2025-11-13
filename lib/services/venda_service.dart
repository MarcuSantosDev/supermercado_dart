import '../models/cliente.dart';
import '../models/venda.dart';
import '../repositories/produto_repository.dart';
import '../repositories/venda_repository.dart';

class VendaService {
  final VendaRepository vendaRepo;
  final ProdutoRepository produtoRepo;

  VendaService(this.vendaRepo, this.produtoRepo);

  void realizarVenda(Cliente cliente, Map<int, int> produtosComQuantidade) {
    final itens = <ItemVenda>[];

    produtosComQuantidade.forEach((idProduto, quantidade) {
      final produto = produtoRepo.getById(idProduto);

      if (produto.estoque < quantidade) {
        throw Exception(
            'Estoque insuficiente para o produto ${produto.nome} (disponível: ${produto.estoque})');
      }


      produtoRepo.update(produto.copyWith(estoque: produto.estoque - quantidade));

      itens.add(ItemVenda(produto: produto, quantidade: quantidade));
    });

    final venda = Venda(
      id: vendaRepo.getAll().length + 1,
      cliente: cliente,
      itens: itens,
      data: DateTime.now(),
    );

    vendaRepo.add(venda);
  }

  List<Venda> listarVendas() => vendaRepo.getAll();
}
