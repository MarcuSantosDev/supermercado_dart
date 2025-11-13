import '../models/venda.dart';

class VendaRepository {
  final List<Venda> _vendas = [];

  List<Venda> getAll() => List.unmodifiable(_vendas);

  void add(Venda venda) => _vendas.add(venda);

  Venda getById(int id) {
    return _vendas.firstWhere((v) => v.id == id,
        orElse: () => throw Exception('Venda não encontrada'));
  }
}
