import 'package:flutter/material.dart';
import 'package:app_offline/data/models/item.dart';
import 'package:app_offline/data/repository/item_repository.dart';
import 'package:app_offline/ui/widgets/item_list.dart';

class OfflineDados extends StatelessWidget {
  final ItemRepository _itemRepository = ItemRepository();

  OfflineDados({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Database', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueGrey[500],
      ),
      backgroundColor: Colors.blueGrey[300],
      body: FutureBuilder<List<Item>>(
        future: _itemRepository.getItems(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No items'));
          } else {
            return ItemList(
              items: snapshot.data!,
              onDeleteItem: (itemId) async {
                await _itemRepository
                    .deleteItem(itemId as int);
              },
            );
          }
        },
      ),
    );
  }
}
