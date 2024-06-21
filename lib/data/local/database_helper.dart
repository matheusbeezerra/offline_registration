import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    try {
      final databasesPath = await getDatabasesPath();
      final path = join(databasesPath, 'app_offline.db');

      return await openDatabase(
        path,
        version: 2, // Incrementar a versão do banco de dados
        onCreate: (db, version) async {
          await db.execute(
            'CREATE TABLE items(id TEXT PRIMARY KEY, title TEXT, description TEXT, name TEXT)',
          );
        },
        onUpgrade: (db, oldVersion, newVersion) async {
          if (oldVersion < newVersion) {
            await db.execute("ALTER TABLE items ADD COLUMN name TEXT");
          }
        },
      );
    } catch (e) {
      print("Erro ao inicializar o banco de dados: $e");
      rethrow;
    }
  }

  // Método para inserir dados
  Future<void> insertItem(Map<String, dynamic> item) async {
    final db = await database;
    await db.insert('items', item, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // Método para consultar dados
  Future<List<Map<String, dynamic>>> getItems() async {
    final db = await database;
    return await db.query('items');
  }
}

void main() async {
  final dbHelper = DatabaseHelper();

  // Inserindo um item (Exemplo)
  await dbHelper.insertItem({
    'id': '1',
    'title': 'Título Exemplo',
    'description': 'Descrição Exemplo',
    'name': 'Nome Exemplo',
  });

  // Consultando itens e exibindo os dados
  List<Map<String, dynamic>> items = await dbHelper.getItems();
  for (var item in items) {
    print('ID: ${item['id']}, Title: ${item['title']}, Description: ${item['description']}, Name: ${item['name']}');
  }
}
