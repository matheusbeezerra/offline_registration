import 'package:flutter/material.dart';
import 'package:app_offline/data/models/item.dart';

class ItemList extends StatelessWidget {
  final List<Item> items;
  final Function(String) onDeleteItem; // Callback para deletar um item

  const ItemList({required this.items, required this.onDeleteItem, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Dismissible(
          key: Key(item.id), // Usando item.id diretamente como chave
          direction: DismissDirection.endToStart,
          background: Container(
            alignment: AlignmentDirectional.centerEnd,
            color: Colors.red,
            child: const Icon(Icons.delete, color: Colors.white),
          ),
          confirmDismiss: (DismissDirection direction) async {
            return await showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Delete Item'),
                  content:
                      Text('Are you sure you want to delete ${item.name}?'),
                  actions: <Widget>[
                    TextButton(
                      child: const Text('Cancel'),
                      onPressed: () {
                        Navigator.of(context).pop(false); // Não deleta
                      },
                    ),
                    TextButton(
                      child: const Text('Delete'),
                      onPressed: () {
                        Navigator.of(context).pop(true); // Deleta
                      },
                    ),
                  ],
                );
              },
            );
          },
          onDismissed: (DismissDirection direction) {
            onDeleteItem(item.id); // Passando item.id como String
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('${item.name} Deleted')),
            );
          },
          child: ListTile(
            leading: const Icon(Icons.code),
            title: Text(
              'ID: ${item.id}',
              style: const TextStyle(
                  color: Color.fromRGBO(55, 79, 92, 1),
                  fontWeight: FontWeight.bold),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Name: ${item.name}',
                  style: const TextStyle(color: Colors.white),
                ),
                Text(
                  'Description: ${item.description}',
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
