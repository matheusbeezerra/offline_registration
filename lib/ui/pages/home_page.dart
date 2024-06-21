import 'package:app_offline/data/models/item.dart';
import 'package:app_offline/data/repository/item_repository.dart';
import 'package:app_offline/ui/pages/login_acess_page.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ItemRepository _itemRepository = ItemRepository();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  String _generateId() {
    final now = DateTime.now();
    final formattedDate =
        '${now.year}${now.month.toString().padLeft(2, '0')}${now.day.toString().padLeft(2, '0')}';
    final formattedTime =
        '${now.hour.toString().padLeft(2, '0')}${now.minute.toString().padLeft(2, '0')}${now.second.toString().padLeft(2, '0')}';
    final randomCode = Random().nextInt(10000).toString().padLeft(4, '0');
    return '$formattedDate${formattedTime}_$randomCode';
  }

  void _addItem() async {
    if (_nameController.text.isNotEmpty &&
        _descriptionController.text.isNotEmpty) {
      final newItem = Item(
          id: _generateId(),
          name: _nameController.text,
          description: _descriptionController.text);
      await _itemRepository.insertItem(newItem);
      _nameController.clear();
      _descriptionController.clear();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Offline Registration',
            style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueGrey[600],
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height *
                0.3,
            child: Opacity(
              opacity: 0.9,
              child: Image.asset(
                'assets/images/imagem.jpg',
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                    height:
                        250),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      TextField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                          labelText: 'Full name',
                          icon: Icon(
                            Icons.person_2_rounded,
                            color: Color.fromARGB(255, 105, 138, 155),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: _descriptionController,
                        decoration: const InputDecoration(
                          labelText: 'Positions',
                          icon: Icon(
                            Icons.data_saver_on_sharp,
                            color: Color.fromARGB(255, 105, 138, 155),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton.icon(
                        onPressed: _addItem,
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromRGBO(55, 79, 92, 1)),
                        ),
                        icon: const Icon(Icons.add, color: Colors.white),
                        label: const Text(
                          'Add',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()),
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromRGBO(55, 79, 92, 1)),
                        ),
                        icon: const Icon(Icons.data_usage, color: Colors.white),
                        label: const Text(
                          'Data access',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Developer by MB',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color.fromARGB(255, 105, 138, 155),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
