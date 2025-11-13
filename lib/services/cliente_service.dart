import '../models/cliente.dart';
import '../repositories/cliente_repository.dart';

class ClienteService {
  final ClienteRepository repository;

  ClienteService(this.repository);

  void cadastrarCliente(String nome, String email) {
    final cliente = Cliente(
      id: repository.getAll().length + 1,
      nome: nome,
      email: email,
    );
    repository.add(cliente);
  }

  List<Cliente> listarClientes() => repository.getAll();

  Cliente getById(int id) => repository.getById(id);
}
