import '../models/cliente.dart';

class ClienteRepository {
  final List<Cliente> _clientes = [];

  List<Cliente> getAll() => List.unmodifiable(_clientes);

  void add(Cliente cliente) => _clientes.add(cliente);

  Cliente getById(int id) {
    return _clientes.firstWhere((c) => c.id == id,
        orElse: () => throw Exception('Cliente não encontrado'));
  }
}
