import 'package:app_offline/data/models/item.dart';
import 'package:app_offline/data/repository/item_repository.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class SyncService {
  final ItemRepository _itemRepository = ItemRepository();
  final List<Item> _pendingItems = [];

  SyncService() {
    _initialize();
  }

  void _initialize() async {
    checkConnectivity();
  }

  void addPendingItem(Item item) {
    _pendingItems.add(item);
    // Salve itens pendentes no armazenamento local se necessário
    print('Item adicionado à lista pendente: ${item.id}');
  }

  Future<void> syncPendingItems() async {
    // Sincronize apenas se houver conectividade
    if (await _isConnected()) {
      for (var item in _pendingItems) {
        // Enviar item para o servidor ou fazer outra ação necessária
        try {
          await _itemRepository.insertItem(item);
          print('Item enviado para o servidor: ${item.id}');
        } catch (e) {
          print('Falha ao enviar item ${item.id}: $e');
        }
      }
      _pendingItems.clear(); // Atualizar armazenamento local se necessário
    }
  }

  Future<bool> _isConnected() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }

  void checkConnectivity() {
    Connectivity()
        .onConnectivityChanged
        .listen((List<ConnectivityResult> results) {
      for (var result in results) {
        if (result == ConnectivityResult.none) {
          print('Desconectado');
        } else {
          print('Conectado');
          syncPendingItems(); // Chamada para sincronizar itens pendentes quando reconectar
        }
      }
    });
  }
}
