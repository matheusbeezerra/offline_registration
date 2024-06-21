import 'package:app_offline/data/local/database_helper.dart';
import 'package:app_offline/data/models/item.dart';
import 'package:sqflite/sqflite.dart';

class ItemRepository {
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  Future<void> insertItem(Item item) async {
    final db = await _databaseHelper.database;
    await db.insert('items', item.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Item>> getItems() async {
    final db = await _databaseHelper.database;
    final List<Map<String, dynamic>> maps = await db.query('items');
    return List.generate(maps.length, (i) {
      return Item.fromMap(maps[i]);
    });
  }

  Future<void> deleteItem(int id) async {
    final db = await _databaseHelper.database;
    await db.delete(
      'items',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
